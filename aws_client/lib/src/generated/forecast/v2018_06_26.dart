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

/// Provides APIs for creating and managing Amazon Forecast resources.
class Forecast {
  final _s.JsonProtocol _protocol;
  Forecast({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'forecast',
            signingName: 'forecast',
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

  /// Creates an Amazon Forecast predictor.
  ///
  /// Amazon Forecast creates predictors with AutoPredictor, which involves
  /// applying the optimal combination of algorithms to each time series in your
  /// datasets. You can use <a>CreateAutoPredictor</a> to create new predictors
  /// or upgrade/retrain existing predictors.
  ///
  /// <b>Creating new predictors</b>
  ///
  /// The following parameters are required when creating a new predictor:
  ///
  /// <ul>
  /// <li>
  /// <code>PredictorName</code> - A unique name for the predictor.
  /// </li>
  /// <li>
  /// <code>DatasetGroupArn</code> - The ARN of the dataset group used to train
  /// the predictor.
  /// </li>
  /// <li>
  /// <code>ForecastFrequency</code> - The granularity of your forecasts
  /// (hourly, daily, weekly, etc).
  /// </li>
  /// <li>
  /// <code>ForecastHorizon</code> - The number of time-steps that the model
  /// predicts. The forecast horizon is also called the prediction length.
  /// </li>
  /// </ul>
  /// When creating a new predictor, do not specify a value for
  /// <code>ReferencePredictorArn</code>.
  ///
  /// <b>Upgrading and retraining predictors</b>
  ///
  /// The following parameters are required when retraining or upgrading a
  /// predictor:
  ///
  /// <ul>
  /// <li>
  /// <code>PredictorName</code> - A unique name for the predictor.
  /// </li>
  /// <li>
  /// <code>ReferencePredictorArn</code> - The ARN of the predictor to retrain
  /// or upgrade.
  /// </li>
  /// </ul>
  /// When upgrading or retraining a predictor, only specify values for the
  /// <code>ReferencePredictorArn</code> and <code>PredictorName</code>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [predictorName] :
  /// A unique name for the predictor
  ///
  /// Parameter [dataConfig] :
  /// The data configuration for your dataset group and any additional datasets.
  ///
  /// Parameter [explainPredictor] :
  /// Create an Explainability resource for the predictor.
  ///
  /// Parameter [forecastDimensions] :
  /// An array of dimension (field) names that specify how to group the
  /// generated forecast.
  ///
  /// For example, if you are generating forecasts for item sales across all
  /// your stores, and your dataset contains a <code>store_id</code> field, you
  /// would specify <code>store_id</code> as a dimension to group sales
  /// forecasts for each store.
  ///
  /// Parameter [forecastFrequency] :
  /// The frequency of predictions in a forecast.
  ///
  /// Valid intervals are an integer followed by Y (Year), M (Month), W (Week),
  /// D (Day), H (Hour), and min (Minute). For example, "1D" indicates every day
  /// and "15min" indicates every 15 minutes. You cannot specify a value that
  /// would overlap with the next larger frequency. That means, for example, you
  /// cannot specify a frequency of 60 minutes, because that is equivalent to 1
  /// hour. The valid values for each frequency are the following:
  ///
  /// <ul>
  /// <li>
  /// Minute - 1-59
  /// </li>
  /// <li>
  /// Hour - 1-23
  /// </li>
  /// <li>
  /// Day - 1-6
  /// </li>
  /// <li>
  /// Week - 1-4
  /// </li>
  /// <li>
  /// Month - 1-11
  /// </li>
  /// <li>
  /// Year - 1
  /// </li>
  /// </ul>
  /// Thus, if you want every other week forecasts, specify "2W". Or, if you
  /// want quarterly forecasts, you specify "3M".
  ///
  /// The frequency must be greater than or equal to the TARGET_TIME_SERIES
  /// dataset frequency.
  ///
  /// When a RELATED_TIME_SERIES dataset is provided, the frequency must be
  /// equal to the RELATED_TIME_SERIES dataset frequency.
  ///
  /// Parameter [forecastHorizon] :
  /// The number of time-steps that the model predicts. The forecast horizon is
  /// also called the prediction length.
  ///
  /// The maximum forecast horizon is the lesser of 500 time-steps or 1/4 of the
  /// TARGET_TIME_SERIES dataset length. If you are retraining an existing
  /// AutoPredictor, then the maximum forecast horizon is the lesser of 500
  /// time-steps or 1/3 of the TARGET_TIME_SERIES dataset length.
  ///
  /// If you are upgrading to an AutoPredictor or retraining an existing
  /// AutoPredictor, you cannot update the forecast horizon parameter. You can
  /// meet this requirement by providing longer time-series in the dataset.
  ///
  /// Parameter [forecastTypes] :
  /// The forecast types used to train a predictor. You can specify up to five
  /// forecast types. Forecast types can be quantiles from 0.01 to 0.99, by
  /// increments of 0.01 or higher. You can also specify the mean forecast with
  /// <code>mean</code>.
  ///
  /// Parameter [monitorConfig] :
  /// The configuration details for predictor monitoring. Provide a name for the
  /// monitor resource to enable predictor monitoring.
  ///
  /// Predictor monitoring allows you to see how your predictor's performance
  /// changes over time. For more information, see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/predictor-monitoring.html">Predictor
  /// Monitoring</a>.
  ///
  /// Parameter [optimizationMetric] :
  /// The accuracy metric used to optimize the predictor.
  ///
  /// Parameter [referencePredictorArn] :
  /// The ARN of the predictor to retrain or upgrade. This parameter is only
  /// used when retraining or upgrading a predictor. When creating a new
  /// predictor, do not specify a value for this parameter.
  ///
  /// When upgrading or retraining a predictor, only specify values for the
  /// <code>ReferencePredictorArn</code> and <code>PredictorName</code>. The
  /// value for <code>PredictorName</code> must be a unique predictor name.
  ///
  /// Parameter [tags] :
  /// Optional metadata to help you categorize and organize your predictors.
  /// Each tag consists of a key and an optional value, both of which you
  /// define. Tag keys and values are case sensitive.
  ///
  /// The following restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// For each resource, each tag key must be unique and each tag key must have
  /// one value.
  /// </li>
  /// <li>
  /// Maximum number of tags per resource: 50.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Accepted characters: all letters and numbers, spaces representable in
  /// UTF-8, and + - = . _ : / @. If your tagging schema is used across other
  /// services and resources, the character restrictions of those services also
  /// apply.
  /// </li>
  /// <li>
  /// Key prefixes cannot include any upper or lowercase combination of
  /// <code>aws:</code> or <code>AWS:</code>. Values can have this prefix. If a
  /// tag value has <code>aws</code> as its prefix but the key does not,
  /// Forecast considers it to be a user tag and will count against the limit of
  /// 50 tags. Tags with only the key prefix of <code>aws</code> do not count
  /// against your tags per resource limit. You cannot edit or delete tag keys
  /// with this prefix.
  /// </li>
  /// </ul>
  ///
  /// Parameter [timeAlignmentBoundary] :
  /// The time boundary Forecast uses to align and aggregate any data that
  /// doesn't align with your forecast frequency. Provide the unit of time and
  /// the time boundary as a key value pair. For more information on specifying
  /// a time boundary, see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/data-aggregation.html#specifying-time-boundary">Specifying
  /// a Time Boundary</a>. If you don't provide a time boundary, Forecast uses a
  /// set of <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/data-aggregation.html#default-time-boundaries">Default
  /// Time Boundaries</a>.
  Future<CreateAutoPredictorResponse> createAutoPredictor({
    required String predictorName,
    DataConfig? dataConfig,
    EncryptionConfig? encryptionConfig,
    bool? explainPredictor,
    List<String>? forecastDimensions,
    String? forecastFrequency,
    int? forecastHorizon,
    List<String>? forecastTypes,
    MonitorConfig? monitorConfig,
    OptimizationMetric? optimizationMetric,
    String? referencePredictorArn,
    List<Tag>? tags,
    TimeAlignmentBoundary? timeAlignmentBoundary,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreateAutoPredictor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PredictorName': predictorName,
        if (dataConfig != null) 'DataConfig': dataConfig,
        if (encryptionConfig != null) 'EncryptionConfig': encryptionConfig,
        if (explainPredictor != null) 'ExplainPredictor': explainPredictor,
        if (forecastDimensions != null)
          'ForecastDimensions': forecastDimensions,
        if (forecastFrequency != null) 'ForecastFrequency': forecastFrequency,
        if (forecastHorizon != null) 'ForecastHorizon': forecastHorizon,
        if (forecastTypes != null) 'ForecastTypes': forecastTypes,
        if (monitorConfig != null) 'MonitorConfig': monitorConfig,
        if (optimizationMetric != null)
          'OptimizationMetric': optimizationMetric.toValue(),
        if (referencePredictorArn != null)
          'ReferencePredictorArn': referencePredictorArn,
        if (tags != null) 'Tags': tags,
        if (timeAlignmentBoundary != null)
          'TimeAlignmentBoundary': timeAlignmentBoundary,
      },
    );

    return CreateAutoPredictorResponse.fromJson(jsonResponse.body);
  }

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
  /// predictor. For more information, see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/howitworks-datasets-groups.html">Importing
  /// datasets</a>.
  ///
  /// To get a list of all your datasets, use the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_ListDatasets.html">ListDatasets</a>
  /// operation.
  ///
  /// For example Forecast datasets, see the <a
  /// href="https://github.com/aws-samples/amazon-forecast-samples">Amazon
  /// Forecast Sample GitHub repository</a>.
  /// <note>
  /// The <code>Status</code> of a dataset must be <code>ACTIVE</code> before
  /// you can import training data. Use the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDataset.html">DescribeDataset</a>
  /// operation to get the status.
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
  /// <code>Domain</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetGroup.html">CreateDatasetGroup</a>
  /// operation must match.
  ///
  /// The <code>Domain</code> and <code>DatasetType</code> that you choose
  /// determine the fields that must be present in the training data that you
  /// import to the dataset. For example, if you choose the <code>RETAIL</code>
  /// domain and <code>TARGET_TIME_SERIES</code> as the
  /// <code>DatasetType</code>, Amazon Forecast requires <code>item_id</code>,
  /// <code>timestamp</code>, and <code>demand</code> fields to be present in
  /// your data. For more information, see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/howitworks-datasets-groups.html">Importing
  /// datasets</a>.
  ///
  /// Parameter [schema] :
  /// The schema for the dataset. The schema attributes and their order must
  /// match the fields in your data. The dataset <code>Domain</code> and
  /// <code>DatasetType</code> that you choose determine the minimum required
  /// fields in your training data. For information about the required fields
  /// for a specific dataset domain and type, see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/howitworks-domains-ds-types.html">Dataset
  /// Domains and Dataset Types</a>.
  ///
  /// Parameter [dataFrequency] :
  /// The frequency of data collection. This parameter is required for
  /// RELATED_TIME_SERIES datasets.
  ///
  /// Valid intervals are an integer followed by Y (Year), M (Month), W (Week),
  /// D (Day), H (Hour), and min (Minute). For example, "1D" indicates every day
  /// and "15min" indicates every 15 minutes. You cannot specify a value that
  /// would overlap with the next larger frequency. That means, for example, you
  /// cannot specify a frequency of 60 minutes, because that is equivalent to 1
  /// hour. The valid values for each frequency are the following:
  ///
  /// <ul>
  /// <li>
  /// Minute - 1-59
  /// </li>
  /// <li>
  /// Hour - 1-23
  /// </li>
  /// <li>
  /// Day - 1-6
  /// </li>
  /// <li>
  /// Week - 1-4
  /// </li>
  /// <li>
  /// Month - 1-11
  /// </li>
  /// <li>
  /// Year - 1
  /// </li>
  /// </ul>
  /// Thus, if you want every other week forecasts, specify "2W". Or, if you
  /// want quarterly forecasts, you specify "3M".
  ///
  /// Parameter [encryptionConfig] :
  /// An Key Management Service (KMS) key and the Identity and Access Management
  /// (IAM) role that Amazon Forecast can assume to access the key.
  ///
  /// Parameter [tags] :
  /// The optional metadata that you apply to the dataset to help you categorize
  /// and organize them. Each tag consists of a key and an optional value, both
  /// of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50.
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for keys as it is reserved for Amazon Web
  /// Services use. You cannot edit or delete tag keys with this prefix. Values
  /// can have this prefix. If a tag value has <code>aws</code> as its prefix
  /// but the key does not, then Forecast considers it to be a user tag and will
  /// count against the limit of 50 tags. Tags with only the key prefix of
  /// <code>aws</code> do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  Future<CreateDatasetResponse> createDataset({
    required String datasetName,
    required DatasetType datasetType,
    required Domain domain,
    required Schema schema,
    String? dataFrequency,
    EncryptionConfig? encryptionConfig,
    List<Tag>? tags,
  }) async {
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
        'DatasetType': datasetType.toValue(),
        'Domain': domain.toValue(),
        'Schema': schema,
        if (dataFrequency != null) 'DataFrequency': dataFrequency,
        if (encryptionConfig != null) 'EncryptionConfig': encryptionConfig,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Creates a dataset group, which holds a collection of related datasets. You
  /// can add datasets to the dataset group when you create the dataset group,
  /// or later by using the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_UpdateDatasetGroup.html">UpdateDatasetGroup</a>
  /// operation.
  ///
  /// After creating a dataset group and adding datasets, you use the dataset
  /// group when you create a predictor. For more information, see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/howitworks-datasets-groups.html">Dataset
  /// groups</a>.
  ///
  /// To get a list of all your datasets groups, use the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_ListDatasetGroups.html">ListDatasetGroups</a>
  /// operation.
  /// <note>
  /// The <code>Status</code> of a dataset group must be <code>ACTIVE</code>
  /// before you can use the dataset group to create a predictor. To get the
  /// status, use the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetGroup.html">DescribeDatasetGroup</a>
  /// operation.
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
  /// <code>Domain</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDataset.html">CreateDataset</a>
  /// operation must match.
  ///
  /// The <code>Domain</code> and <code>DatasetType</code> that you choose
  /// determine the fields that must be present in training data that you import
  /// to a dataset. For example, if you choose the <code>RETAIL</code> domain
  /// and <code>TARGET_TIME_SERIES</code> as the <code>DatasetType</code>,
  /// Amazon Forecast requires that <code>item_id</code>,
  /// <code>timestamp</code>, and <code>demand</code> fields are present in your
  /// data. For more information, see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/howitworks-datasets-groups.html">Dataset
  /// groups</a>.
  ///
  /// Parameter [datasetArns] :
  /// An array of Amazon Resource Names (ARNs) of the datasets that you want to
  /// include in the dataset group.
  ///
  /// Parameter [tags] :
  /// The optional metadata that you apply to the dataset group to help you
  /// categorize and organize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50.
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for keys as it is reserved for Amazon Web
  /// Services use. You cannot edit or delete tag keys with this prefix. Values
  /// can have this prefix. If a tag value has <code>aws</code> as its prefix
  /// but the key does not, then Forecast considers it to be a user tag and will
  /// count against the limit of 50 tags. Tags with only the key prefix of
  /// <code>aws</code> do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  Future<CreateDatasetGroupResponse> createDatasetGroup({
    required String datasetGroupName,
    required Domain domain,
    List<String>? datasetArns,
    List<Tag>? tags,
  }) async {
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
        'Domain': domain.toValue(),
        if (datasetArns != null) 'DatasetArns': datasetArns,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateDatasetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Imports your training data to an Amazon Forecast dataset. You provide the
  /// location of your training data in an Amazon Simple Storage Service (Amazon
  /// S3) bucket and the Amazon Resource Name (ARN) of the dataset that you want
  /// to import the data to.
  ///
  /// You must specify a <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DataSource.html">DataSource</a>
  /// object that includes an Identity and Access Management (IAM) role that
  /// Amazon Forecast can assume to access the data, as Amazon Forecast makes a
  /// copy of your data and processes it in an internal Amazon Web Services
  /// system. For more information, see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/aws-forecast-iam-roles.html">Set
  /// up permissions</a>.
  ///
  /// The training data must be in CSV or Parquet format. The delimiter must be
  /// a comma (,).
  ///
  /// You can specify the path to a specific file, the S3 bucket, or to a folder
  /// in the S3 bucket. For the latter two cases, Amazon Forecast imports all
  /// files up to the limit of 10,000 files.
  ///
  /// Because dataset imports are not aggregated, your most recent dataset
  /// import is the one that is used when training a predictor or generating a
  /// forecast. Make sure that your most recent dataset import contains all of
  /// the data you want to model off of, and not just the new data collected
  /// since the previous import.
  ///
  /// To get a list of all your dataset import jobs, filtered by specified
  /// criteria, use the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_ListDatasetImportJobs.html">ListDatasetImportJobs</a>
  /// operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [dataSource] :
  /// The location of the training data to import and an Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the data.
  /// The training data must be stored in an Amazon S3 bucket.
  ///
  /// If encryption is used, <code>DataSource</code> must include an Key
  /// Management Service (KMS) key and the IAM role must allow Amazon Forecast
  /// permission to access the key. The KMS key and IAM role must match those
  /// specified in the <code>EncryptionConfig</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDataset.html">CreateDataset</a>
  /// operation.
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
  /// Parameter [format] :
  /// The format of the imported data, CSV or PARQUET. The default value is CSV.
  ///
  /// Parameter [geolocationFormat] :
  /// The format of the geolocation attribute. The geolocation attribute can be
  /// formatted in one of two ways:
  ///
  /// <ul>
  /// <li>
  /// <code>LAT_LONG</code> - the latitude and longitude in decimal format
  /// (Example: 47.61_-122.33).
  /// </li>
  /// <li>
  /// <code>CC_POSTALCODE</code> (US Only) - the country code (US), followed by
  /// the 5-digit ZIP code (Example: US_98121).
  /// </li>
  /// </ul>
  ///
  /// Parameter [importMode] :
  /// Specifies whether the dataset import job is a <code>FULL</code> or
  /// <code>INCREMENTAL</code> import. A <code>FULL</code> dataset import
  /// replaces all of the existing data with the newly imported data. An
  /// <code>INCREMENTAL</code> import appends the imported data to the existing
  /// data.
  ///
  /// Parameter [tags] :
  /// The optional metadata that you apply to the dataset import job to help you
  /// categorize and organize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50.
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for keys as it is reserved for Amazon Web
  /// Services use. You cannot edit or delete tag keys with this prefix. Values
  /// can have this prefix. If a tag value has <code>aws</code> as its prefix
  /// but the key does not, then Forecast considers it to be a user tag and will
  /// count against the limit of 50 tags. Tags with only the key prefix of
  /// <code>aws</code> do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  ///
  /// Parameter [timeZone] :
  /// A single time zone for every item in your dataset. This option is ideal
  /// for datasets with all timestamps within a single time zone, or if all
  /// timestamps are normalized to a single time zone.
  ///
  /// Refer to the <a
  /// href="http://joda-time.sourceforge.net/timezones.html">Joda-Time API</a>
  /// for a complete list of valid time zone names.
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
  ///
  /// Parameter [useGeolocationForTimeZone] :
  /// Automatically derive time zone information from the geolocation attribute.
  /// This option is ideal for datasets that contain timestamps in multiple time
  /// zones and those timestamps are expressed in local time.
  Future<CreateDatasetImportJobResponse> createDatasetImportJob({
    required DataSource dataSource,
    required String datasetArn,
    required String datasetImportJobName,
    String? format,
    String? geolocationFormat,
    ImportMode? importMode,
    List<Tag>? tags,
    String? timeZone,
    String? timestampFormat,
    bool? useGeolocationForTimeZone,
  }) async {
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
        if (format != null) 'Format': format,
        if (geolocationFormat != null) 'GeolocationFormat': geolocationFormat,
        if (importMode != null) 'ImportMode': importMode.toValue(),
        if (tags != null) 'Tags': tags,
        if (timeZone != null) 'TimeZone': timeZone,
        if (timestampFormat != null) 'TimestampFormat': timestampFormat,
        if (useGeolocationForTimeZone != null)
          'UseGeolocationForTimeZone': useGeolocationForTimeZone,
      },
    );

    return CreateDatasetImportJobResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// Explainability is only available for Forecasts and Predictors generated
  /// from an AutoPredictor (<a>CreateAutoPredictor</a>)
  /// </note>
  /// Creates an Amazon Forecast Explainability.
  ///
  /// Explainability helps you better understand how the attributes in your
  /// datasets impact forecast. Amazon Forecast uses a metric called Impact
  /// scores to quantify the relative impact of each attribute and determine
  /// whether they increase or decrease forecast values.
  ///
  /// To enable Forecast Explainability, your predictor must include at least
  /// one of the following: related time series, item metadata, or additional
  /// datasets like Holidays and the Weather Index.
  ///
  /// CreateExplainability accepts either a Predictor ARN or Forecast ARN. To
  /// receive aggregated Impact scores for all time series and time points in
  /// your datasets, provide a Predictor ARN. To receive Impact scores for
  /// specific time series and time points, provide a Forecast ARN.
  ///
  /// <b>CreateExplainability with a Predictor ARN</b>
  /// <note>
  /// You can only have one Explainability resource per predictor. If you
  /// already enabled <code>ExplainPredictor</code> in
  /// <a>CreateAutoPredictor</a>, that predictor already has an Explainability
  /// resource.
  /// </note>
  /// The following parameters are required when providing a Predictor ARN:
  ///
  /// <ul>
  /// <li>
  /// <code>ExplainabilityName</code> - A unique name for the Explainability.
  /// </li>
  /// <li>
  /// <code>ResourceArn</code> - The Arn of the predictor.
  /// </li>
  /// <li>
  /// <code>TimePointGranularity</code> - Must be set to “ALL”.
  /// </li>
  /// <li>
  /// <code>TimeSeriesGranularity</code> - Must be set to “ALL”.
  /// </li>
  /// </ul>
  /// Do not specify a value for the following parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>DataSource</code> - Only valid when TimeSeriesGranularity is
  /// “SPECIFIC”.
  /// </li>
  /// <li>
  /// <code>Schema</code> - Only valid when TimeSeriesGranularity is “SPECIFIC”.
  /// </li>
  /// <li>
  /// <code>StartDateTime</code> - Only valid when TimePointGranularity is
  /// “SPECIFIC”.
  /// </li>
  /// <li>
  /// <code>EndDateTime</code> - Only valid when TimePointGranularity is
  /// “SPECIFIC”.
  /// </li>
  /// </ul>
  /// <b>CreateExplainability with a Forecast ARN</b>
  /// <note>
  /// You can specify a maximum of 50 time series and 500 time points.
  /// </note>
  /// The following parameters are required when providing a Predictor ARN:
  ///
  /// <ul>
  /// <li>
  /// <code>ExplainabilityName</code> - A unique name for the Explainability.
  /// </li>
  /// <li>
  /// <code>ResourceArn</code> - The Arn of the forecast.
  /// </li>
  /// <li>
  /// <code>TimePointGranularity</code> - Either “ALL” or “SPECIFIC”.
  /// </li>
  /// <li>
  /// <code>TimeSeriesGranularity</code> - Either “ALL” or “SPECIFIC”.
  /// </li>
  /// </ul>
  /// If you set TimeSeriesGranularity to “SPECIFIC”, you must also provide the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>DataSource</code> - The S3 location of the CSV file specifying your
  /// time series.
  /// </li>
  /// <li>
  /// <code>Schema</code> - The Schema defines the attributes and attribute
  /// types listed in the Data Source.
  /// </li>
  /// </ul>
  /// If you set TimePointGranularity to “SPECIFIC”, you must also provide the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>StartDateTime</code> - The first timestamp in the range of time
  /// points.
  /// </li>
  /// <li>
  /// <code>EndDateTime</code> - The last timestamp in the range of time points.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [explainabilityConfig] :
  /// The configuration settings that define the granularity of time series and
  /// time points for the Explainability.
  ///
  /// Parameter [explainabilityName] :
  /// A unique name for the Explainability.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Predictor or Forecast used to create
  /// the Explainability.
  ///
  /// Parameter [enableVisualization] :
  /// Create an Explainability visualization that is viewable within the Amazon
  /// Web Services console.
  ///
  /// Parameter [endDateTime] :
  /// If <code>TimePointGranularity</code> is set to <code>SPECIFIC</code>,
  /// define the last time point for the Explainability.
  ///
  /// Use the following timestamp format: yyyy-MM-ddTHH:mm:ss (example:
  /// 2015-01-01T20:00:00)
  ///
  /// Parameter [startDateTime] :
  /// If <code>TimePointGranularity</code> is set to <code>SPECIFIC</code>,
  /// define the first point for the Explainability.
  ///
  /// Use the following timestamp format: yyyy-MM-ddTHH:mm:ss (example:
  /// 2015-01-01T20:00:00)
  ///
  /// Parameter [tags] :
  /// Optional metadata to help you categorize and organize your resources. Each
  /// tag consists of a key and an optional value, both of which you define. Tag
  /// keys and values are case sensitive.
  ///
  /// The following restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// For each resource, each tag key must be unique and each tag key must have
  /// one value.
  /// </li>
  /// <li>
  /// Maximum number of tags per resource: 50.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Accepted characters: all letters and numbers, spaces representable in
  /// UTF-8, and + - = . _ : / @. If your tagging schema is used across other
  /// services and resources, the character restrictions of those services also
  /// apply.
  /// </li>
  /// <li>
  /// Key prefixes cannot include any upper or lowercase combination of
  /// <code>aws:</code> or <code>AWS:</code>. Values can have this prefix. If a
  /// tag value has <code>aws</code> as its prefix but the key does not,
  /// Forecast considers it to be a user tag and will count against the limit of
  /// 50 tags. Tags with only the key prefix of <code>aws</code> do not count
  /// against your tags per resource limit. You cannot edit or delete tag keys
  /// with this prefix.
  /// </li>
  /// </ul>
  Future<CreateExplainabilityResponse> createExplainability({
    required ExplainabilityConfig explainabilityConfig,
    required String explainabilityName,
    required String resourceArn,
    DataSource? dataSource,
    bool? enableVisualization,
    String? endDateTime,
    Schema? schema,
    String? startDateTime,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreateExplainability'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExplainabilityConfig': explainabilityConfig,
        'ExplainabilityName': explainabilityName,
        'ResourceArn': resourceArn,
        if (dataSource != null) 'DataSource': dataSource,
        if (enableVisualization != null)
          'EnableVisualization': enableVisualization,
        if (endDateTime != null) 'EndDateTime': endDateTime,
        if (schema != null) 'Schema': schema,
        if (startDateTime != null) 'StartDateTime': startDateTime,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateExplainabilityResponse.fromJson(jsonResponse.body);
  }

  /// Exports an Explainability resource created by the
  /// <a>CreateExplainability</a> operation. Exported files are exported to an
  /// Amazon Simple Storage Service (Amazon S3) bucket.
  ///
  /// You must specify a <a>DataDestination</a> object that includes an Amazon
  /// S3 bucket and an Identity and Access Management (IAM) role that Amazon
  /// Forecast can assume to access the Amazon S3 bucket. For more information,
  /// see <a>aws-forecast-iam-roles</a>.
  /// <note>
  /// The <code>Status</code> of the export job must be <code>ACTIVE</code>
  /// before you can access the export in your Amazon S3 bucket. To get the
  /// status, use the <a>DescribeExplainabilityExport</a> operation.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [explainabilityArn] :
  /// The Amazon Resource Name (ARN) of the Explainability to export.
  ///
  /// Parameter [explainabilityExportName] :
  /// A unique name for the Explainability export.
  ///
  /// Parameter [format] :
  /// The format of the exported data, CSV or PARQUET.
  ///
  /// Parameter [tags] :
  /// Optional metadata to help you categorize and organize your resources. Each
  /// tag consists of a key and an optional value, both of which you define. Tag
  /// keys and values are case sensitive.
  ///
  /// The following restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// For each resource, each tag key must be unique and each tag key must have
  /// one value.
  /// </li>
  /// <li>
  /// Maximum number of tags per resource: 50.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Accepted characters: all letters and numbers, spaces representable in
  /// UTF-8, and + - = . _ : / @. If your tagging schema is used across other
  /// services and resources, the character restrictions of those services also
  /// apply.
  /// </li>
  /// <li>
  /// Key prefixes cannot include any upper or lowercase combination of
  /// <code>aws:</code> or <code>AWS:</code>. Values can have this prefix. If a
  /// tag value has <code>aws</code> as its prefix but the key does not,
  /// Forecast considers it to be a user tag and will count against the limit of
  /// 50 tags. Tags with only the key prefix of <code>aws</code> do not count
  /// against your tags per resource limit. You cannot edit or delete tag keys
  /// with this prefix.
  /// </li>
  /// </ul>
  Future<CreateExplainabilityExportResponse> createExplainabilityExport({
    required DataDestination destination,
    required String explainabilityArn,
    required String explainabilityExportName,
    String? format,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreateExplainabilityExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Destination': destination,
        'ExplainabilityArn': explainabilityArn,
        'ExplainabilityExportName': explainabilityExportName,
        if (format != null) 'Format': format,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateExplainabilityExportResponse.fromJson(jsonResponse.body);
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
  /// <a>CreatePredictor</a> request. When you query a forecast, you can request
  /// a specific date range within the forecast.
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
  /// By default, a forecast includes predictions for every item
  /// (<code>item_id</code>) in the dataset group that was used to train the
  /// predictor. However, you can use the <code>TimeSeriesSelector</code> object
  /// to generate a forecast on a subset of time series. Forecast creation is
  /// skipped for any time series that you specify that are not in the input
  /// dataset. The forecast export file will not contain these time series or
  /// their forecasted values.
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
  /// The quantiles at which probabilistic forecasts are generated. <b>You can
  /// currently specify up to 5 quantiles per forecast</b>. Accepted values
  /// include <code>0.01 to 0.99</code> (increments of .01 only) and
  /// <code>mean</code>. The mean forecast is different from the median (0.50)
  /// when the distribution is not symmetric (for example, Beta and Negative
  /// Binomial).
  ///
  /// The default quantiles are the quantiles you specified during predictor
  /// creation. If you didn't specify quantiles, the default values are
  /// <code>["0.1", "0.5", "0.9"]</code>.
  ///
  /// Parameter [tags] :
  /// The optional metadata that you apply to the forecast to help you
  /// categorize and organize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50.
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for keys as it is reserved for Amazon Web
  /// Services use. You cannot edit or delete tag keys with this prefix. Values
  /// can have this prefix. If a tag value has <code>aws</code> as its prefix
  /// but the key does not, then Forecast considers it to be a user tag and will
  /// count against the limit of 50 tags. Tags with only the key prefix of
  /// <code>aws</code> do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  ///
  /// Parameter [timeSeriesSelector] :
  /// Defines the set of time series that are used to create the forecasts in a
  /// <code>TimeSeriesIdentifiers</code> object.
  ///
  /// The <code>TimeSeriesIdentifiers</code> object needs the following
  /// information:
  ///
  /// <ul>
  /// <li>
  /// <code>DataSource</code>
  /// </li>
  /// <li>
  /// <code>Format</code>
  /// </li>
  /// <li>
  /// <code>Schema</code>
  /// </li>
  /// </ul>
  Future<CreateForecastResponse> createForecast({
    required String forecastName,
    required String predictorArn,
    List<String>? forecastTypes,
    List<Tag>? tags,
    TimeSeriesSelector? timeSeriesSelector,
  }) async {
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
        if (forecastTypes != null) 'ForecastTypes': forecastTypes,
        if (tags != null) 'Tags': tags,
        if (timeSeriesSelector != null)
          'TimeSeriesSelector': timeSeriesSelector,
      },
    );

    return CreateForecastResponse.fromJson(jsonResponse.body);
  }

  /// Exports a forecast created by the <a>CreateForecast</a> operation to your
  /// Amazon Simple Storage Service (Amazon S3) bucket. The forecast file name
  /// will match the following conventions:
  ///
  /// &lt;ForecastExportJobName&gt;_&lt;ExportTimestamp&gt;_&lt;PartNumber&gt;
  ///
  /// where the &lt;ExportTimestamp&gt; component is in Java SimpleDateFormat
  /// (yyyy-MM-ddTHH-mm-ssZ).
  ///
  /// You must specify a <a>DataDestination</a> object that includes an Identity
  /// and Access Management (IAM) role that Amazon Forecast can assume to access
  /// the Amazon S3 bucket. For more information, see
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
  /// The location where you want to save the forecast and an Identity and
  /// Access Management (IAM) role that Amazon Forecast can assume to access the
  /// location. The forecast must be exported to an Amazon S3 bucket.
  ///
  /// If encryption is used, <code>Destination</code> must include an Key
  /// Management Service (KMS) key. The IAM role must allow Amazon Forecast
  /// permission to access the key.
  ///
  /// Parameter [forecastArn] :
  /// The Amazon Resource Name (ARN) of the forecast that you want to export.
  ///
  /// Parameter [forecastExportJobName] :
  /// The name for the forecast export job.
  ///
  /// Parameter [format] :
  /// The format of the exported data, CSV or PARQUET. The default value is CSV.
  ///
  /// Parameter [tags] :
  /// The optional metadata that you apply to the forecast export job to help
  /// you categorize and organize them. Each tag consists of a key and an
  /// optional value, both of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50.
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for keys as it is reserved for Amazon Web
  /// Services use. You cannot edit or delete tag keys with this prefix. Values
  /// can have this prefix. If a tag value has <code>aws</code> as its prefix
  /// but the key does not, then Forecast considers it to be a user tag and will
  /// count against the limit of 50 tags. Tags with only the key prefix of
  /// <code>aws</code> do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  Future<CreateForecastExportJobResponse> createForecastExportJob({
    required DataDestination destination,
    required String forecastArn,
    required String forecastExportJobName,
    String? format,
    List<Tag>? tags,
  }) async {
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
        if (format != null) 'Format': format,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateForecastExportJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates a predictor monitor resource for an existing auto predictor.
  /// Predictor monitoring allows you to see how your predictor's performance
  /// changes over time. For more information, see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/predictor-monitoring.html">Predictor
  /// Monitoring</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the predictor to monitor.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/tagging-forecast-resources.html">tags</a>
  /// to apply to the monitor resource.
  Future<CreateMonitorResponse> createMonitor({
    required String monitorName,
    required String resourceArn,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreateMonitor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonitorName': monitorName,
        'ResourceArn': resourceArn,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateMonitorResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This operation creates a legacy predictor that does not include all the
  /// predictor functionalities provided by Amazon Forecast. To create a
  /// predictor that is compatible with all aspects of Forecast, use
  /// <a>CreateAutoPredictor</a>.
  /// </note>
  /// Creates an Amazon Forecast predictor.
  ///
  /// In the request, provide a dataset group and either specify an algorithm or
  /// let Amazon Forecast choose an algorithm for you using AutoML. If you
  /// specify an algorithm, you also can override algorithm-specific
  /// hyperparameters.
  ///
  /// Amazon Forecast uses the algorithm to train a predictor using the latest
  /// version of the datasets in the specified dataset group. You can then
  /// generate a forecast using the <a>CreateForecast</a> operation.
  ///
  /// To see the evaluation metrics, use the <a>GetAccuracyMetrics</a>
  /// operation.
  ///
  /// You can specify a featurization configuration to fill and aggregate the
  /// data fields in the <code>TARGET_TIME_SERIES</code> dataset to improve
  /// model training. For more information, see <a>FeaturizationConfig</a>.
  ///
  /// For RELATED_TIME_SERIES datasets, <code>CreatePredictor</code> verifies
  /// that the <code>DataFrequency</code> specified when the dataset was created
  /// matches the <code>ForecastFrequency</code>. TARGET_TIME_SERIES datasets
  /// don't have this restriction. Amazon Forecast also verifies the delimiter
  /// and timestamp format. For more information, see
  /// <a>howitworks-datasets-groups</a>.
  ///
  /// By default, predictors are trained and evaluated at the 0.1 (P10), 0.5
  /// (P50), and 0.9 (P90) quantiles. You can choose custom forecast types to
  /// train and evaluate your predictor by setting the
  /// <code>ForecastTypes</code>.
  ///
  /// <b>AutoML</b>
  ///
  /// If you want Amazon Forecast to evaluate each algorithm and choose the one
  /// that minimizes the <code>objective function</code>, set
  /// <code>PerformAutoML</code> to <code>true</code>. The <code>objective
  /// function</code> is defined as the mean of the weighted losses over the
  /// forecast types. By default, these are the p10, p50, and p90 quantile
  /// losses. For more information, see <a>EvaluationResult</a>.
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
  /// <code>arn:aws:forecast:::algorithm/CNN-QR</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:forecast:::algorithm/Deep_AR_Plus</code>
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
  /// Parameter [autoMLOverrideStrategy] :
  /// <note>
  /// The <code>LatencyOptimized</code> AutoML override strategy is only
  /// available in private beta. Contact Amazon Web Services Support or your
  /// account manager to learn more about access privileges.
  /// </note>
  /// Used to overide the default AutoML strategy, which is to optimize
  /// predictor accuracy. To apply an AutoML strategy that minimizes training
  /// time, use <code>LatencyOptimized</code>.
  ///
  /// This parameter is only valid for predictors trained using AutoML.
  ///
  /// Parameter [encryptionConfig] :
  /// An Key Management Service (KMS) key and the Identity and Access Management
  /// (IAM) role that Amazon Forecast can assume to access the key.
  ///
  /// Parameter [evaluationParameters] :
  /// Used to override the default evaluation parameters of the specified
  /// algorithm. Amazon Forecast evaluates a predictor by splitting a dataset
  /// into training data and testing data. The evaluation parameters define how
  /// to perform the split and the number of iterations.
  ///
  /// Parameter [forecastTypes] :
  /// Specifies the forecast types used to train a predictor. You can specify up
  /// to five forecast types. Forecast types can be quantiles from 0.01 to 0.99,
  /// by increments of 0.01 or higher. You can also specify the mean forecast
  /// with <code>mean</code>.
  ///
  /// The default value is <code>["0.10", "0.50", "0.9"]</code>.
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
  /// Parameter [optimizationMetric] :
  /// The accuracy metric used to optimize the predictor.
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
  /// The following algorithms support HPO:
  ///
  /// <ul>
  /// <li>
  /// DeepAR+
  /// </li>
  /// <li>
  /// CNN-QR
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// The optional metadata that you apply to the predictor to help you
  /// categorize and organize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50.
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for keys as it is reserved for Amazon Web
  /// Services use. You cannot edit or delete tag keys with this prefix. Values
  /// can have this prefix. If a tag value has <code>aws</code> as its prefix
  /// but the key does not, then Forecast considers it to be a user tag and will
  /// count against the limit of 50 tags. Tags with only the key prefix of
  /// <code>aws</code> do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  ///
  /// Parameter [trainingParameters] :
  /// The hyperparameters to override for model training. The hyperparameters
  /// that you can override are listed in the individual algorithms. For the
  /// list of supported algorithms, see <a>aws-forecast-choosing-recipes</a>.
  Future<CreatePredictorResponse> createPredictor({
    required FeaturizationConfig featurizationConfig,
    required int forecastHorizon,
    required InputDataConfig inputDataConfig,
    required String predictorName,
    String? algorithmArn,
    AutoMLOverrideStrategy? autoMLOverrideStrategy,
    EncryptionConfig? encryptionConfig,
    EvaluationParameters? evaluationParameters,
    List<String>? forecastTypes,
    HyperParameterTuningJobConfig? hPOConfig,
    OptimizationMetric? optimizationMetric,
    bool? performAutoML,
    bool? performHPO,
    List<Tag>? tags,
    Map<String, String>? trainingParameters,
  }) async {
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
        if (algorithmArn != null) 'AlgorithmArn': algorithmArn,
        if (autoMLOverrideStrategy != null)
          'AutoMLOverrideStrategy': autoMLOverrideStrategy.toValue(),
        if (encryptionConfig != null) 'EncryptionConfig': encryptionConfig,
        if (evaluationParameters != null)
          'EvaluationParameters': evaluationParameters,
        if (forecastTypes != null) 'ForecastTypes': forecastTypes,
        if (hPOConfig != null) 'HPOConfig': hPOConfig,
        if (optimizationMetric != null)
          'OptimizationMetric': optimizationMetric.toValue(),
        if (performAutoML != null) 'PerformAutoML': performAutoML,
        if (performHPO != null) 'PerformHPO': performHPO,
        if (tags != null) 'Tags': tags,
        if (trainingParameters != null)
          'TrainingParameters': trainingParameters,
      },
    );

    return CreatePredictorResponse.fromJson(jsonResponse.body);
  }

  /// Exports backtest forecasts and accuracy metrics generated by the
  /// <a>CreateAutoPredictor</a> or <a>CreatePredictor</a> operations. Two
  /// folders containing CSV or Parquet files are exported to your specified S3
  /// bucket.
  ///
  /// The export file names will match the following conventions:
  ///
  /// <code>&lt;ExportJobName&gt;_&lt;ExportTimestamp&gt;_&lt;PartNumber&gt;.csv</code>
  ///
  /// The &lt;ExportTimestamp&gt; component is in Java SimpleDate format
  /// (yyyy-MM-ddTHH-mm-ssZ).
  ///
  /// You must specify a <a>DataDestination</a> object that includes an Amazon
  /// S3 bucket and an Identity and Access Management (IAM) role that Amazon
  /// Forecast can assume to access the Amazon S3 bucket. For more information,
  /// see <a>aws-forecast-iam-roles</a>.
  /// <note>
  /// The <code>Status</code> of the export job must be <code>ACTIVE</code>
  /// before you can access the export in your Amazon S3 bucket. To get the
  /// status, use the <a>DescribePredictorBacktestExportJob</a> operation.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [predictorArn] :
  /// The Amazon Resource Name (ARN) of the predictor that you want to export.
  ///
  /// Parameter [predictorBacktestExportJobName] :
  /// The name for the backtest export job.
  ///
  /// Parameter [format] :
  /// The format of the exported data, CSV or PARQUET. The default value is CSV.
  ///
  /// Parameter [tags] :
  /// Optional metadata to help you categorize and organize your backtests. Each
  /// tag consists of a key and an optional value, both of which you define. Tag
  /// keys and values are case sensitive.
  ///
  /// The following restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// For each resource, each tag key must be unique and each tag key must have
  /// one value.
  /// </li>
  /// <li>
  /// Maximum number of tags per resource: 50.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Accepted characters: all letters and numbers, spaces representable in
  /// UTF-8, and + - = . _ : / @. If your tagging schema is used across other
  /// services and resources, the character restrictions of those services also
  /// apply.
  /// </li>
  /// <li>
  /// Key prefixes cannot include any upper or lowercase combination of
  /// <code>aws:</code> or <code>AWS:</code>. Values can have this prefix. If a
  /// tag value has <code>aws</code> as its prefix but the key does not,
  /// Forecast considers it to be a user tag and will count against the limit of
  /// 50 tags. Tags with only the key prefix of <code>aws</code> do not count
  /// against your tags per resource limit. You cannot edit or delete tag keys
  /// with this prefix.
  /// </li>
  /// </ul>
  Future<CreatePredictorBacktestExportJobResponse>
      createPredictorBacktestExportJob({
    required DataDestination destination,
    required String predictorArn,
    required String predictorBacktestExportJobName,
    String? format,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreatePredictorBacktestExportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Destination': destination,
        'PredictorArn': predictorArn,
        'PredictorBacktestExportJobName': predictorBacktestExportJobName,
        if (format != null) 'Format': format,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePredictorBacktestExportJobResponse.fromJson(jsonResponse.body);
  }

  /// What-if analysis is a scenario modeling technique where you make a
  /// hypothetical change to a time series and compare the forecasts generated
  /// by these changes against the baseline, unchanged time series. It is
  /// important to remember that the purpose of a what-if analysis is to
  /// understand how a forecast can change given different modifications to the
  /// baseline time series.
  ///
  /// For example, imagine you are a clothing retailer who is considering an end
  /// of season sale to clear space for new styles. After creating a baseline
  /// forecast, you can use a what-if analysis to investigate how different
  /// sales tactics might affect your goals.
  ///
  /// You could create a scenario where everything is given a 25% markdown, and
  /// another where everything is given a fixed dollar markdown. You could
  /// create a scenario where the sale lasts for one week and another where the
  /// sale lasts for one month. With a what-if analysis, you can compare many
  /// different scenarios against each other.
  ///
  /// Note that a what-if analysis is meant to display what the forecasting
  /// model has learned and how it will behave in the scenarios that you are
  /// evaluating. Do not blindly use the results of the what-if analysis to make
  /// business decisions. For instance, forecasts might not be accurate for
  /// novel scenarios where there is no reference available to determine whether
  /// a forecast is good.
  ///
  /// The <a>TimeSeriesSelector</a> object defines the items that you want in
  /// the what-if analysis.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [forecastArn] :
  /// The Amazon Resource Name (ARN) of the baseline forecast.
  ///
  /// Parameter [whatIfAnalysisName] :
  /// The name of the what-if analysis. Each name must be unique.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/tagging-forecast-resources.html">tags</a>
  /// to apply to the what if forecast.
  ///
  /// Parameter [timeSeriesSelector] :
  /// Defines the set of time series that are used in the what-if analysis with
  /// a <code>TimeSeriesIdentifiers</code> object. What-if analyses are
  /// performed only for the time series in this object.
  ///
  /// The <code>TimeSeriesIdentifiers</code> object needs the following
  /// information:
  ///
  /// <ul>
  /// <li>
  /// <code>DataSource</code>
  /// </li>
  /// <li>
  /// <code>Format</code>
  /// </li>
  /// <li>
  /// <code>Schema</code>
  /// </li>
  /// </ul>
  Future<CreateWhatIfAnalysisResponse> createWhatIfAnalysis({
    required String forecastArn,
    required String whatIfAnalysisName,
    List<Tag>? tags,
    TimeSeriesSelector? timeSeriesSelector,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreateWhatIfAnalysis'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ForecastArn': forecastArn,
        'WhatIfAnalysisName': whatIfAnalysisName,
        if (tags != null) 'Tags': tags,
        if (timeSeriesSelector != null)
          'TimeSeriesSelector': timeSeriesSelector,
      },
    );

    return CreateWhatIfAnalysisResponse.fromJson(jsonResponse.body);
  }

  /// A what-if forecast is a forecast that is created from a modified version
  /// of the baseline forecast. Each what-if forecast incorporates either a
  /// replacement dataset or a set of transformations to the original dataset.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [whatIfAnalysisArn] :
  /// The Amazon Resource Name (ARN) of the what-if analysis.
  ///
  /// Parameter [whatIfForecastName] :
  /// The name of the what-if forecast. Names must be unique within each what-if
  /// analysis.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/tagging-forecast-resources.html">tags</a>
  /// to apply to the what if forecast.
  ///
  /// Parameter [timeSeriesReplacementsDataSource] :
  /// The replacement time series dataset, which contains the rows that you want
  /// to change in the related time series dataset. A replacement time series
  /// does not need to contain all rows that are in the baseline related time
  /// series. Include only the rows (measure-dimension combinations) that you
  /// want to include in the what-if forecast.
  ///
  /// This dataset is merged with the original time series to create a
  /// transformed dataset that is used for the what-if analysis.
  ///
  /// This dataset should contain the items to modify (such as item_id or
  /// workforce_type), any relevant dimensions, the timestamp column, and at
  /// least one of the related time series columns. This file should not contain
  /// duplicate timestamps for the same time series.
  ///
  /// Timestamps and item_ids not included in this dataset are not included in
  /// the what-if analysis.
  ///
  /// Parameter [timeSeriesTransformations] :
  /// The transformations that are applied to the baseline time series. Each
  /// transformation contains an action and a set of conditions. An action is
  /// applied only when all conditions are met. If no conditions are provided,
  /// the action is applied to all items.
  Future<CreateWhatIfForecastResponse> createWhatIfForecast({
    required String whatIfAnalysisArn,
    required String whatIfForecastName,
    List<Tag>? tags,
    TimeSeriesReplacementsDataSource? timeSeriesReplacementsDataSource,
    List<TimeSeriesTransformation>? timeSeriesTransformations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreateWhatIfForecast'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WhatIfAnalysisArn': whatIfAnalysisArn,
        'WhatIfForecastName': whatIfForecastName,
        if (tags != null) 'Tags': tags,
        if (timeSeriesReplacementsDataSource != null)
          'TimeSeriesReplacementsDataSource': timeSeriesReplacementsDataSource,
        if (timeSeriesTransformations != null)
          'TimeSeriesTransformations': timeSeriesTransformations,
      },
    );

    return CreateWhatIfForecastResponse.fromJson(jsonResponse.body);
  }

  /// Exports a forecast created by the <a>CreateWhatIfForecast</a> operation to
  /// your Amazon Simple Storage Service (Amazon S3) bucket. The forecast file
  /// name will match the following conventions:
  ///
  /// <code>≈&lt;ForecastExportJobName&gt;_&lt;ExportTimestamp&gt;_&lt;PartNumber&gt;</code>
  ///
  /// The &lt;ExportTimestamp&gt; component is in Java SimpleDateFormat
  /// (yyyy-MM-ddTHH-mm-ssZ).
  ///
  /// You must specify a <a>DataDestination</a> object that includes an Identity
  /// and Access Management (IAM) role that Amazon Forecast can assume to access
  /// the Amazon S3 bucket. For more information, see
  /// <a>aws-forecast-iam-roles</a>.
  ///
  /// For more information, see <a>howitworks-forecast</a>.
  ///
  /// To get a list of all your what-if forecast export jobs, use the
  /// <a>ListWhatIfForecastExports</a> operation.
  /// <note>
  /// The <code>Status</code> of the forecast export job must be
  /// <code>ACTIVE</code> before you can access the forecast in your Amazon S3
  /// bucket. To get the status, use the <a>DescribeWhatIfForecastExport</a>
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
  /// The location where you want to save the forecast and an Identity and
  /// Access Management (IAM) role that Amazon Forecast can assume to access the
  /// location. The forecast must be exported to an Amazon S3 bucket.
  ///
  /// If encryption is used, <code>Destination</code> must include an Key
  /// Management Service (KMS) key. The IAM role must allow Amazon Forecast
  /// permission to access the key.
  ///
  /// Parameter [whatIfForecastArns] :
  /// The list of what-if forecast Amazon Resource Names (ARNs) to export.
  ///
  /// Parameter [whatIfForecastExportName] :
  /// The name of the what-if forecast to export.
  ///
  /// Parameter [format] :
  /// The format of the exported data, CSV or PARQUET.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/tagging-forecast-resources.html">tags</a>
  /// to apply to the what if forecast.
  Future<CreateWhatIfForecastExportResponse> createWhatIfForecastExport({
    required DataDestination destination,
    required List<String> whatIfForecastArns,
    required String whatIfForecastExportName,
    String? format,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreateWhatIfForecastExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Destination': destination,
        'WhatIfForecastArns': whatIfForecastArns,
        'WhatIfForecastExportName': whatIfForecastExportName,
        if (format != null) 'Format': format,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateWhatIfForecastExportResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon Forecast dataset that was created using the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDataset.html">CreateDataset</a>
  /// operation. You can only delete datasets that have a status of
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code>. To get the status use
  /// the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDataset.html">DescribeDataset</a>
  /// operation.
  /// <note>
  /// Forecast does not automatically update any dataset groups that contain the
  /// deleted dataset. In order to update the dataset group, use the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_UpdateDatasetGroup.html">UpdateDatasetGroup</a>
  /// operation, omitting the deleted dataset's ARN.
  /// </note>
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
      'X-Amz-Target': 'AmazonForecast.DeleteDataset'
    };
    await _protocol.send(
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

  /// Deletes a dataset group created using the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetGroup.html">CreateDatasetGroup</a>
  /// operation. You can only delete dataset groups that have a status of
  /// <code>ACTIVE</code>, <code>CREATE_FAILED</code>, or
  /// <code>UPDATE_FAILED</code>. To get the status, use the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetGroup.html">DescribeDatasetGroup</a>
  /// operation.
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
    required String datasetGroupArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteDatasetGroup'
    };
    await _protocol.send(
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

  /// Deletes a dataset import job created using the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html">CreateDatasetImportJob</a>
  /// operation. You can delete only dataset import jobs that have a status of
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code>. To get the status, use
  /// the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetImportJob.html">DescribeDatasetImportJob</a>
  /// operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [datasetImportJobArn] :
  /// The Amazon Resource Name (ARN) of the dataset import job to delete.
  Future<void> deleteDatasetImportJob({
    required String datasetImportJobArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteDatasetImportJob'
    };
    await _protocol.send(
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

  /// Deletes an Explainability resource.
  ///
  /// You can delete only predictor that have a status of <code>ACTIVE</code> or
  /// <code>CREATE_FAILED</code>. To get the status, use the
  /// <a>DescribeExplainability</a> operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [explainabilityArn] :
  /// The Amazon Resource Name (ARN) of the Explainability resource to delete.
  Future<void> deleteExplainability({
    required String explainabilityArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteExplainability'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExplainabilityArn': explainabilityArn,
      },
    );
  }

  /// Deletes an Explainability export.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [explainabilityExportArn] :
  /// The Amazon Resource Name (ARN) of the Explainability export to delete.
  Future<void> deleteExplainabilityExport({
    required String explainabilityExportArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteExplainabilityExport'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExplainabilityExportArn': explainabilityExportArn,
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
    required String forecastArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteForecast'
    };
    await _protocol.send(
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
    required String forecastExportJobArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteForecastExportJob'
    };
    await _protocol.send(
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

  /// Deletes a monitor resource. You can only delete a monitor resource with a
  /// status of <code>ACTIVE</code>, <code>ACTIVE_STOPPED</code>,
  /// <code>CREATE_FAILED</code>, or <code>CREATE_STOPPED</code>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [monitorArn] :
  /// The Amazon Resource Name (ARN) of the monitor resource to delete.
  Future<void> deleteMonitor({
    required String monitorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteMonitor'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonitorArn': monitorArn,
      },
    );
  }

  /// Deletes a predictor created using the <a>DescribePredictor</a> or
  /// <a>CreatePredictor</a> operations. You can delete only predictor that have
  /// a status of <code>ACTIVE</code> or <code>CREATE_FAILED</code>. To get the
  /// status, use the <a>DescribePredictor</a> operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [predictorArn] :
  /// The Amazon Resource Name (ARN) of the predictor to delete.
  Future<void> deletePredictor({
    required String predictorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeletePredictor'
    };
    await _protocol.send(
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

  /// Deletes a predictor backtest export job.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [predictorBacktestExportJobArn] :
  /// The Amazon Resource Name (ARN) of the predictor backtest export job to
  /// delete.
  Future<void> deletePredictorBacktestExportJob({
    required String predictorBacktestExportJobArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeletePredictorBacktestExportJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PredictorBacktestExportJobArn': predictorBacktestExportJobArn,
      },
    );
  }

  /// Deletes an entire resource tree. This operation will delete the parent
  /// resource and its child resources.
  ///
  /// Child resources are resources that were created from another resource. For
  /// example, when a forecast is generated from a predictor, the forecast is
  /// the child resource and the predictor is the parent resource.
  ///
  /// Amazon Forecast resources possess the following parent-child resource
  /// hierarchies:
  ///
  /// <ul>
  /// <li>
  /// <b>Dataset</b>: dataset import jobs
  /// </li>
  /// <li>
  /// <b>Dataset Group</b>: predictors, predictor backtest export jobs,
  /// forecasts, forecast export jobs
  /// </li>
  /// <li>
  /// <b>Predictor</b>: predictor backtest export jobs, forecasts, forecast
  /// export jobs
  /// </li>
  /// <li>
  /// <b>Forecast</b>: forecast export jobs
  /// </li>
  /// </ul> <note>
  /// <code>DeleteResourceTree</code> will only delete Amazon Forecast
  /// resources, and will not delete datasets or exported files stored in Amazon
  /// S3.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the parent resource to delete. All child
  /// resources of the parent resource will also be deleted.
  Future<void> deleteResourceTree({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteResourceTree'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Deletes a what-if analysis created using the <a>CreateWhatIfAnalysis</a>
  /// operation. You can delete only what-if analyses that have a status of
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code>. To get the status, use
  /// the <a>DescribeWhatIfAnalysis</a> operation.
  ///
  /// You can't delete a what-if analysis while any of its forecasts are being
  /// exported.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [whatIfAnalysisArn] :
  /// The Amazon Resource Name (ARN) of the what-if analysis that you want to
  /// delete.
  Future<void> deleteWhatIfAnalysis({
    required String whatIfAnalysisArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteWhatIfAnalysis'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WhatIfAnalysisArn': whatIfAnalysisArn,
      },
    );
  }

  /// Deletes a what-if forecast created using the <a>CreateWhatIfForecast</a>
  /// operation. You can delete only what-if forecasts that have a status of
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code>. To get the status, use
  /// the <a>DescribeWhatIfForecast</a> operation.
  ///
  /// You can't delete a what-if forecast while it is being exported. After a
  /// what-if forecast is deleted, you can no longer query the what-if analysis.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [whatIfForecastArn] :
  /// The Amazon Resource Name (ARN) of the what-if forecast that you want to
  /// delete.
  Future<void> deleteWhatIfForecast({
    required String whatIfForecastArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteWhatIfForecast'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WhatIfForecastArn': whatIfForecastArn,
      },
    );
  }

  /// Deletes a what-if forecast export created using the
  /// <a>CreateWhatIfForecastExport</a> operation. You can delete only what-if
  /// forecast exports that have a status of <code>ACTIVE</code> or
  /// <code>CREATE_FAILED</code>. To get the status, use the
  /// <a>DescribeWhatIfForecastExport</a> operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [whatIfForecastExportArn] :
  /// The Amazon Resource Name (ARN) of the what-if forecast export that you
  /// want to delete.
  Future<void> deleteWhatIfForecastExport({
    required String whatIfForecastExportArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteWhatIfForecastExport'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WhatIfForecastExportArn': whatIfForecastExportArn,
      },
    );
  }

  /// Describes a predictor created using the CreateAutoPredictor operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [predictorArn] :
  /// The Amazon Resource Name (ARN) of the predictor.
  Future<DescribeAutoPredictorResponse> describeAutoPredictor({
    required String predictorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribeAutoPredictor'
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

    return DescribeAutoPredictorResponse.fromJson(jsonResponse.body);
  }

  /// Describes an Amazon Forecast dataset created using the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDataset.html">CreateDataset</a>
  /// operation.
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
    required String datasetArn,
  }) async {
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

  /// Describes a dataset group created using the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetGroup.html">CreateDatasetGroup</a>
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
    required String datasetGroupArn,
  }) async {
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

  /// Describes a dataset import job created using the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html">CreateDatasetImportJob</a>
  /// operation.
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
    required String datasetImportJobArn,
  }) async {
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

  /// Describes an Explainability resource created using the
  /// <a>CreateExplainability</a> operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [explainabilityArn] :
  /// The Amazon Resource Name (ARN) of the Explaianability to describe.
  Future<DescribeExplainabilityResponse> describeExplainability({
    required String explainabilityArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribeExplainability'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExplainabilityArn': explainabilityArn,
      },
    );

    return DescribeExplainabilityResponse.fromJson(jsonResponse.body);
  }

  /// Describes an Explainability export created using the
  /// <a>CreateExplainabilityExport</a> operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [explainabilityExportArn] :
  /// The Amazon Resource Name (ARN) of the Explainability export.
  Future<DescribeExplainabilityExportResponse> describeExplainabilityExport({
    required String explainabilityExportArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribeExplainabilityExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExplainabilityExportArn': explainabilityExportArn,
      },
    );

    return DescribeExplainabilityExportResponse.fromJson(jsonResponse.body);
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
    required String forecastArn,
  }) async {
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
    required String forecastExportJobArn,
  }) async {
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

  /// Describes a monitor resource. In addition to listing the properties
  /// provided in the <a>CreateMonitor</a> request, this operation lists the
  /// following properties:
  ///
  /// <ul>
  /// <li>
  /// <code>Baseline</code>
  /// </li>
  /// <li>
  /// <code>CreationTime</code>
  /// </li>
  /// <li>
  /// <code>LastEvaluationTime</code>
  /// </li>
  /// <li>
  /// <code>LastEvaluationState</code>
  /// </li>
  /// <li>
  /// <code>LastModificationTime</code>
  /// </li>
  /// <li>
  /// <code>Message</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [monitorArn] :
  /// The Amazon Resource Name (ARN) of the monitor resource to describe.
  Future<DescribeMonitorResponse> describeMonitor({
    required String monitorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribeMonitor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonitorArn': monitorArn,
      },
    );

    return DescribeMonitorResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This operation is only valid for legacy predictors created with
  /// CreatePredictor. If you are not using a legacy predictor, use
  /// <a>DescribeAutoPredictor</a>.
  /// </note>
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
    required String predictorArn,
  }) async {
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

  /// Describes a predictor backtest export job created using the
  /// <a>CreatePredictorBacktestExportJob</a> operation.
  ///
  /// In addition to listing the properties provided by the user in the
  /// <code>CreatePredictorBacktestExportJob</code> request, this operation
  /// lists the following properties:
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
  /// <code>Message</code> (if an error occurred)
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [predictorBacktestExportJobArn] :
  /// The Amazon Resource Name (ARN) of the predictor backtest export job.
  Future<DescribePredictorBacktestExportJobResponse>
      describePredictorBacktestExportJob({
    required String predictorBacktestExportJobArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribePredictorBacktestExportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PredictorBacktestExportJobArn': predictorBacktestExportJobArn,
      },
    );

    return DescribePredictorBacktestExportJobResponse.fromJson(
        jsonResponse.body);
  }

  /// Describes the what-if analysis created using the
  /// <a>CreateWhatIfAnalysis</a> operation.
  ///
  /// In addition to listing the properties provided in the
  /// <code>CreateWhatIfAnalysis</code> request, this operation lists the
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
  /// <code>Message</code> - If an error occurred, information about the error.
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [whatIfAnalysisArn] :
  /// The Amazon Resource Name (ARN) of the what-if analysis that you are
  /// interested in.
  Future<DescribeWhatIfAnalysisResponse> describeWhatIfAnalysis({
    required String whatIfAnalysisArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribeWhatIfAnalysis'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WhatIfAnalysisArn': whatIfAnalysisArn,
      },
    );

    return DescribeWhatIfAnalysisResponse.fromJson(jsonResponse.body);
  }

  /// Describes the what-if forecast created using the
  /// <a>CreateWhatIfForecast</a> operation.
  ///
  /// In addition to listing the properties provided in the
  /// <code>CreateWhatIfForecast</code> request, this operation lists the
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
  /// <code>Message</code> - If an error occurred, information about the error.
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [whatIfForecastArn] :
  /// The Amazon Resource Name (ARN) of the what-if forecast that you are
  /// interested in.
  Future<DescribeWhatIfForecastResponse> describeWhatIfForecast({
    required String whatIfForecastArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribeWhatIfForecast'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WhatIfForecastArn': whatIfForecastArn,
      },
    );

    return DescribeWhatIfForecastResponse.fromJson(jsonResponse.body);
  }

  /// Describes the what-if forecast export created using the
  /// <a>CreateWhatIfForecastExport</a> operation.
  ///
  /// In addition to listing the properties provided in the
  /// <code>CreateWhatIfForecastExport</code> request, this operation lists the
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
  /// <code>Message</code> - If an error occurred, information about the error.
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [whatIfForecastExportArn] :
  /// The Amazon Resource Name (ARN) of the what-if forecast export that you are
  /// interested in.
  Future<DescribeWhatIfForecastExportResponse> describeWhatIfForecastExport({
    required String whatIfForecastExportArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribeWhatIfForecastExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WhatIfForecastExportArn': whatIfForecastExportArn,
      },
    );

    return DescribeWhatIfForecastExportResponse.fromJson(jsonResponse.body);
  }

  /// Provides metrics on the accuracy of the models that were trained by the
  /// <a>CreatePredictor</a> operation. Use metrics to see how well the model
  /// performed and to decide whether to use the predictor to generate a
  /// forecast. For more information, see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/metrics.html">Predictor
  /// Metrics</a>.
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
    required String predictorArn,
  }) async {
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

  /// Returns a list of dataset groups created using the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetGroup.html">CreateDatasetGroup</a>
  /// operation. For each dataset group, this operation returns a summary of its
  /// properties, including its Amazon Resource Name (ARN). You can retrieve the
  /// complete set of properties by using the dataset group ARN with the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetGroup.html">DescribeDatasetGroup</a>
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
      'X-Amz-Target': 'AmazonForecast.ListDatasetGroups'
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

    return ListDatasetGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of dataset import jobs created using the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html">CreateDatasetImportJob</a>
  /// operation. For each import job, this operation returns a summary of its
  /// properties, including its Amazon Resource Name (ARN). You can retrieve the
  /// complete set of properties by using the ARN with the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetImportJob.html">DescribeDatasetImportJob</a>
  /// operation. You can filter the list by providing an array of <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_Filter.html">Filter</a>
  /// objects.
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
    List<Filter>? filters,
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
      'X-Amz-Target': 'AmazonForecast.ListDatasetImportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDatasetImportJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of datasets created using the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDataset.html">CreateDataset</a>
  /// operation. For each dataset, a summary of its properties, including its
  /// Amazon Resource Name (ARN), is returned. To retrieve the complete set of
  /// properties, use the ARN with the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDataset.html">DescribeDataset</a>
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
  Future<ListDatasetsResponse> listDatasets({
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
      'X-Amz-Target': 'AmazonForecast.ListDatasets'
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

    return ListDatasetsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of Explainability resources created using the
  /// <a>CreateExplainability</a> operation. This operation returns a summary
  /// for each Explainability. You can filter the list using an array of
  /// <a>Filter</a> objects.
  ///
  /// To retrieve the complete set of properties for a particular Explainability
  /// resource, use the ARN with the <a>DescribeExplainability</a> operation.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filters] :
  /// An array of filters. For each filter, provide a condition and a match
  /// statement. The condition is either <code>IS</code> or <code>IS_NOT</code>,
  /// which specifies whether to include or exclude the resources that match the
  /// statement from the list. The match statement consists of a key and a
  /// value.
  ///
  /// <b>Filter properties</b>
  ///
  /// <ul>
  /// <li>
  /// <code>Condition</code> - The condition to apply. Valid values are
  /// <code>IS</code> and <code>IS_NOT</code>.
  /// </li>
  /// <li>
  /// <code>Key</code> - The name of the parameter to filter on. Valid values
  /// are <code>ResourceArn</code> and <code>Status</code>.
  /// </li>
  /// <li>
  /// <code>Value</code> - The value to match.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The number of items returned in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a NextToken. To retrieve the next set of results, use the token in the
  /// next request. Tokens expire after 24 hours.
  Future<ListExplainabilitiesResponse> listExplainabilities({
    List<Filter>? filters,
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
      'X-Amz-Target': 'AmazonForecast.ListExplainabilities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListExplainabilitiesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of Explainability exports created using the
  /// <a>CreateExplainabilityExport</a> operation. This operation returns a
  /// summary for each Explainability export. You can filter the list using an
  /// array of <a>Filter</a> objects.
  ///
  /// To retrieve the complete set of properties for a particular Explainability
  /// export, use the ARN with the <a>DescribeExplainability</a> operation.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filters] :
  /// An array of filters. For each filter, provide a condition and a match
  /// statement. The condition is either <code>IS</code> or <code>IS_NOT</code>,
  /// which specifies whether to include or exclude resources that match the
  /// statement from the list. The match statement consists of a key and a
  /// value.
  ///
  /// <b>Filter properties</b>
  ///
  /// <ul>
  /// <li>
  /// <code>Condition</code> - The condition to apply. Valid values are
  /// <code>IS</code> and <code>IS_NOT</code>.
  /// </li>
  /// <li>
  /// <code>Key</code> - The name of the parameter to filter on. Valid values
  /// are <code>ResourceArn</code> and <code>Status</code>.
  /// </li>
  /// <li>
  /// <code>Value</code> - The value to match.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a NextToken. To retrieve the next set of results, use the token in the
  /// next request. Tokens expire after 24 hours.
  Future<ListExplainabilityExportsResponse> listExplainabilityExports({
    List<Filter>? filters,
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
      'X-Amz-Target': 'AmazonForecast.ListExplainabilityExports'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListExplainabilityExportsResponse.fromJson(jsonResponse.body);
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
    List<Filter>? filters,
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
      'X-Amz-Target': 'AmazonForecast.ListForecastExportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
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
    List<Filter>? filters,
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
      'X-Amz-Target': 'AmazonForecast.ListForecasts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListForecastsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of the monitoring evaluation results and predictor events
  /// collected by the monitor resource during different windows of time.
  ///
  /// For information about monitoring see <a>predictor-monitoring</a>. For more
  /// information about retrieving monitoring results see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/predictor-monitoring-results.html">Viewing
  /// Monitoring Results</a>.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [monitorArn] :
  /// The Amazon Resource Name (ARN) of the monitor resource to get results
  /// from.
  ///
  /// Parameter [filters] :
  /// An array of filters. For each filter, provide a condition and a match
  /// statement. The condition is either <code>IS</code> or <code>IS_NOT</code>,
  /// which specifies whether to include or exclude the resources that match the
  /// statement from the list. The match statement consists of a key and a
  /// value.
  ///
  /// <b>Filter properties</b>
  ///
  /// <ul>
  /// <li>
  /// <code>Condition</code> - The condition to apply. Valid values are
  /// <code>IS</code> and <code>IS_NOT</code>.
  /// </li>
  /// <li>
  /// <code>Key</code> - The name of the parameter to filter on. The only valid
  /// value is <code>EvaluationState</code>.
  /// </li>
  /// <li>
  /// <code>Value</code> - The value to match. Valid values are only
  /// <code>SUCCESS</code> or <code>FAILURE</code>.
  /// </li>
  /// </ul>
  /// For example, to list only successful monitor evaluations, you would
  /// specify:
  ///
  /// <code>"Filters": [ { "Condition": "IS", "Key": "EvaluationState", "Value":
  /// "SUCCESS" } ]</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of monitoring results to return.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
  Future<ListMonitorEvaluationsResponse> listMonitorEvaluations({
    required String monitorArn,
    List<Filter>? filters,
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
      'X-Amz-Target': 'AmazonForecast.ListMonitorEvaluations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonitorArn': monitorArn,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListMonitorEvaluationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of monitors created with the <a>CreateMonitor</a> operation
  /// and <a>CreateAutoPredictor</a> operation. For each monitor resource, this
  /// operation returns of a summary of its properties, including its Amazon
  /// Resource Name (ARN). You can retrieve a complete set of properties of a
  /// monitor resource by specify the monitor's ARN in the
  /// <a>DescribeMonitor</a> operation.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filters] :
  /// An array of filters. For each filter, provide a condition and a match
  /// statement. The condition is either <code>IS</code> or <code>IS_NOT</code>,
  /// which specifies whether to include or exclude the resources that match the
  /// statement from the list. The match statement consists of a key and a
  /// value.
  ///
  /// <b>Filter properties</b>
  ///
  /// <ul>
  /// <li>
  /// <code>Condition</code> - The condition to apply. Valid values are
  /// <code>IS</code> and <code>IS_NOT</code>.
  /// </li>
  /// <li>
  /// <code>Key</code> - The name of the parameter to filter on. The only valid
  /// value is <code>Status</code>.
  /// </li>
  /// <li>
  /// <code>Value</code> - The value to match.
  /// </li>
  /// </ul>
  /// For example, to list all monitors who's status is ACTIVE, you would
  /// specify:
  ///
  /// <code>"Filters": [ { "Condition": "IS", "Key": "Status", "Value": "ACTIVE"
  /// } ]</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of monitors to include in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
  Future<ListMonitorsResponse> listMonitors({
    List<Filter>? filters,
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
      'X-Amz-Target': 'AmazonForecast.ListMonitors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListMonitorsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of predictor backtest export jobs created using the
  /// <a>CreatePredictorBacktestExportJob</a> operation. This operation returns
  /// a summary for each backtest export job. You can filter the list using an
  /// array of <a>Filter</a> objects.
  ///
  /// To retrieve the complete set of properties for a particular backtest
  /// export job, use the ARN with the <a>DescribePredictorBacktestExportJob</a>
  /// operation.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filters] :
  /// An array of filters. For each filter, provide a condition and a match
  /// statement. The condition is either <code>IS</code> or <code>IS_NOT</code>,
  /// which specifies whether to include or exclude the predictor backtest
  /// export jobs that match the statement from the list. The match statement
  /// consists of a key and a value.
  ///
  /// <b>Filter properties</b>
  ///
  /// <ul>
  /// <li>
  /// <code>Condition</code> - The condition to apply. Valid values are
  /// <code>IS</code> and <code>IS_NOT</code>. To include the predictor backtest
  /// export jobs that match the statement, specify <code>IS</code>. To exclude
  /// matching predictor backtest export jobs, specify <code>IS_NOT</code>.
  /// </li>
  /// <li>
  /// <code>Key</code> - The name of the parameter to filter on. Valid values
  /// are <code>PredictorArn</code> and <code>Status</code>.
  /// </li>
  /// <li>
  /// <code>Value</code> - The value to match.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a NextToken. To retrieve the next set of results, use the token in the
  /// next request. Tokens expire after 24 hours.
  Future<ListPredictorBacktestExportJobsResponse>
      listPredictorBacktestExportJobs({
    List<Filter>? filters,
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
      'X-Amz-Target': 'AmazonForecast.ListPredictorBacktestExportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPredictorBacktestExportJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of predictors created using the <a>CreateAutoPredictor</a>
  /// or <a>CreatePredictor</a> operations. For each predictor, this operation
  /// returns a summary of its properties, including its Amazon Resource Name
  /// (ARN).
  ///
  /// You can retrieve the complete set of properties by using the ARN with the
  /// <a>DescribeAutoPredictor</a> and <a>DescribePredictor</a> operations. You
  /// can filter the list using an array of <a>Filter</a> objects.
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
    List<Filter>? filters,
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
      'X-Amz-Target': 'AmazonForecast.ListPredictors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPredictorsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags for an Amazon Forecast resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource for which to
  /// list the tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of what-if analyses created using the
  /// <a>CreateWhatIfAnalysis</a> operation. For each what-if analysis, this
  /// operation returns a summary of its properties, including its Amazon
  /// Resource Name (ARN). You can retrieve the complete set of properties by
  /// using the what-if analysis ARN with the <a>DescribeWhatIfAnalysis</a>
  /// operation.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filters] :
  /// An array of filters. For each filter, you provide a condition and a match
  /// statement. The condition is either <code>IS</code> or <code>IS_NOT</code>,
  /// which specifies whether to include or exclude the what-if analysis jobs
  /// that match the statement from the list, respectively. The match statement
  /// consists of a key and a value.
  ///
  /// <b>Filter properties</b>
  ///
  /// <ul>
  /// <li>
  /// <code>Condition</code> - The condition to apply. Valid values are
  /// <code>IS</code> and <code>IS_NOT</code>. To include the what-if analysis
  /// jobs that match the statement, specify <code>IS</code>. To exclude
  /// matching what-if analysis jobs, specify <code>IS_NOT</code>.
  /// </li>
  /// <li>
  /// <code>Key</code> - The name of the parameter to filter on. Valid values
  /// are <code>WhatIfAnalysisArn</code> and <code>Status</code>.
  /// </li>
  /// <li>
  /// <code>Value</code> - The value to match.
  /// </li>
  /// </ul>
  /// For example, to list all jobs that export a forecast named
  /// <i>electricityWhatIf</i>, specify the following filter:
  ///
  /// <code>"Filters": [ { "Condition": "IS", "Key": "WhatIfAnalysisArn",
  /// "Value":
  /// "arn:aws:forecast:us-west-2:&lt;acct-id&gt;:forecast/electricityWhatIf" }
  /// ]</code>
  ///
  /// Parameter [maxResults] :
  /// The number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
  Future<ListWhatIfAnalysesResponse> listWhatIfAnalyses({
    List<Filter>? filters,
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
      'X-Amz-Target': 'AmazonForecast.ListWhatIfAnalyses'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListWhatIfAnalysesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of what-if forecast exports created using the
  /// <a>CreateWhatIfForecastExport</a> operation. For each what-if forecast
  /// export, this operation returns a summary of its properties, including its
  /// Amazon Resource Name (ARN). You can retrieve the complete set of
  /// properties by using the what-if forecast export ARN with the
  /// <a>DescribeWhatIfForecastExport</a> operation.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filters] :
  /// An array of filters. For each filter, you provide a condition and a match
  /// statement. The condition is either <code>IS</code> or <code>IS_NOT</code>,
  /// which specifies whether to include or exclude the what-if forecast export
  /// jobs that match the statement from the list, respectively. The match
  /// statement consists of a key and a value.
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
  /// are <code>WhatIfForecastExportArn</code> and <code>Status</code>.
  /// </li>
  /// <li>
  /// <code>Value</code> - The value to match.
  /// </li>
  /// </ul>
  /// For example, to list all jobs that export a forecast named
  /// <i>electricityWIFExport</i>, specify the following filter:
  ///
  /// <code>"Filters": [ { "Condition": "IS", "Key": "WhatIfForecastExportArn",
  /// "Value":
  /// "arn:aws:forecast:us-west-2:&lt;acct-id&gt;:forecast/electricityWIFExport"
  /// } ]</code>
  ///
  /// Parameter [maxResults] :
  /// The number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next&#x2028; request. Tokens expire after 24 hours.
  Future<ListWhatIfForecastExportsResponse> listWhatIfForecastExports({
    List<Filter>? filters,
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
      'X-Amz-Target': 'AmazonForecast.ListWhatIfForecastExports'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListWhatIfForecastExportsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of what-if forecasts created using the
  /// <a>CreateWhatIfForecast</a> operation. For each what-if forecast, this
  /// operation returns a summary of its properties, including its Amazon
  /// Resource Name (ARN). You can retrieve the complete set of properties by
  /// using the what-if forecast ARN with the <a>DescribeWhatIfForecast</a>
  /// operation.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filters] :
  /// An array of filters. For each filter, you provide a condition and a match
  /// statement. The condition is either <code>IS</code> or <code>IS_NOT</code>,
  /// which specifies whether to include or exclude the what-if forecast export
  /// jobs that match the statement from the list, respectively. The match
  /// statement consists of a key and a value.
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
  /// are <code>WhatIfForecastArn</code> and <code>Status</code>.
  /// </li>
  /// <li>
  /// <code>Value</code> - The value to match.
  /// </li>
  /// </ul>
  /// For example, to list all jobs that export a forecast named
  /// <i>electricityWhatIfForecast</i>, specify the following filter:
  ///
  /// <code>"Filters": [ { "Condition": "IS", "Key": "WhatIfForecastArn",
  /// "Value":
  /// "arn:aws:forecast:us-west-2:&lt;acct-id&gt;:forecast/electricityWhatIfForecast"
  /// } ]</code>
  ///
  /// Parameter [maxResults] :
  /// The number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next&#x2028; request. Tokens expire after 24 hours.
  Future<ListWhatIfForecastsResponse> listWhatIfForecasts({
    List<Filter>? filters,
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
      'X-Amz-Target': 'AmazonForecast.ListWhatIfForecasts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListWhatIfForecastsResponse.fromJson(jsonResponse.body);
  }

  /// Resumes a stopped monitor resource.
  ///
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the monitor resource to resume.
  Future<void> resumeResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.ResumeResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Stops a resource.
  ///
  /// The resource undergoes the following states: <code>CREATE_STOPPING</code>
  /// and <code>CREATE_STOPPED</code>. You cannot resume a resource once it has
  /// been stopped.
  ///
  /// This operation can be applied to the following resources (and their
  /// corresponding child resources):
  ///
  /// <ul>
  /// <li>
  /// Dataset Import Job
  /// </li>
  /// <li>
  /// Predictor Job
  /// </li>
  /// <li>
  /// Forecast Job
  /// </li>
  /// <li>
  /// Forecast Export Job
  /// </li>
  /// <li>
  /// Predictor Backtest Export Job
  /// </li>
  /// <li>
  /// Explainability Job
  /// </li>
  /// <li>
  /// Explainability Export Job
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource to stop. The
  /// supported ARNs are <code>DatasetImportJobArn</code>,
  /// <code>PredictorArn</code>, <code>PredictorBacktestExportJobArn</code>,
  /// <code>ForecastArn</code>, <code>ForecastExportJobArn</code>,
  /// <code>ExplainabilityArn</code>, and <code>ExplainabilityExportArn</code>.
  Future<void> stopResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.StopResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Associates the specified tags to a resource with the specified
  /// <code>resourceArn</code>. If existing tags on a resource are not specified
  /// in the request parameters, they are not changed. When a resource is
  /// deleted, the tags associated with that resource are also deleted.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource for which to
  /// list the tags.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource. A tag is an array of key-value pairs.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50.
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for keys as it is reserved for Amazon Web
  /// Services use. You cannot edit or delete tag keys with this prefix. Values
  /// can have this prefix. If a tag value has <code>aws</code> as its prefix
  /// but the key does not, then Forecast considers it to be a user tag and will
  /// count against the limit of 50 tags. Tags with only the key prefix of
  /// <code>aws</code> do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Deletes the specified tags from a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource for which to
  /// list the tags.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Replaces the datasets in a dataset group with the specified datasets.
  /// <note>
  /// The <code>Status</code> of the dataset group must be <code>ACTIVE</code>
  /// before you can use the dataset group to create a predictor. Use the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetGroup.html">DescribeDatasetGroup</a>
  /// operation to get the status.
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
    required List<String> datasetArns,
    required String datasetGroupArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.UpdateDatasetGroup'
    };
    await _protocol.send(
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
  }
}

/// Defines the modifications that you are making to an attribute for a what-if
/// forecast. For example, you can use this operation to create a what-if
/// forecast that investigates a 10% off sale on all shoes. To do this, you
/// specify <code>"AttributeName": "shoes"</code>, <code>"Operation":
/// "MULTIPLY"</code>, and <code>"Value": "0.90"</code>. Pair this operation
/// with the <a>TimeSeriesCondition</a> operation within the
/// <a>CreateWhatIfForecastRequest$TimeSeriesTransformations</a> operation to
/// define a subset of attribute items that are modified.
class Action {
  /// The related time series that you are modifying. This value is case
  /// insensitive.
  final String attributeName;

  /// The operation that is applied to the provided attribute. Operations include:
  ///
  /// <ul>
  /// <li>
  /// <code>ADD</code> - adds <code>Value</code> to all rows of
  /// <code>AttributeName</code>.
  /// </li>
  /// <li>
  /// <code>SUBTRACT</code> - subtracts <code>Value</code> from all rows of
  /// <code>AttributeName</code>.
  /// </li>
  /// <li>
  /// <code>MULTIPLY</code> - multiplies all rows of <code>AttributeName</code> by
  /// <code>Value</code>.
  /// </li>
  /// <li>
  /// <code>DIVIDE</code> - divides all rows of <code>AttributeName</code> by
  /// <code>Value</code>.
  /// </li>
  /// </ul>
  final Operation operation;

  /// The value that is applied for the chosen <code>Operation</code>.
  final double value;

  Action({
    required this.attributeName,
    required this.operation,
    required this.value,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      attributeName: json['AttributeName'] as String,
      operation: (json['Operation'] as String).toOperation(),
      value: json['Value'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final operation = this.operation;
    final value = this.value;
    return {
      'AttributeName': attributeName,
      'Operation': operation.toValue(),
      'Value': value,
    };
  }
}

/// Describes an additional dataset. This object is part of the
/// <a>DataConfig</a> object. Forecast supports the Weather Index and Holidays
/// additional datasets.
///
/// <b>Weather Index</b>
///
/// The Amazon Forecast Weather Index is a built-in dataset that incorporates
/// historical and projected weather information into your model. The Weather
/// Index supplements your datasets with over two years of historical weather
/// data and up to 14 days of projected weather data. For more information, see
/// <a href="https://docs.aws.amazon.com/forecast/latest/dg/weather.html">Amazon
/// Forecast Weather Index</a>.
///
/// <b>Holidays</b>
///
/// Holidays is a built-in dataset that incorporates national holiday
/// information into your model. It provides native support for the holiday
/// calendars of 66 countries. To view the holiday calendars, refer to the <a
/// href="http://jollyday.sourceforge.net/data.html">Jollyday</a> library. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/holidays.html">Holidays
/// Featurization</a>.
class AdditionalDataset {
  /// The name of the additional dataset. Valid names: <code>"holiday"</code> and
  /// <code>"weather"</code>.
  final String name;

  /// <b>Weather Index</b>
  ///
  /// To enable the Weather Index, do not specify a value for
  /// <code>Configuration</code>.
  ///
  /// <b>Holidays</b>
  ///
  /// <b>Holidays</b>
  ///
  /// To enable Holidays, set <code>CountryCode</code> to one of the following
  /// two-letter country codes:
  ///
  /// <ul>
  /// <li>
  /// "AL" - ALBANIA
  /// </li>
  /// <li>
  /// "AR" - ARGENTINA
  /// </li>
  /// <li>
  /// "AT" - AUSTRIA
  /// </li>
  /// <li>
  /// "AU" - AUSTRALIA
  /// </li>
  /// <li>
  /// "BA" - BOSNIA HERZEGOVINA
  /// </li>
  /// <li>
  /// "BE" - BELGIUM
  /// </li>
  /// <li>
  /// "BG" - BULGARIA
  /// </li>
  /// <li>
  /// "BO" - BOLIVIA
  /// </li>
  /// <li>
  /// "BR" - BRAZIL
  /// </li>
  /// <li>
  /// "BY" - BELARUS
  /// </li>
  /// <li>
  /// "CA" - CANADA
  /// </li>
  /// <li>
  /// "CL" - CHILE
  /// </li>
  /// <li>
  /// "CO" - COLOMBIA
  /// </li>
  /// <li>
  /// "CR" - COSTA RICA
  /// </li>
  /// <li>
  /// "HR" - CROATIA
  /// </li>
  /// <li>
  /// "CZ" - CZECH REPUBLIC
  /// </li>
  /// <li>
  /// "DK" - DENMARK
  /// </li>
  /// <li>
  /// "EC" - ECUADOR
  /// </li>
  /// <li>
  /// "EE" - ESTONIA
  /// </li>
  /// <li>
  /// "ET" - ETHIOPIA
  /// </li>
  /// <li>
  /// "FI" - FINLAND
  /// </li>
  /// <li>
  /// "FR" - FRANCE
  /// </li>
  /// <li>
  /// "DE" - GERMANY
  /// </li>
  /// <li>
  /// "GR" - GREECE
  /// </li>
  /// <li>
  /// "HU" - HUNGARY
  /// </li>
  /// <li>
  /// "IS" - ICELAND
  /// </li>
  /// <li>
  /// "IN" - INDIA
  /// </li>
  /// <li>
  /// "IE" - IRELAND
  /// </li>
  /// <li>
  /// "IT" - ITALY
  /// </li>
  /// <li>
  /// "JP" - JAPAN
  /// </li>
  /// <li>
  /// "KZ" - KAZAKHSTAN
  /// </li>
  /// <li>
  /// "KR" - KOREA
  /// </li>
  /// <li>
  /// "LV" - LATVIA
  /// </li>
  /// <li>
  /// "LI" - LIECHTENSTEIN
  /// </li>
  /// <li>
  /// "LT" - LITHUANIA
  /// </li>
  /// <li>
  /// "LU" - LUXEMBOURG
  /// </li>
  /// <li>
  /// "MK" - MACEDONIA
  /// </li>
  /// <li>
  /// "MT" - MALTA
  /// </li>
  /// <li>
  /// "MX" - MEXICO
  /// </li>
  /// <li>
  /// "MD" - MOLDOVA
  /// </li>
  /// <li>
  /// "ME" - MONTENEGRO
  /// </li>
  /// <li>
  /// "NL" - NETHERLANDS
  /// </li>
  /// <li>
  /// "NZ" - NEW ZEALAND
  /// </li>
  /// <li>
  /// "NI" - NICARAGUA
  /// </li>
  /// <li>
  /// "NG" - NIGERIA
  /// </li>
  /// <li>
  /// "NO" - NORWAY
  /// </li>
  /// <li>
  /// "PA" - PANAMA
  /// </li>
  /// <li>
  /// "PY" - PARAGUAY
  /// </li>
  /// <li>
  /// "PE" - PERU
  /// </li>
  /// <li>
  /// "PL" - POLAND
  /// </li>
  /// <li>
  /// "PT" - PORTUGAL
  /// </li>
  /// <li>
  /// "RO" - ROMANIA
  /// </li>
  /// <li>
  /// "RU" - RUSSIA
  /// </li>
  /// <li>
  /// "RS" - SERBIA
  /// </li>
  /// <li>
  /// "SK" - SLOVAKIA
  /// </li>
  /// <li>
  /// "SI" - SLOVENIA
  /// </li>
  /// <li>
  /// "ZA" - SOUTH AFRICA
  /// </li>
  /// <li>
  /// "ES" - SPAIN
  /// </li>
  /// <li>
  /// "SE" - SWEDEN
  /// </li>
  /// <li>
  /// "CH" - SWITZERLAND
  /// </li>
  /// <li>
  /// "UA" - UKRAINE
  /// </li>
  /// <li>
  /// "AE" - UNITED ARAB EMIRATES
  /// </li>
  /// <li>
  /// "US" - UNITED STATES
  /// </li>
  /// <li>
  /// "UK" - UNITED KINGDOM
  /// </li>
  /// <li>
  /// "UY" - URUGUAY
  /// </li>
  /// <li>
  /// "VE" - VENEZUELA
  /// </li>
  /// </ul>
  final Map<String, List<String>>? configuration;

  AdditionalDataset({
    required this.name,
    this.configuration,
  });

  factory AdditionalDataset.fromJson(Map<String, dynamic> json) {
    return AdditionalDataset(
      name: json['Name'] as String,
      configuration: (json['Configuration'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final configuration = this.configuration;
    return {
      'Name': name,
      if (configuration != null) 'Configuration': configuration,
    };
  }
}

/// Provides information about the method used to transform attributes.
///
/// The following is an example using the RETAIL domain:
///
/// <code>{</code>
///
/// <code>"AttributeName": "demand",</code>
///
/// <code>"Transformations": {"aggregation": "sum", "middlefill": "zero",
/// "backfill": "zero"}</code>
///
/// <code>}</code>
class AttributeConfig {
  /// The name of the attribute as specified in the schema. Amazon Forecast
  /// supports the target field of the target time series and the related time
  /// series datasets. For example, for the RETAIL domain, the target is
  /// <code>demand</code>.
  final String attributeName;

  /// The method parameters (key-value pairs), which are a map of override
  /// parameters. Specify these parameters to override the default values. Related
  /// Time Series attributes do not accept aggregation parameters.
  ///
  /// The following list shows the parameters and their valid values for the
  /// "filling" featurization method for a <b>Target Time Series</b> dataset.
  /// Default values are bolded.
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
  /// <code>middlefill</code>: <b>zero</b>, <code>nan</code> (not a number),
  /// <code>value</code>, <code>median</code>, <code>mean</code>,
  /// <code>min</code>, <code>max</code>
  /// </li>
  /// <li>
  /// <code>backfill</code>: <b>zero</b>, <code>nan</code>, <code>value</code>,
  /// <code>median</code>, <code>mean</code>, <code>min</code>, <code>max</code>
  /// </li>
  /// </ul>
  /// The following list shows the parameters and their valid values for a
  /// <b>Related Time Series</b> featurization method (there are no defaults):
  ///
  /// <ul>
  /// <li>
  /// <code>middlefill</code>: <code>zero</code>, <code>value</code>,
  /// <code>median</code>, <code>mean</code>, <code>min</code>, <code>max</code>
  /// </li>
  /// <li>
  /// <code>backfill</code>: <code>zero</code>, <code>value</code>,
  /// <code>median</code>, <code>mean</code>, <code>min</code>, <code>max</code>
  /// </li>
  /// <li>
  /// <code>futurefill</code>: <code>zero</code>, <code>value</code>,
  /// <code>median</code>, <code>mean</code>, <code>min</code>, <code>max</code>
  /// </li>
  /// </ul>
  /// To set a filling method to a specific value, set the fill parameter to
  /// <code>value</code> and define the value in a corresponding
  /// <code>_value</code> parameter. For example, to set backfilling to a value of
  /// 2, include the following: <code>"backfill": "value"</code> and
  /// <code>"backfill_value":"2"</code>.
  final Map<String, String> transformations;

  AttributeConfig({
    required this.attributeName,
    required this.transformations,
  });

  factory AttributeConfig.fromJson(Map<String, dynamic> json) {
    return AttributeConfig(
      attributeName: json['AttributeName'] as String,
      transformations: (json['Transformations'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final transformations = this.transformations;
    return {
      'AttributeName': attributeName,
      'Transformations': transformations,
    };
  }
}

enum AttributeType {
  string,
  integer,
  float,
  timestamp,
  geolocation,
}

extension AttributeTypeValueExtension on AttributeType {
  String toValue() {
    switch (this) {
      case AttributeType.string:
        return 'string';
      case AttributeType.integer:
        return 'integer';
      case AttributeType.float:
        return 'float';
      case AttributeType.timestamp:
        return 'timestamp';
      case AttributeType.geolocation:
        return 'geolocation';
    }
  }
}

extension AttributeTypeFromString on String {
  AttributeType toAttributeType() {
    switch (this) {
      case 'string':
        return AttributeType.string;
      case 'integer':
        return AttributeType.integer;
      case 'float':
        return AttributeType.float;
      case 'timestamp':
        return AttributeType.timestamp;
      case 'geolocation':
        return AttributeType.geolocation;
    }
    throw Exception('$this is not known in enum AttributeType');
  }
}

enum AutoMLOverrideStrategy {
  latencyOptimized,
  accuracyOptimized,
}

extension AutoMLOverrideStrategyValueExtension on AutoMLOverrideStrategy {
  String toValue() {
    switch (this) {
      case AutoMLOverrideStrategy.latencyOptimized:
        return 'LatencyOptimized';
      case AutoMLOverrideStrategy.accuracyOptimized:
        return 'AccuracyOptimized';
    }
  }
}

extension AutoMLOverrideStrategyFromString on String {
  AutoMLOverrideStrategy toAutoMLOverrideStrategy() {
    switch (this) {
      case 'LatencyOptimized':
        return AutoMLOverrideStrategy.latencyOptimized;
      case 'AccuracyOptimized':
        return AutoMLOverrideStrategy.accuracyOptimized;
    }
    throw Exception('$this is not known in enum AutoMLOverrideStrategy');
  }
}

/// Metrics you can use as a baseline for comparison purposes. Use these metrics
/// when you interpret monitoring results for an auto predictor.
class Baseline {
  /// The initial <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/metrics.html">accuracy
  /// metrics</a> for the predictor you are monitoring. Use these metrics as a
  /// baseline for comparison purposes as you use your predictor and the metrics
  /// change.
  final PredictorBaseline? predictorBaseline;

  Baseline({
    this.predictorBaseline,
  });

  factory Baseline.fromJson(Map<String, dynamic> json) {
    return Baseline(
      predictorBaseline: json['PredictorBaseline'] != null
          ? PredictorBaseline.fromJson(
              json['PredictorBaseline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final predictorBaseline = this.predictorBaseline;
    return {
      if (predictorBaseline != null) 'PredictorBaseline': predictorBaseline,
    };
  }
}

/// An individual metric that you can use for comparison as you evaluate your
/// monitoring results.
class BaselineMetric {
  /// The name of the metric.
  final String? name;

  /// The value for the metric.
  final double? value;

  BaselineMetric({
    this.name,
    this.value,
  });

  factory BaselineMetric.fromJson(Map<String, dynamic> json) {
    return BaselineMetric(
      name: json['Name'] as String?,
      value: json['Value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// Specifies a categorical hyperparameter and it's range of tunable values.
/// This object is part of the <a>ParameterRanges</a> object.
class CategoricalParameterRange {
  /// The name of the categorical hyperparameter to tune.
  final String name;

  /// A list of the tunable categories for the hyperparameter.
  final List<String> values;

  CategoricalParameterRange({
    required this.name,
    required this.values,
  });

  factory CategoricalParameterRange.fromJson(Map<String, dynamic> json) {
    return CategoricalParameterRange(
      name: json['Name'] as String,
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name,
      'Values': values,
    };
  }
}

enum Condition {
  equals,
  notEquals,
  lessThan,
  greaterThan,
}

extension ConditionValueExtension on Condition {
  String toValue() {
    switch (this) {
      case Condition.equals:
        return 'EQUALS';
      case Condition.notEquals:
        return 'NOT_EQUALS';
      case Condition.lessThan:
        return 'LESS_THAN';
      case Condition.greaterThan:
        return 'GREATER_THAN';
    }
  }
}

extension ConditionFromString on String {
  Condition toCondition() {
    switch (this) {
      case 'EQUALS':
        return Condition.equals;
      case 'NOT_EQUALS':
        return Condition.notEquals;
      case 'LESS_THAN':
        return Condition.lessThan;
      case 'GREATER_THAN':
        return Condition.greaterThan;
    }
    throw Exception('$this is not known in enum Condition');
  }
}

/// Specifies a continuous hyperparameter and it's range of tunable values. This
/// object is part of the <a>ParameterRanges</a> object.
class ContinuousParameterRange {
  /// The maximum tunable value of the hyperparameter.
  final double maxValue;

  /// The minimum tunable value of the hyperparameter.
  final double minValue;

  /// The name of the hyperparameter to tune.
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
  final ScalingType? scalingType;

  ContinuousParameterRange({
    required this.maxValue,
    required this.minValue,
    required this.name,
    this.scalingType,
  });

  factory ContinuousParameterRange.fromJson(Map<String, dynamic> json) {
    return ContinuousParameterRange(
      maxValue: json['MaxValue'] as double,
      minValue: json['MinValue'] as double,
      name: json['Name'] as String,
      scalingType: (json['ScalingType'] as String?)?.toScalingType(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxValue = this.maxValue;
    final minValue = this.minValue;
    final name = this.name;
    final scalingType = this.scalingType;
    return {
      'MaxValue': maxValue,
      'MinValue': minValue,
      'Name': name,
      if (scalingType != null) 'ScalingType': scalingType.toValue(),
    };
  }
}

class CreateAutoPredictorResponse {
  /// The Amazon Resource Name (ARN) of the predictor.
  final String? predictorArn;

  CreateAutoPredictorResponse({
    this.predictorArn,
  });

  factory CreateAutoPredictorResponse.fromJson(Map<String, dynamic> json) {
    return CreateAutoPredictorResponse(
      predictorArn: json['PredictorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final predictorArn = this.predictorArn;
    return {
      if (predictorArn != null) 'PredictorArn': predictorArn,
    };
  }
}

class CreateDatasetGroupResponse {
  /// The Amazon Resource Name (ARN) of the dataset group.
  final String? datasetGroupArn;

  CreateDatasetGroupResponse({
    this.datasetGroupArn,
  });

  factory CreateDatasetGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetGroupResponse(
      datasetGroupArn: json['DatasetGroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetGroupArn = this.datasetGroupArn;
    return {
      if (datasetGroupArn != null) 'DatasetGroupArn': datasetGroupArn,
    };
  }
}

class CreateDatasetImportJobResponse {
  /// The Amazon Resource Name (ARN) of the dataset import job.
  final String? datasetImportJobArn;

  CreateDatasetImportJobResponse({
    this.datasetImportJobArn,
  });

  factory CreateDatasetImportJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetImportJobResponse(
      datasetImportJobArn: json['DatasetImportJobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetImportJobArn = this.datasetImportJobArn;
    return {
      if (datasetImportJobArn != null)
        'DatasetImportJobArn': datasetImportJobArn,
    };
  }
}

class CreateDatasetResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  final String? datasetArn;

  CreateDatasetResponse({
    this.datasetArn,
  });

  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetResponse(
      datasetArn: json['DatasetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetArn = this.datasetArn;
    return {
      if (datasetArn != null) 'DatasetArn': datasetArn,
    };
  }
}

class CreateExplainabilityExportResponse {
  /// The Amazon Resource Name (ARN) of the export.
  final String? explainabilityExportArn;

  CreateExplainabilityExportResponse({
    this.explainabilityExportArn,
  });

  factory CreateExplainabilityExportResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateExplainabilityExportResponse(
      explainabilityExportArn: json['ExplainabilityExportArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final explainabilityExportArn = this.explainabilityExportArn;
    return {
      if (explainabilityExportArn != null)
        'ExplainabilityExportArn': explainabilityExportArn,
    };
  }
}

class CreateExplainabilityResponse {
  /// The Amazon Resource Name (ARN) of the Explainability.
  final String? explainabilityArn;

  CreateExplainabilityResponse({
    this.explainabilityArn,
  });

  factory CreateExplainabilityResponse.fromJson(Map<String, dynamic> json) {
    return CreateExplainabilityResponse(
      explainabilityArn: json['ExplainabilityArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final explainabilityArn = this.explainabilityArn;
    return {
      if (explainabilityArn != null) 'ExplainabilityArn': explainabilityArn,
    };
  }
}

class CreateForecastExportJobResponse {
  /// The Amazon Resource Name (ARN) of the export job.
  final String? forecastExportJobArn;

  CreateForecastExportJobResponse({
    this.forecastExportJobArn,
  });

  factory CreateForecastExportJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateForecastExportJobResponse(
      forecastExportJobArn: json['ForecastExportJobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final forecastExportJobArn = this.forecastExportJobArn;
    return {
      if (forecastExportJobArn != null)
        'ForecastExportJobArn': forecastExportJobArn,
    };
  }
}

class CreateForecastResponse {
  /// The Amazon Resource Name (ARN) of the forecast.
  final String? forecastArn;

  CreateForecastResponse({
    this.forecastArn,
  });

  factory CreateForecastResponse.fromJson(Map<String, dynamic> json) {
    return CreateForecastResponse(
      forecastArn: json['ForecastArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final forecastArn = this.forecastArn;
    return {
      if (forecastArn != null) 'ForecastArn': forecastArn,
    };
  }
}

class CreateMonitorResponse {
  /// The Amazon Resource Name (ARN) of the monitor resource.
  final String? monitorArn;

  CreateMonitorResponse({
    this.monitorArn,
  });

  factory CreateMonitorResponse.fromJson(Map<String, dynamic> json) {
    return CreateMonitorResponse(
      monitorArn: json['MonitorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final monitorArn = this.monitorArn;
    return {
      if (monitorArn != null) 'MonitorArn': monitorArn,
    };
  }
}

class CreatePredictorBacktestExportJobResponse {
  /// The Amazon Resource Name (ARN) of the predictor backtest export job that you
  /// want to export.
  final String? predictorBacktestExportJobArn;

  CreatePredictorBacktestExportJobResponse({
    this.predictorBacktestExportJobArn,
  });

  factory CreatePredictorBacktestExportJobResponse.fromJson(
      Map<String, dynamic> json) {
    return CreatePredictorBacktestExportJobResponse(
      predictorBacktestExportJobArn:
          json['PredictorBacktestExportJobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final predictorBacktestExportJobArn = this.predictorBacktestExportJobArn;
    return {
      if (predictorBacktestExportJobArn != null)
        'PredictorBacktestExportJobArn': predictorBacktestExportJobArn,
    };
  }
}

class CreatePredictorResponse {
  /// The Amazon Resource Name (ARN) of the predictor.
  final String? predictorArn;

  CreatePredictorResponse({
    this.predictorArn,
  });

  factory CreatePredictorResponse.fromJson(Map<String, dynamic> json) {
    return CreatePredictorResponse(
      predictorArn: json['PredictorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final predictorArn = this.predictorArn;
    return {
      if (predictorArn != null) 'PredictorArn': predictorArn,
    };
  }
}

class CreateWhatIfAnalysisResponse {
  /// The Amazon Resource Name (ARN) of the what-if analysis.
  final String? whatIfAnalysisArn;

  CreateWhatIfAnalysisResponse({
    this.whatIfAnalysisArn,
  });

  factory CreateWhatIfAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return CreateWhatIfAnalysisResponse(
      whatIfAnalysisArn: json['WhatIfAnalysisArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final whatIfAnalysisArn = this.whatIfAnalysisArn;
    return {
      if (whatIfAnalysisArn != null) 'WhatIfAnalysisArn': whatIfAnalysisArn,
    };
  }
}

class CreateWhatIfForecastExportResponse {
  /// The Amazon Resource Name (ARN) of the what-if forecast.
  final String? whatIfForecastExportArn;

  CreateWhatIfForecastExportResponse({
    this.whatIfForecastExportArn,
  });

  factory CreateWhatIfForecastExportResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateWhatIfForecastExportResponse(
      whatIfForecastExportArn: json['WhatIfForecastExportArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final whatIfForecastExportArn = this.whatIfForecastExportArn;
    return {
      if (whatIfForecastExportArn != null)
        'WhatIfForecastExportArn': whatIfForecastExportArn,
    };
  }
}

class CreateWhatIfForecastResponse {
  /// The Amazon Resource Name (ARN) of the what-if forecast.
  final String? whatIfForecastArn;

  CreateWhatIfForecastResponse({
    this.whatIfForecastArn,
  });

  factory CreateWhatIfForecastResponse.fromJson(Map<String, dynamic> json) {
    return CreateWhatIfForecastResponse(
      whatIfForecastArn: json['WhatIfForecastArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final whatIfForecastArn = this.whatIfForecastArn;
    return {
      if (whatIfForecastArn != null) 'WhatIfForecastArn': whatIfForecastArn,
    };
  }
}

/// The data configuration for your dataset group and any additional datasets.
class DataConfig {
  /// The ARN of the dataset group used to train the predictor.
  final String datasetGroupArn;

  /// Additional built-in datasets like Holidays and the Weather Index.
  final List<AdditionalDataset>? additionalDatasets;

  /// Aggregation and filling options for attributes in your dataset group.
  final List<AttributeConfig>? attributeConfigs;

  DataConfig({
    required this.datasetGroupArn,
    this.additionalDatasets,
    this.attributeConfigs,
  });

  factory DataConfig.fromJson(Map<String, dynamic> json) {
    return DataConfig(
      datasetGroupArn: json['DatasetGroupArn'] as String,
      additionalDatasets: (json['AdditionalDatasets'] as List?)
          ?.whereNotNull()
          .map((e) => AdditionalDataset.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributeConfigs: (json['AttributeConfigs'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final datasetGroupArn = this.datasetGroupArn;
    final additionalDatasets = this.additionalDatasets;
    final attributeConfigs = this.attributeConfigs;
    return {
      'DatasetGroupArn': datasetGroupArn,
      if (additionalDatasets != null) 'AdditionalDatasets': additionalDatasets,
      if (attributeConfigs != null) 'AttributeConfigs': attributeConfigs,
    };
  }
}

/// The destination for an export job. Provide an S3 path, an Identity and
/// Access Management (IAM) role that allows Amazon Forecast to access the
/// location, and an Key Management Service (KMS) key (optional).
class DataDestination {
  /// The path to an Amazon Simple Storage Service (Amazon S3) bucket along with
  /// the credentials to access the bucket.
  final S3Config s3Config;

  DataDestination({
    required this.s3Config,
  });

  factory DataDestination.fromJson(Map<String, dynamic> json) {
    return DataDestination(
      s3Config: S3Config.fromJson(json['S3Config'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Config = this.s3Config;
    return {
      'S3Config': s3Config,
    };
  }
}

/// The source of your data, an Identity and Access Management (IAM) role that
/// allows Amazon Forecast to access the data and, optionally, an Key Management
/// Service (KMS) key.
class DataSource {
  /// The path to the data stored in an Amazon Simple Storage Service (Amazon S3)
  /// bucket along with the credentials to access the data.
  final S3Config s3Config;

  DataSource({
    required this.s3Config,
  });

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      s3Config: S3Config.fromJson(json['S3Config'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Config = this.s3Config;
    return {
      'S3Config': s3Config,
    };
  }
}

/// Provides a summary of the dataset group properties used in the <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/API_ListDatasetGroups.html">ListDatasetGroups</a>
/// operation. To get the complete set of properties, call the <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetGroup.html">DescribeDatasetGroup</a>
/// operation, and provide the <code>DatasetGroupArn</code>.
class DatasetGroupSummary {
  /// When the dataset group was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the dataset group.
  final String? datasetGroupArn;

  /// The name of the dataset group.
  final String? datasetGroupName;

  /// When the dataset group was created or last updated from a call to the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_UpdateDatasetGroup.html">UpdateDatasetGroup</a>
  /// operation. While the dataset group is being updated,
  /// <code>LastModificationTime</code> is the current time of the
  /// <code>ListDatasetGroups</code> call.
  final DateTime? lastModificationTime;

  DatasetGroupSummary({
    this.creationTime,
    this.datasetGroupArn,
    this.datasetGroupName,
    this.lastModificationTime,
  });

  factory DatasetGroupSummary.fromJson(Map<String, dynamic> json) {
    return DatasetGroupSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      datasetGroupArn: json['DatasetGroupArn'] as String?,
      datasetGroupName: json['DatasetGroupName'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final datasetGroupArn = this.datasetGroupArn;
    final datasetGroupName = this.datasetGroupName;
    final lastModificationTime = this.lastModificationTime;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (datasetGroupArn != null) 'DatasetGroupArn': datasetGroupArn,
      if (datasetGroupName != null) 'DatasetGroupName': datasetGroupName,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
    };
  }
}

/// Provides a summary of the dataset import job properties used in the <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/API_ListDatasetImportJobs.html">ListDatasetImportJobs</a>
/// operation. To get the complete set of properties, call the <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetImportJob.html">DescribeDatasetImportJob</a>
/// operation, and provide the <code>DatasetImportJobArn</code>.
class DatasetImportJobSummary {
  /// When the dataset import job was created.
  final DateTime? creationTime;

  /// The location of the training data to import and an Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the data.
  /// The training data must be stored in an Amazon S3 bucket.
  ///
  /// If encryption is used, <code>DataSource</code> includes an Key Management
  /// Service (KMS) key.
  final DataSource? dataSource;

  /// The Amazon Resource Name (ARN) of the dataset import job.
  final String? datasetImportJobArn;

  /// The name of the dataset import job.
  final String? datasetImportJobName;

  /// The import mode of the dataset import job, FULL or INCREMENTAL.
  final ImportMode? importMode;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

  /// The status of the dataset import job. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// </ul>
  final String? status;

  DatasetImportJobSummary({
    this.creationTime,
    this.dataSource,
    this.datasetImportJobArn,
    this.datasetImportJobName,
    this.importMode,
    this.lastModificationTime,
    this.message,
    this.status,
  });

  factory DatasetImportJobSummary.fromJson(Map<String, dynamic> json) {
    return DatasetImportJobSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      dataSource: json['DataSource'] != null
          ? DataSource.fromJson(json['DataSource'] as Map<String, dynamic>)
          : null,
      datasetImportJobArn: json['DatasetImportJobArn'] as String?,
      datasetImportJobName: json['DatasetImportJobName'] as String?,
      importMode: (json['ImportMode'] as String?)?.toImportMode(),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final dataSource = this.dataSource;
    final datasetImportJobArn = this.datasetImportJobArn;
    final datasetImportJobName = this.datasetImportJobName;
    final importMode = this.importMode;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dataSource != null) 'DataSource': dataSource,
      if (datasetImportJobArn != null)
        'DatasetImportJobArn': datasetImportJobArn,
      if (datasetImportJobName != null)
        'DatasetImportJobName': datasetImportJobName,
      if (importMode != null) 'ImportMode': importMode.toValue(),
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
    };
  }
}

/// Provides a summary of the dataset properties used in the <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/API_ListDatasets.html">ListDatasets</a>
/// operation. To get the complete set of properties, call the <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDataset.html">DescribeDataset</a>
/// operation, and provide the <code>DatasetArn</code>.
class DatasetSummary {
  /// When the dataset was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the dataset.
  final String? datasetArn;

  /// The name of the dataset.
  final String? datasetName;

  /// The dataset type.
  final DatasetType? datasetType;

  /// The domain associated with the dataset.
  final Domain? domain;

  /// When you create a dataset, <code>LastModificationTime</code> is the same as
  /// <code>CreationTime</code>. While data is being imported to the dataset,
  /// <code>LastModificationTime</code> is the current time of the
  /// <code>ListDatasets</code> call. After a <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html">CreateDatasetImportJob</a>
  /// operation has finished, <code>LastModificationTime</code> is when the import
  /// job completed or failed.
  final DateTime? lastModificationTime;

  DatasetSummary({
    this.creationTime,
    this.datasetArn,
    this.datasetName,
    this.datasetType,
    this.domain,
    this.lastModificationTime,
  });

  factory DatasetSummary.fromJson(Map<String, dynamic> json) {
    return DatasetSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      datasetArn: json['DatasetArn'] as String?,
      datasetName: json['DatasetName'] as String?,
      datasetType: (json['DatasetType'] as String?)?.toDatasetType(),
      domain: (json['Domain'] as String?)?.toDomain(),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final datasetArn = this.datasetArn;
    final datasetName = this.datasetName;
    final datasetType = this.datasetType;
    final domain = this.domain;
    final lastModificationTime = this.lastModificationTime;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetName != null) 'DatasetName': datasetName,
      if (datasetType != null) 'DatasetType': datasetType.toValue(),
      if (domain != null) 'Domain': domain.toValue(),
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
    };
  }
}

enum DatasetType {
  targetTimeSeries,
  relatedTimeSeries,
  itemMetadata,
}

extension DatasetTypeValueExtension on DatasetType {
  String toValue() {
    switch (this) {
      case DatasetType.targetTimeSeries:
        return 'TARGET_TIME_SERIES';
      case DatasetType.relatedTimeSeries:
        return 'RELATED_TIME_SERIES';
      case DatasetType.itemMetadata:
        return 'ITEM_METADATA';
    }
  }
}

extension DatasetTypeFromString on String {
  DatasetType toDatasetType() {
    switch (this) {
      case 'TARGET_TIME_SERIES':
        return DatasetType.targetTimeSeries;
      case 'RELATED_TIME_SERIES':
        return DatasetType.relatedTimeSeries;
      case 'ITEM_METADATA':
        return DatasetType.itemMetadata;
    }
    throw Exception('$this is not known in enum DatasetType');
  }
}

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension DayOfWeekValueExtension on DayOfWeek {
  String toValue() {
    switch (this) {
      case DayOfWeek.monday:
        return 'MONDAY';
      case DayOfWeek.tuesday:
        return 'TUESDAY';
      case DayOfWeek.wednesday:
        return 'WEDNESDAY';
      case DayOfWeek.thursday:
        return 'THURSDAY';
      case DayOfWeek.friday:
        return 'FRIDAY';
      case DayOfWeek.saturday:
        return 'SATURDAY';
      case DayOfWeek.sunday:
        return 'SUNDAY';
    }
  }
}

extension DayOfWeekFromString on String {
  DayOfWeek toDayOfWeek() {
    switch (this) {
      case 'MONDAY':
        return DayOfWeek.monday;
      case 'TUESDAY':
        return DayOfWeek.tuesday;
      case 'WEDNESDAY':
        return DayOfWeek.wednesday;
      case 'THURSDAY':
        return DayOfWeek.thursday;
      case 'FRIDAY':
        return DayOfWeek.friday;
      case 'SATURDAY':
        return DayOfWeek.saturday;
      case 'SUNDAY':
        return DayOfWeek.sunday;
    }
    throw Exception('$this is not known in enum DayOfWeek');
  }
}

class DescribeAutoPredictorResponse {
  /// The timestamp of the CreateAutoPredictor request.
  final DateTime? creationTime;

  /// The data configuration for your dataset group and any additional datasets.
  final DataConfig? dataConfig;

  /// An array of the ARNs of the dataset import jobs used to import training data
  /// for the predictor.
  final List<String>? datasetImportJobArns;
  final EncryptionConfig? encryptionConfig;

  /// The estimated time remaining in minutes for the predictor training job to
  /// complete.
  final int? estimatedTimeRemainingInMinutes;

  /// Provides the status and ARN of the Predictor Explainability.
  final ExplainabilityInfo? explainabilityInfo;

  /// An array of dimension (field) names that specify the attributes used to
  /// group your time series.
  final List<String>? forecastDimensions;

  /// The frequency of predictions in a forecast.
  ///
  /// Valid intervals are Y (Year), M (Month), W (Week), D (Day), H (Hour), 30min
  /// (30 minutes), 15min (15 minutes), 10min (10 minutes), 5min (5 minutes), and
  /// 1min (1 minute). For example, "Y" indicates every year and "5min" indicates
  /// every five minutes.
  final String? forecastFrequency;

  /// The number of time-steps that the model predicts. The forecast horizon is
  /// also called the prediction length.
  final int? forecastHorizon;

  /// The forecast types used during predictor training. Default value is
  /// ["0.1","0.5","0.9"].
  final List<String>? forecastTypes;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// In the event of an error, a message detailing the cause of the error.
  final String? message;

  /// A object with the Amazon Resource Name (ARN) and status of the monitor
  /// resource.
  final MonitorInfo? monitorInfo;

  /// The accuracy metric used to optimize the predictor.
  final OptimizationMetric? optimizationMetric;

  /// The Amazon Resource Name (ARN) of the predictor
  final String? predictorArn;

  /// The name of the predictor.
  final String? predictorName;

  /// The ARN and state of the reference predictor. This parameter is only valid
  /// for retrained or upgraded predictors.
  final ReferencePredictorSummary? referencePredictorSummary;

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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul>
  final String? status;

  /// The time boundary Forecast uses when aggregating data.
  final TimeAlignmentBoundary? timeAlignmentBoundary;

  DescribeAutoPredictorResponse({
    this.creationTime,
    this.dataConfig,
    this.datasetImportJobArns,
    this.encryptionConfig,
    this.estimatedTimeRemainingInMinutes,
    this.explainabilityInfo,
    this.forecastDimensions,
    this.forecastFrequency,
    this.forecastHorizon,
    this.forecastTypes,
    this.lastModificationTime,
    this.message,
    this.monitorInfo,
    this.optimizationMetric,
    this.predictorArn,
    this.predictorName,
    this.referencePredictorSummary,
    this.status,
    this.timeAlignmentBoundary,
  });

  factory DescribeAutoPredictorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAutoPredictorResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      dataConfig: json['DataConfig'] != null
          ? DataConfig.fromJson(json['DataConfig'] as Map<String, dynamic>)
          : null,
      datasetImportJobArns: (json['DatasetImportJobArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      encryptionConfig: json['EncryptionConfig'] != null
          ? EncryptionConfig.fromJson(
              json['EncryptionConfig'] as Map<String, dynamic>)
          : null,
      estimatedTimeRemainingInMinutes:
          json['EstimatedTimeRemainingInMinutes'] as int?,
      explainabilityInfo: json['ExplainabilityInfo'] != null
          ? ExplainabilityInfo.fromJson(
              json['ExplainabilityInfo'] as Map<String, dynamic>)
          : null,
      forecastDimensions: (json['ForecastDimensions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      forecastFrequency: json['ForecastFrequency'] as String?,
      forecastHorizon: json['ForecastHorizon'] as int?,
      forecastTypes: (json['ForecastTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      monitorInfo: json['MonitorInfo'] != null
          ? MonitorInfo.fromJson(json['MonitorInfo'] as Map<String, dynamic>)
          : null,
      optimizationMetric:
          (json['OptimizationMetric'] as String?)?.toOptimizationMetric(),
      predictorArn: json['PredictorArn'] as String?,
      predictorName: json['PredictorName'] as String?,
      referencePredictorSummary: json['ReferencePredictorSummary'] != null
          ? ReferencePredictorSummary.fromJson(
              json['ReferencePredictorSummary'] as Map<String, dynamic>)
          : null,
      status: json['Status'] as String?,
      timeAlignmentBoundary: json['TimeAlignmentBoundary'] != null
          ? TimeAlignmentBoundary.fromJson(
              json['TimeAlignmentBoundary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final dataConfig = this.dataConfig;
    final datasetImportJobArns = this.datasetImportJobArns;
    final encryptionConfig = this.encryptionConfig;
    final estimatedTimeRemainingInMinutes =
        this.estimatedTimeRemainingInMinutes;
    final explainabilityInfo = this.explainabilityInfo;
    final forecastDimensions = this.forecastDimensions;
    final forecastFrequency = this.forecastFrequency;
    final forecastHorizon = this.forecastHorizon;
    final forecastTypes = this.forecastTypes;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final monitorInfo = this.monitorInfo;
    final optimizationMetric = this.optimizationMetric;
    final predictorArn = this.predictorArn;
    final predictorName = this.predictorName;
    final referencePredictorSummary = this.referencePredictorSummary;
    final status = this.status;
    final timeAlignmentBoundary = this.timeAlignmentBoundary;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dataConfig != null) 'DataConfig': dataConfig,
      if (datasetImportJobArns != null)
        'DatasetImportJobArns': datasetImportJobArns,
      if (encryptionConfig != null) 'EncryptionConfig': encryptionConfig,
      if (estimatedTimeRemainingInMinutes != null)
        'EstimatedTimeRemainingInMinutes': estimatedTimeRemainingInMinutes,
      if (explainabilityInfo != null) 'ExplainabilityInfo': explainabilityInfo,
      if (forecastDimensions != null) 'ForecastDimensions': forecastDimensions,
      if (forecastFrequency != null) 'ForecastFrequency': forecastFrequency,
      if (forecastHorizon != null) 'ForecastHorizon': forecastHorizon,
      if (forecastTypes != null) 'ForecastTypes': forecastTypes,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (monitorInfo != null) 'MonitorInfo': monitorInfo,
      if (optimizationMetric != null)
        'OptimizationMetric': optimizationMetric.toValue(),
      if (predictorArn != null) 'PredictorArn': predictorArn,
      if (predictorName != null) 'PredictorName': predictorName,
      if (referencePredictorSummary != null)
        'ReferencePredictorSummary': referencePredictorSummary,
      if (status != null) 'Status': status,
      if (timeAlignmentBoundary != null)
        'TimeAlignmentBoundary': timeAlignmentBoundary,
    };
  }
}

class DescribeDatasetGroupResponse {
  /// When the dataset group was created.
  final DateTime? creationTime;

  /// An array of Amazon Resource Names (ARNs) of the datasets contained in the
  /// dataset group.
  final List<String>? datasetArns;

  /// The ARN of the dataset group.
  final String? datasetGroupArn;

  /// The name of the dataset group.
  final String? datasetGroupName;

  /// The domain associated with the dataset group.
  final Domain? domain;

  /// When the dataset group was created or last updated from a call to the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_UpdateDatasetGroup.html">UpdateDatasetGroup</a>
  /// operation. While the dataset group is being updated,
  /// <code>LastModificationTime</code> is the current time of the
  /// <code>DescribeDatasetGroup</code> call.
  final DateTime? lastModificationTime;

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
  /// The <code>UPDATE</code> states apply when you call the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_UpdateDatasetGroup.html">UpdateDatasetGroup</a>
  /// operation.
  /// <note>
  /// The <code>Status</code> of the dataset group must be <code>ACTIVE</code>
  /// before you can use the dataset group to create a predictor.
  /// </note>
  final String? status;

  DescribeDatasetGroupResponse({
    this.creationTime,
    this.datasetArns,
    this.datasetGroupArn,
    this.datasetGroupName,
    this.domain,
    this.lastModificationTime,
    this.status,
  });

  factory DescribeDatasetGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetGroupResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      datasetArns: (json['DatasetArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      datasetGroupArn: json['DatasetGroupArn'] as String?,
      datasetGroupName: json['DatasetGroupName'] as String?,
      domain: (json['Domain'] as String?)?.toDomain(),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final datasetArns = this.datasetArns;
    final datasetGroupArn = this.datasetGroupArn;
    final datasetGroupName = this.datasetGroupName;
    final domain = this.domain;
    final lastModificationTime = this.lastModificationTime;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (datasetArns != null) 'DatasetArns': datasetArns,
      if (datasetGroupArn != null) 'DatasetGroupArn': datasetGroupArn,
      if (datasetGroupName != null) 'DatasetGroupName': datasetGroupName,
      if (domain != null) 'Domain': domain.toValue(),
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (status != null) 'Status': status,
    };
  }
}

class DescribeDatasetImportJobResponse {
  /// When the dataset import job was created.
  final DateTime? creationTime;

  /// The size of the dataset in gigabytes (GB) after the import job has finished.
  final double? dataSize;

  /// The location of the training data to import and an Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the data.
  ///
  /// If encryption is used, <code>DataSource</code> includes an Key Management
  /// Service (KMS) key.
  final DataSource? dataSource;

  /// The Amazon Resource Name (ARN) of the dataset that the training data was
  /// imported to.
  final String? datasetArn;

  /// The ARN of the dataset import job.
  final String? datasetImportJobArn;

  /// The name of the dataset import job.
  final String? datasetImportJobName;

  /// The estimated time remaining in minutes for the dataset import job to
  /// complete.
  final int? estimatedTimeRemainingInMinutes;

  /// Statistical information about each field in the input data.
  final Map<String, Statistics>? fieldStatistics;

  /// The format of the imported data, CSV or PARQUET.
  final String? format;

  /// The format of the geolocation attribute. Valid
  /// Values:<code>"LAT_LONG"</code> and <code>"CC_POSTALCODE"</code>.
  final String? geolocationFormat;

  /// The import mode of the dataset import job, FULL or INCREMENTAL.
  final ImportMode? importMode;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

  /// The status of the dataset import job. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// </ul>
  final String? status;

  /// The single time zone applied to every item in the dataset
  final String? timeZone;

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
  final String? timestampFormat;

  /// Whether <code>TimeZone</code> is automatically derived from the geolocation
  /// attribute.
  final bool? useGeolocationForTimeZone;

  DescribeDatasetImportJobResponse({
    this.creationTime,
    this.dataSize,
    this.dataSource,
    this.datasetArn,
    this.datasetImportJobArn,
    this.datasetImportJobName,
    this.estimatedTimeRemainingInMinutes,
    this.fieldStatistics,
    this.format,
    this.geolocationFormat,
    this.importMode,
    this.lastModificationTime,
    this.message,
    this.status,
    this.timeZone,
    this.timestampFormat,
    this.useGeolocationForTimeZone,
  });

  factory DescribeDatasetImportJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetImportJobResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      dataSize: json['DataSize'] as double?,
      dataSource: json['DataSource'] != null
          ? DataSource.fromJson(json['DataSource'] as Map<String, dynamic>)
          : null,
      datasetArn: json['DatasetArn'] as String?,
      datasetImportJobArn: json['DatasetImportJobArn'] as String?,
      datasetImportJobName: json['DatasetImportJobName'] as String?,
      estimatedTimeRemainingInMinutes:
          json['EstimatedTimeRemainingInMinutes'] as int?,
      fieldStatistics: (json['FieldStatistics'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, Statistics.fromJson(e as Map<String, dynamic>))),
      format: json['Format'] as String?,
      geolocationFormat: json['GeolocationFormat'] as String?,
      importMode: (json['ImportMode'] as String?)?.toImportMode(),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
      timeZone: json['TimeZone'] as String?,
      timestampFormat: json['TimestampFormat'] as String?,
      useGeolocationForTimeZone: json['UseGeolocationForTimeZone'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final dataSize = this.dataSize;
    final dataSource = this.dataSource;
    final datasetArn = this.datasetArn;
    final datasetImportJobArn = this.datasetImportJobArn;
    final datasetImportJobName = this.datasetImportJobName;
    final estimatedTimeRemainingInMinutes =
        this.estimatedTimeRemainingInMinutes;
    final fieldStatistics = this.fieldStatistics;
    final format = this.format;
    final geolocationFormat = this.geolocationFormat;
    final importMode = this.importMode;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final status = this.status;
    final timeZone = this.timeZone;
    final timestampFormat = this.timestampFormat;
    final useGeolocationForTimeZone = this.useGeolocationForTimeZone;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dataSize != null) 'DataSize': dataSize,
      if (dataSource != null) 'DataSource': dataSource,
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetImportJobArn != null)
        'DatasetImportJobArn': datasetImportJobArn,
      if (datasetImportJobName != null)
        'DatasetImportJobName': datasetImportJobName,
      if (estimatedTimeRemainingInMinutes != null)
        'EstimatedTimeRemainingInMinutes': estimatedTimeRemainingInMinutes,
      if (fieldStatistics != null) 'FieldStatistics': fieldStatistics,
      if (format != null) 'Format': format,
      if (geolocationFormat != null) 'GeolocationFormat': geolocationFormat,
      if (importMode != null) 'ImportMode': importMode.toValue(),
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
      if (timeZone != null) 'TimeZone': timeZone,
      if (timestampFormat != null) 'TimestampFormat': timestampFormat,
      if (useGeolocationForTimeZone != null)
        'UseGeolocationForTimeZone': useGeolocationForTimeZone,
    };
  }
}

class DescribeDatasetResponse {
  /// When the dataset was created.
  final DateTime? creationTime;

  /// The frequency of data collection.
  ///
  /// Valid intervals are Y (Year), M (Month), W (Week), D (Day), H (Hour), 30min
  /// (30 minutes), 15min (15 minutes), 10min (10 minutes), 5min (5 minutes), and
  /// 1min (1 minute). For example, "M" indicates every month and "30min"
  /// indicates every 30 minutes.
  final String? dataFrequency;

  /// The Amazon Resource Name (ARN) of the dataset.
  final String? datasetArn;

  /// The name of the dataset.
  final String? datasetName;

  /// The dataset type.
  final DatasetType? datasetType;

  /// The domain associated with the dataset.
  final Domain? domain;

  /// The Key Management Service (KMS) key and the Identity and Access Management
  /// (IAM) role that Amazon Forecast can assume to access the key.
  final EncryptionConfig? encryptionConfig;

  /// When you create a dataset, <code>LastModificationTime</code> is the same as
  /// <code>CreationTime</code>. While data is being imported to the dataset,
  /// <code>LastModificationTime</code> is the current time of the
  /// <code>DescribeDataset</code> call. After a <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html">CreateDatasetImportJob</a>
  /// operation has finished, <code>LastModificationTime</code> is when the import
  /// job completed or failed.
  final DateTime? lastModificationTime;

  /// An array of <code>SchemaAttribute</code> objects that specify the dataset
  /// fields. Each <code>SchemaAttribute</code> specifies the name and data type
  /// of a field.
  final Schema? schema;

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
  /// from a call to the <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html">CreateDatasetImportJob</a>
  /// operation and reflect the status of the dataset import job. For example,
  /// when the import job status is <code>CREATE_IN_PROGRESS</code>, the status of
  /// the dataset is <code>UPDATE_IN_PROGRESS</code>.
  /// <note>
  /// The <code>Status</code> of the dataset must be <code>ACTIVE</code> before
  /// you can import training data.
  /// </note>
  final String? status;

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

  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      dataFrequency: json['DataFrequency'] as String?,
      datasetArn: json['DatasetArn'] as String?,
      datasetName: json['DatasetName'] as String?,
      datasetType: (json['DatasetType'] as String?)?.toDatasetType(),
      domain: (json['Domain'] as String?)?.toDomain(),
      encryptionConfig: json['EncryptionConfig'] != null
          ? EncryptionConfig.fromJson(
              json['EncryptionConfig'] as Map<String, dynamic>)
          : null,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      schema: json['Schema'] != null
          ? Schema.fromJson(json['Schema'] as Map<String, dynamic>)
          : null,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final dataFrequency = this.dataFrequency;
    final datasetArn = this.datasetArn;
    final datasetName = this.datasetName;
    final datasetType = this.datasetType;
    final domain = this.domain;
    final encryptionConfig = this.encryptionConfig;
    final lastModificationTime = this.lastModificationTime;
    final schema = this.schema;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dataFrequency != null) 'DataFrequency': dataFrequency,
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetName != null) 'DatasetName': datasetName,
      if (datasetType != null) 'DatasetType': datasetType.toValue(),
      if (domain != null) 'Domain': domain.toValue(),
      if (encryptionConfig != null) 'EncryptionConfig': encryptionConfig,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (schema != null) 'Schema': schema,
      if (status != null) 'Status': status,
    };
  }
}

class DescribeExplainabilityExportResponse {
  /// When the Explainability export was created.
  final DateTime? creationTime;
  final DataDestination? destination;

  /// The Amazon Resource Name (ARN) of the Explainability export.
  final String? explainabilityArn;

  /// The Amazon Resource Name (ARN) of the Explainability export.
  final String? explainabilityExportArn;

  /// The name of the Explainability export.
  final String? explainabilityExportName;

  /// The format of the exported data, CSV or PARQUET.
  final String? format;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// Information about any errors that occurred during the export.
  final String? message;

  /// The status of the Explainability export. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul>
  final String? status;

  DescribeExplainabilityExportResponse({
    this.creationTime,
    this.destination,
    this.explainabilityArn,
    this.explainabilityExportArn,
    this.explainabilityExportName,
    this.format,
    this.lastModificationTime,
    this.message,
    this.status,
  });

  factory DescribeExplainabilityExportResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeExplainabilityExportResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      destination: json['Destination'] != null
          ? DataDestination.fromJson(
              json['Destination'] as Map<String, dynamic>)
          : null,
      explainabilityArn: json['ExplainabilityArn'] as String?,
      explainabilityExportArn: json['ExplainabilityExportArn'] as String?,
      explainabilityExportName: json['ExplainabilityExportName'] as String?,
      format: json['Format'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destination = this.destination;
    final explainabilityArn = this.explainabilityArn;
    final explainabilityExportArn = this.explainabilityExportArn;
    final explainabilityExportName = this.explainabilityExportName;
    final format = this.format;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (destination != null) 'Destination': destination,
      if (explainabilityArn != null) 'ExplainabilityArn': explainabilityArn,
      if (explainabilityExportArn != null)
        'ExplainabilityExportArn': explainabilityExportArn,
      if (explainabilityExportName != null)
        'ExplainabilityExportName': explainabilityExportName,
      if (format != null) 'Format': format,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
    };
  }
}

class DescribeExplainabilityResponse {
  /// When the Explainability resource was created.
  final DateTime? creationTime;
  final DataSource? dataSource;

  /// Whether the visualization was enabled for the Explainability resource.
  final bool? enableVisualization;

  /// If <code>TimePointGranularity</code> is set to <code>SPECIFIC</code>, the
  /// last time point in the Explainability.
  final String? endDateTime;

  /// The estimated time remaining in minutes for the <a>CreateExplainability</a>
  /// job to complete.
  final int? estimatedTimeRemainingInMinutes;

  /// The Amazon Resource Name (ARN) of the Explainability.
  final String? explainabilityArn;

  /// The configuration settings that define the granularity of time series and
  /// time points for the Explainability.
  final ExplainabilityConfig? explainabilityConfig;

  /// The name of the Explainability.
  final String? explainabilityName;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, a message about the error.
  final String? message;

  /// The Amazon Resource Name (ARN) of the Predictor or Forecast used to create
  /// the Explainability resource.
  final String? resourceArn;
  final Schema? schema;

  /// If <code>TimePointGranularity</code> is set to <code>SPECIFIC</code>, the
  /// first time point in the Explainability.
  final String? startDateTime;

  /// The status of the Explainability resource. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul>
  final String? status;

  DescribeExplainabilityResponse({
    this.creationTime,
    this.dataSource,
    this.enableVisualization,
    this.endDateTime,
    this.estimatedTimeRemainingInMinutes,
    this.explainabilityArn,
    this.explainabilityConfig,
    this.explainabilityName,
    this.lastModificationTime,
    this.message,
    this.resourceArn,
    this.schema,
    this.startDateTime,
    this.status,
  });

  factory DescribeExplainabilityResponse.fromJson(Map<String, dynamic> json) {
    return DescribeExplainabilityResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      dataSource: json['DataSource'] != null
          ? DataSource.fromJson(json['DataSource'] as Map<String, dynamic>)
          : null,
      enableVisualization: json['EnableVisualization'] as bool?,
      endDateTime: json['EndDateTime'] as String?,
      estimatedTimeRemainingInMinutes:
          json['EstimatedTimeRemainingInMinutes'] as int?,
      explainabilityArn: json['ExplainabilityArn'] as String?,
      explainabilityConfig: json['ExplainabilityConfig'] != null
          ? ExplainabilityConfig.fromJson(
              json['ExplainabilityConfig'] as Map<String, dynamic>)
          : null,
      explainabilityName: json['ExplainabilityName'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      schema: json['Schema'] != null
          ? Schema.fromJson(json['Schema'] as Map<String, dynamic>)
          : null,
      startDateTime: json['StartDateTime'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final dataSource = this.dataSource;
    final enableVisualization = this.enableVisualization;
    final endDateTime = this.endDateTime;
    final estimatedTimeRemainingInMinutes =
        this.estimatedTimeRemainingInMinutes;
    final explainabilityArn = this.explainabilityArn;
    final explainabilityConfig = this.explainabilityConfig;
    final explainabilityName = this.explainabilityName;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final resourceArn = this.resourceArn;
    final schema = this.schema;
    final startDateTime = this.startDateTime;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dataSource != null) 'DataSource': dataSource,
      if (enableVisualization != null)
        'EnableVisualization': enableVisualization,
      if (endDateTime != null) 'EndDateTime': endDateTime,
      if (estimatedTimeRemainingInMinutes != null)
        'EstimatedTimeRemainingInMinutes': estimatedTimeRemainingInMinutes,
      if (explainabilityArn != null) 'ExplainabilityArn': explainabilityArn,
      if (explainabilityConfig != null)
        'ExplainabilityConfig': explainabilityConfig,
      if (explainabilityName != null) 'ExplainabilityName': explainabilityName,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (schema != null) 'Schema': schema,
      if (startDateTime != null) 'StartDateTime': startDateTime,
      if (status != null) 'Status': status,
    };
  }
}

class DescribeForecastExportJobResponse {
  /// When the forecast export job was created.
  final DateTime? creationTime;

  /// The path to the Amazon Simple Storage Service (Amazon S3) bucket where the
  /// forecast is exported.
  final DataDestination? destination;

  /// The Amazon Resource Name (ARN) of the exported forecast.
  final String? forecastArn;

  /// The ARN of the forecast export job.
  final String? forecastExportJobArn;

  /// The name of the forecast export job.
  final String? forecastExportJobName;

  /// The format of the exported data, CSV or PARQUET.
  final String? format;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the forecast export job must be
  /// <code>ACTIVE</code> before you can access the forecast in your S3 bucket.
  /// </note>
  final String? status;

  DescribeForecastExportJobResponse({
    this.creationTime,
    this.destination,
    this.forecastArn,
    this.forecastExportJobArn,
    this.forecastExportJobName,
    this.format,
    this.lastModificationTime,
    this.message,
    this.status,
  });

  factory DescribeForecastExportJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeForecastExportJobResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      destination: json['Destination'] != null
          ? DataDestination.fromJson(
              json['Destination'] as Map<String, dynamic>)
          : null,
      forecastArn: json['ForecastArn'] as String?,
      forecastExportJobArn: json['ForecastExportJobArn'] as String?,
      forecastExportJobName: json['ForecastExportJobName'] as String?,
      format: json['Format'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destination = this.destination;
    final forecastArn = this.forecastArn;
    final forecastExportJobArn = this.forecastExportJobArn;
    final forecastExportJobName = this.forecastExportJobName;
    final format = this.format;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (destination != null) 'Destination': destination,
      if (forecastArn != null) 'ForecastArn': forecastArn,
      if (forecastExportJobArn != null)
        'ForecastExportJobArn': forecastExportJobArn,
      if (forecastExportJobName != null)
        'ForecastExportJobName': forecastExportJobName,
      if (format != null) 'Format': format,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
    };
  }
}

class DescribeForecastResponse {
  /// When the forecast creation task was created.
  final DateTime? creationTime;

  /// The ARN of the dataset group that provided the data used to train the
  /// predictor.
  final String? datasetGroupArn;

  /// The estimated time remaining in minutes for the forecast job to complete.
  final int? estimatedTimeRemainingInMinutes;

  /// The forecast ARN as specified in the request.
  final String? forecastArn;

  /// The name of the forecast.
  final String? forecastName;

  /// The quantiles at which probabilistic forecasts were generated.
  final List<String>? forecastTypes;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

  /// The ARN of the predictor used to generate the forecast.
  final String? predictorArn;

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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the forecast must be <code>ACTIVE</code> before
  /// you can query or export the forecast.
  /// </note>
  final String? status;

  /// The time series to include in the forecast.
  final TimeSeriesSelector? timeSeriesSelector;

  DescribeForecastResponse({
    this.creationTime,
    this.datasetGroupArn,
    this.estimatedTimeRemainingInMinutes,
    this.forecastArn,
    this.forecastName,
    this.forecastTypes,
    this.lastModificationTime,
    this.message,
    this.predictorArn,
    this.status,
    this.timeSeriesSelector,
  });

  factory DescribeForecastResponse.fromJson(Map<String, dynamic> json) {
    return DescribeForecastResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      datasetGroupArn: json['DatasetGroupArn'] as String?,
      estimatedTimeRemainingInMinutes:
          json['EstimatedTimeRemainingInMinutes'] as int?,
      forecastArn: json['ForecastArn'] as String?,
      forecastName: json['ForecastName'] as String?,
      forecastTypes: (json['ForecastTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      predictorArn: json['PredictorArn'] as String?,
      status: json['Status'] as String?,
      timeSeriesSelector: json['TimeSeriesSelector'] != null
          ? TimeSeriesSelector.fromJson(
              json['TimeSeriesSelector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final datasetGroupArn = this.datasetGroupArn;
    final estimatedTimeRemainingInMinutes =
        this.estimatedTimeRemainingInMinutes;
    final forecastArn = this.forecastArn;
    final forecastName = this.forecastName;
    final forecastTypes = this.forecastTypes;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final predictorArn = this.predictorArn;
    final status = this.status;
    final timeSeriesSelector = this.timeSeriesSelector;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (datasetGroupArn != null) 'DatasetGroupArn': datasetGroupArn,
      if (estimatedTimeRemainingInMinutes != null)
        'EstimatedTimeRemainingInMinutes': estimatedTimeRemainingInMinutes,
      if (forecastArn != null) 'ForecastArn': forecastArn,
      if (forecastName != null) 'ForecastName': forecastName,
      if (forecastTypes != null) 'ForecastTypes': forecastTypes,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (predictorArn != null) 'PredictorArn': predictorArn,
      if (status != null) 'Status': status,
      if (timeSeriesSelector != null) 'TimeSeriesSelector': timeSeriesSelector,
    };
  }
}

class DescribeMonitorResponse {
  /// Metrics you can use as a baseline for comparison purposes. Use these values
  /// you interpret monitoring results for an auto predictor.
  final Baseline? baseline;

  /// The timestamp for when the monitor resource was created.
  final DateTime? creationTime;

  /// The estimated number of minutes remaining before the monitor resource
  /// finishes its current evaluation.
  final int? estimatedEvaluationTimeRemainingInMinutes;

  /// The state of the monitor's latest evaluation.
  final String? lastEvaluationState;

  /// The timestamp of the latest evaluation completed by the monitor.
  final DateTime? lastEvaluationTime;

  /// The timestamp of the latest modification to the monitor.
  final DateTime? lastModificationTime;

  /// An error message, if any, for the monitor.
  final String? message;

  /// The Amazon Resource Name (ARN) of the monitor resource described.
  final String? monitorArn;

  /// The name of the monitor.
  final String? monitorName;

  /// The Amazon Resource Name (ARN) of the auto predictor being monitored.
  final String? resourceArn;

  /// The status of the monitor resource.
  final String? status;

  DescribeMonitorResponse({
    this.baseline,
    this.creationTime,
    this.estimatedEvaluationTimeRemainingInMinutes,
    this.lastEvaluationState,
    this.lastEvaluationTime,
    this.lastModificationTime,
    this.message,
    this.monitorArn,
    this.monitorName,
    this.resourceArn,
    this.status,
  });

  factory DescribeMonitorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeMonitorResponse(
      baseline: json['Baseline'] != null
          ? Baseline.fromJson(json['Baseline'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      estimatedEvaluationTimeRemainingInMinutes:
          json['EstimatedEvaluationTimeRemainingInMinutes'] as int?,
      lastEvaluationState: json['LastEvaluationState'] as String?,
      lastEvaluationTime: timeStampFromJson(json['LastEvaluationTime']),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      monitorArn: json['MonitorArn'] as String?,
      monitorName: json['MonitorName'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseline = this.baseline;
    final creationTime = this.creationTime;
    final estimatedEvaluationTimeRemainingInMinutes =
        this.estimatedEvaluationTimeRemainingInMinutes;
    final lastEvaluationState = this.lastEvaluationState;
    final lastEvaluationTime = this.lastEvaluationTime;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final monitorArn = this.monitorArn;
    final monitorName = this.monitorName;
    final resourceArn = this.resourceArn;
    final status = this.status;
    return {
      if (baseline != null) 'Baseline': baseline,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (estimatedEvaluationTimeRemainingInMinutes != null)
        'EstimatedEvaluationTimeRemainingInMinutes':
            estimatedEvaluationTimeRemainingInMinutes,
      if (lastEvaluationState != null)
        'LastEvaluationState': lastEvaluationState,
      if (lastEvaluationTime != null)
        'LastEvaluationTime': unixTimestampToJson(lastEvaluationTime),
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (monitorArn != null) 'MonitorArn': monitorArn,
      if (monitorName != null) 'MonitorName': monitorName,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (status != null) 'Status': status,
    };
  }
}

class DescribePredictorBacktestExportJobResponse {
  /// When the predictor backtest export job was created.
  final DateTime? creationTime;
  final DataDestination? destination;

  /// The format of the exported data, CSV or PARQUET.
  final String? format;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// Information about any errors that may have occurred during the backtest
  /// export.
  final String? message;

  /// The Amazon Resource Name (ARN) of the predictor.
  final String? predictorArn;

  /// The Amazon Resource Name (ARN) of the predictor backtest export job.
  final String? predictorBacktestExportJobArn;

  /// The name of the predictor backtest export job.
  final String? predictorBacktestExportJobName;

  /// The status of the predictor backtest export job. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul>
  final String? status;

  DescribePredictorBacktestExportJobResponse({
    this.creationTime,
    this.destination,
    this.format,
    this.lastModificationTime,
    this.message,
    this.predictorArn,
    this.predictorBacktestExportJobArn,
    this.predictorBacktestExportJobName,
    this.status,
  });

  factory DescribePredictorBacktestExportJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribePredictorBacktestExportJobResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      destination: json['Destination'] != null
          ? DataDestination.fromJson(
              json['Destination'] as Map<String, dynamic>)
          : null,
      format: json['Format'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      predictorArn: json['PredictorArn'] as String?,
      predictorBacktestExportJobArn:
          json['PredictorBacktestExportJobArn'] as String?,
      predictorBacktestExportJobName:
          json['PredictorBacktestExportJobName'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destination = this.destination;
    final format = this.format;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final predictorArn = this.predictorArn;
    final predictorBacktestExportJobArn = this.predictorBacktestExportJobArn;
    final predictorBacktestExportJobName = this.predictorBacktestExportJobName;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (destination != null) 'Destination': destination,
      if (format != null) 'Format': format,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (predictorArn != null) 'PredictorArn': predictorArn,
      if (predictorBacktestExportJobArn != null)
        'PredictorBacktestExportJobArn': predictorBacktestExportJobArn,
      if (predictorBacktestExportJobName != null)
        'PredictorBacktestExportJobName': predictorBacktestExportJobName,
      if (status != null) 'Status': status,
    };
  }
}

class DescribePredictorResponse {
  /// The Amazon Resource Name (ARN) of the algorithm used for model training.
  final String? algorithmArn;

  /// When <code>PerformAutoML</code> is specified, the ARN of the chosen
  /// algorithm.
  final List<String>? autoMLAlgorithmArns;

  /// <note>
  /// The <code>LatencyOptimized</code> AutoML override strategy is only available
  /// in private beta. Contact Amazon Web Services Support or your account manager
  /// to learn more about access privileges.
  /// </note>
  /// The AutoML strategy used to train the predictor. Unless
  /// <code>LatencyOptimized</code> is specified, the AutoML strategy optimizes
  /// predictor accuracy.
  ///
  /// This parameter is only valid for predictors trained using AutoML.
  final AutoMLOverrideStrategy? autoMLOverrideStrategy;

  /// When the model training task was created.
  final DateTime? creationTime;

  /// An array of the ARNs of the dataset import jobs used to import training data
  /// for the predictor.
  final List<String>? datasetImportJobArns;

  /// An Key Management Service (KMS) key and the Identity and Access Management
  /// (IAM) role that Amazon Forecast can assume to access the key.
  final EncryptionConfig? encryptionConfig;

  /// The estimated time remaining in minutes for the predictor training job to
  /// complete.
  final int? estimatedTimeRemainingInMinutes;

  /// Used to override the default evaluation parameters of the specified
  /// algorithm. Amazon Forecast evaluates a predictor by splitting a dataset into
  /// training data and testing data. The evaluation parameters define how to
  /// perform the split and the number of iterations.
  final EvaluationParameters? evaluationParameters;

  /// The featurization configuration.
  final FeaturizationConfig? featurizationConfig;

  /// The number of time-steps of the forecast. The forecast horizon is also
  /// called the prediction length.
  final int? forecastHorizon;

  /// The forecast types used during predictor training. Default value is
  /// <code>["0.1","0.5","0.9"]</code>
  final List<String>? forecastTypes;

  /// The hyperparameter override values for the algorithm.
  final HyperParameterTuningJobConfig? hPOConfig;

  /// Describes the dataset group that contains the data to use to train the
  /// predictor.
  final InputDataConfig? inputDataConfig;

  /// Whether the predictor was created with <a>CreateAutoPredictor</a>.
  final bool? isAutoPredictor;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

  /// The accuracy metric used to optimize the predictor.
  final OptimizationMetric? optimizationMetric;

  /// Whether the predictor is set to perform AutoML.
  final bool? performAutoML;

  /// Whether the predictor is set to perform hyperparameter optimization (HPO).
  final bool? performHPO;

  /// The ARN of the predictor.
  final String? predictorArn;

  /// Details on the the status and results of the backtests performed to evaluate
  /// the accuracy of the predictor. You specify the number of backtests to
  /// perform when you call the operation.
  final PredictorExecutionDetails? predictorExecutionDetails;

  /// The name of the predictor.
  final String? predictorName;

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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the predictor must be <code>ACTIVE</code> before
  /// you can use the predictor to create a forecast.
  /// </note>
  final String? status;

  /// The default training parameters or overrides selected during model training.
  /// When running AutoML or choosing HPO with CNN-QR or DeepAR+, the optimized
  /// values for the chosen hyperparameters are returned. For more information,
  /// see <a>aws-forecast-choosing-recipes</a>.
  final Map<String, String>? trainingParameters;

  DescribePredictorResponse({
    this.algorithmArn,
    this.autoMLAlgorithmArns,
    this.autoMLOverrideStrategy,
    this.creationTime,
    this.datasetImportJobArns,
    this.encryptionConfig,
    this.estimatedTimeRemainingInMinutes,
    this.evaluationParameters,
    this.featurizationConfig,
    this.forecastHorizon,
    this.forecastTypes,
    this.hPOConfig,
    this.inputDataConfig,
    this.isAutoPredictor,
    this.lastModificationTime,
    this.message,
    this.optimizationMetric,
    this.performAutoML,
    this.performHPO,
    this.predictorArn,
    this.predictorExecutionDetails,
    this.predictorName,
    this.status,
    this.trainingParameters,
  });

  factory DescribePredictorResponse.fromJson(Map<String, dynamic> json) {
    return DescribePredictorResponse(
      algorithmArn: json['AlgorithmArn'] as String?,
      autoMLAlgorithmArns: (json['AutoMLAlgorithmArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      autoMLOverrideStrategy: (json['AutoMLOverrideStrategy'] as String?)
          ?.toAutoMLOverrideStrategy(),
      creationTime: timeStampFromJson(json['CreationTime']),
      datasetImportJobArns: (json['DatasetImportJobArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      encryptionConfig: json['EncryptionConfig'] != null
          ? EncryptionConfig.fromJson(
              json['EncryptionConfig'] as Map<String, dynamic>)
          : null,
      estimatedTimeRemainingInMinutes:
          json['EstimatedTimeRemainingInMinutes'] as int?,
      evaluationParameters: json['EvaluationParameters'] != null
          ? EvaluationParameters.fromJson(
              json['EvaluationParameters'] as Map<String, dynamic>)
          : null,
      featurizationConfig: json['FeaturizationConfig'] != null
          ? FeaturizationConfig.fromJson(
              json['FeaturizationConfig'] as Map<String, dynamic>)
          : null,
      forecastHorizon: json['ForecastHorizon'] as int?,
      forecastTypes: (json['ForecastTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      hPOConfig: json['HPOConfig'] != null
          ? HyperParameterTuningJobConfig.fromJson(
              json['HPOConfig'] as Map<String, dynamic>)
          : null,
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      isAutoPredictor: json['IsAutoPredictor'] as bool?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      optimizationMetric:
          (json['OptimizationMetric'] as String?)?.toOptimizationMetric(),
      performAutoML: json['PerformAutoML'] as bool?,
      performHPO: json['PerformHPO'] as bool?,
      predictorArn: json['PredictorArn'] as String?,
      predictorExecutionDetails: json['PredictorExecutionDetails'] != null
          ? PredictorExecutionDetails.fromJson(
              json['PredictorExecutionDetails'] as Map<String, dynamic>)
          : null,
      predictorName: json['PredictorName'] as String?,
      status: json['Status'] as String?,
      trainingParameters: (json['TrainingParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmArn = this.algorithmArn;
    final autoMLAlgorithmArns = this.autoMLAlgorithmArns;
    final autoMLOverrideStrategy = this.autoMLOverrideStrategy;
    final creationTime = this.creationTime;
    final datasetImportJobArns = this.datasetImportJobArns;
    final encryptionConfig = this.encryptionConfig;
    final estimatedTimeRemainingInMinutes =
        this.estimatedTimeRemainingInMinutes;
    final evaluationParameters = this.evaluationParameters;
    final featurizationConfig = this.featurizationConfig;
    final forecastHorizon = this.forecastHorizon;
    final forecastTypes = this.forecastTypes;
    final hPOConfig = this.hPOConfig;
    final inputDataConfig = this.inputDataConfig;
    final isAutoPredictor = this.isAutoPredictor;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final optimizationMetric = this.optimizationMetric;
    final performAutoML = this.performAutoML;
    final performHPO = this.performHPO;
    final predictorArn = this.predictorArn;
    final predictorExecutionDetails = this.predictorExecutionDetails;
    final predictorName = this.predictorName;
    final status = this.status;
    final trainingParameters = this.trainingParameters;
    return {
      if (algorithmArn != null) 'AlgorithmArn': algorithmArn,
      if (autoMLAlgorithmArns != null)
        'AutoMLAlgorithmArns': autoMLAlgorithmArns,
      if (autoMLOverrideStrategy != null)
        'AutoMLOverrideStrategy': autoMLOverrideStrategy.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (datasetImportJobArns != null)
        'DatasetImportJobArns': datasetImportJobArns,
      if (encryptionConfig != null) 'EncryptionConfig': encryptionConfig,
      if (estimatedTimeRemainingInMinutes != null)
        'EstimatedTimeRemainingInMinutes': estimatedTimeRemainingInMinutes,
      if (evaluationParameters != null)
        'EvaluationParameters': evaluationParameters,
      if (featurizationConfig != null)
        'FeaturizationConfig': featurizationConfig,
      if (forecastHorizon != null) 'ForecastHorizon': forecastHorizon,
      if (forecastTypes != null) 'ForecastTypes': forecastTypes,
      if (hPOConfig != null) 'HPOConfig': hPOConfig,
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (isAutoPredictor != null) 'IsAutoPredictor': isAutoPredictor,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (optimizationMetric != null)
        'OptimizationMetric': optimizationMetric.toValue(),
      if (performAutoML != null) 'PerformAutoML': performAutoML,
      if (performHPO != null) 'PerformHPO': performHPO,
      if (predictorArn != null) 'PredictorArn': predictorArn,
      if (predictorExecutionDetails != null)
        'PredictorExecutionDetails': predictorExecutionDetails,
      if (predictorName != null) 'PredictorName': predictorName,
      if (status != null) 'Status': status,
      if (trainingParameters != null) 'TrainingParameters': trainingParameters,
    };
  }
}

class DescribeWhatIfAnalysisResponse {
  /// When the what-if analysis was created.
  final DateTime? creationTime;

  /// The approximate time remaining to complete the what-if analysis, in minutes.
  final int? estimatedTimeRemainingInMinutes;

  /// The Amazon Resource Name (ARN) of the what-if forecast.
  final String? forecastArn;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

  /// The status of the what-if analysis. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the what-if analysis must be <code>ACTIVE</code>
  /// before you can access the analysis.
  /// </note>
  final String? status;
  final TimeSeriesSelector? timeSeriesSelector;

  /// The Amazon Resource Name (ARN) of the what-if analysis.
  final String? whatIfAnalysisArn;

  /// The name of the what-if analysis.
  final String? whatIfAnalysisName;

  DescribeWhatIfAnalysisResponse({
    this.creationTime,
    this.estimatedTimeRemainingInMinutes,
    this.forecastArn,
    this.lastModificationTime,
    this.message,
    this.status,
    this.timeSeriesSelector,
    this.whatIfAnalysisArn,
    this.whatIfAnalysisName,
  });

  factory DescribeWhatIfAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return DescribeWhatIfAnalysisResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      estimatedTimeRemainingInMinutes:
          json['EstimatedTimeRemainingInMinutes'] as int?,
      forecastArn: json['ForecastArn'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
      timeSeriesSelector: json['TimeSeriesSelector'] != null
          ? TimeSeriesSelector.fromJson(
              json['TimeSeriesSelector'] as Map<String, dynamic>)
          : null,
      whatIfAnalysisArn: json['WhatIfAnalysisArn'] as String?,
      whatIfAnalysisName: json['WhatIfAnalysisName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final estimatedTimeRemainingInMinutes =
        this.estimatedTimeRemainingInMinutes;
    final forecastArn = this.forecastArn;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final status = this.status;
    final timeSeriesSelector = this.timeSeriesSelector;
    final whatIfAnalysisArn = this.whatIfAnalysisArn;
    final whatIfAnalysisName = this.whatIfAnalysisName;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (estimatedTimeRemainingInMinutes != null)
        'EstimatedTimeRemainingInMinutes': estimatedTimeRemainingInMinutes,
      if (forecastArn != null) 'ForecastArn': forecastArn,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
      if (timeSeriesSelector != null) 'TimeSeriesSelector': timeSeriesSelector,
      if (whatIfAnalysisArn != null) 'WhatIfAnalysisArn': whatIfAnalysisArn,
      if (whatIfAnalysisName != null) 'WhatIfAnalysisName': whatIfAnalysisName,
    };
  }
}

class DescribeWhatIfForecastExportResponse {
  /// When the what-if forecast export was created.
  final DateTime? creationTime;
  final DataDestination? destination;

  /// The approximate time remaining to complete the what-if forecast export, in
  /// minutes.
  final int? estimatedTimeRemainingInMinutes;

  /// The format of the exported data, CSV or PARQUET.
  final String? format;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

  /// The status of the what-if forecast. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the what-if forecast export must be
  /// <code>ACTIVE</code> before you can access the forecast export.
  /// </note>
  final String? status;

  /// An array of Amazon Resource Names (ARNs) that represent all of the what-if
  /// forecasts exported in this resource.
  final List<String>? whatIfForecastArns;

  /// The Amazon Resource Name (ARN) of the what-if forecast export.
  final String? whatIfForecastExportArn;

  /// The name of the what-if forecast export.
  final String? whatIfForecastExportName;

  DescribeWhatIfForecastExportResponse({
    this.creationTime,
    this.destination,
    this.estimatedTimeRemainingInMinutes,
    this.format,
    this.lastModificationTime,
    this.message,
    this.status,
    this.whatIfForecastArns,
    this.whatIfForecastExportArn,
    this.whatIfForecastExportName,
  });

  factory DescribeWhatIfForecastExportResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeWhatIfForecastExportResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      destination: json['Destination'] != null
          ? DataDestination.fromJson(
              json['Destination'] as Map<String, dynamic>)
          : null,
      estimatedTimeRemainingInMinutes:
          json['EstimatedTimeRemainingInMinutes'] as int?,
      format: json['Format'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
      whatIfForecastArns: (json['WhatIfForecastArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      whatIfForecastExportArn: json['WhatIfForecastExportArn'] as String?,
      whatIfForecastExportName: json['WhatIfForecastExportName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destination = this.destination;
    final estimatedTimeRemainingInMinutes =
        this.estimatedTimeRemainingInMinutes;
    final format = this.format;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final status = this.status;
    final whatIfForecastArns = this.whatIfForecastArns;
    final whatIfForecastExportArn = this.whatIfForecastExportArn;
    final whatIfForecastExportName = this.whatIfForecastExportName;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (destination != null) 'Destination': destination,
      if (estimatedTimeRemainingInMinutes != null)
        'EstimatedTimeRemainingInMinutes': estimatedTimeRemainingInMinutes,
      if (format != null) 'Format': format,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
      if (whatIfForecastArns != null) 'WhatIfForecastArns': whatIfForecastArns,
      if (whatIfForecastExportArn != null)
        'WhatIfForecastExportArn': whatIfForecastExportArn,
      if (whatIfForecastExportName != null)
        'WhatIfForecastExportName': whatIfForecastExportName,
    };
  }
}

class DescribeWhatIfForecastResponse {
  /// When the what-if forecast was created.
  final DateTime? creationTime;

  /// The approximate time remaining to complete the what-if forecast, in minutes.
  final int? estimatedTimeRemainingInMinutes;

  /// The quantiles at which probabilistic forecasts are generated. You can
  /// specify up to five quantiles per what-if forecast in the
  /// <a>CreateWhatIfForecast</a> operation. If you didn't specify quantiles, the
  /// default values are <code>["0.1", "0.5", "0.9"]</code>.
  final List<String>? forecastTypes;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

  /// The status of the what-if forecast. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the what-if forecast must be <code>ACTIVE</code>
  /// before you can access the forecast.
  /// </note>
  final String? status;

  /// An array of <code>S3Config</code>, <code>Schema</code>, and
  /// <code>Format</code> elements that describe the replacement time series.
  final TimeSeriesReplacementsDataSource? timeSeriesReplacementsDataSource;

  /// An array of <code>Action</code> and <code>TimeSeriesConditions</code>
  /// elements that describe what transformations were applied to which time
  /// series.
  final List<TimeSeriesTransformation>? timeSeriesTransformations;

  /// The Amazon Resource Name (ARN) of the what-if analysis that contains this
  /// forecast.
  final String? whatIfAnalysisArn;

  /// The Amazon Resource Name (ARN) of the what-if forecast.
  final String? whatIfForecastArn;

  /// The name of the what-if forecast.
  final String? whatIfForecastName;

  DescribeWhatIfForecastResponse({
    this.creationTime,
    this.estimatedTimeRemainingInMinutes,
    this.forecastTypes,
    this.lastModificationTime,
    this.message,
    this.status,
    this.timeSeriesReplacementsDataSource,
    this.timeSeriesTransformations,
    this.whatIfAnalysisArn,
    this.whatIfForecastArn,
    this.whatIfForecastName,
  });

  factory DescribeWhatIfForecastResponse.fromJson(Map<String, dynamic> json) {
    return DescribeWhatIfForecastResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      estimatedTimeRemainingInMinutes:
          json['EstimatedTimeRemainingInMinutes'] as int?,
      forecastTypes: (json['ForecastTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
      timeSeriesReplacementsDataSource:
          json['TimeSeriesReplacementsDataSource'] != null
              ? TimeSeriesReplacementsDataSource.fromJson(
                  json['TimeSeriesReplacementsDataSource']
                      as Map<String, dynamic>)
              : null,
      timeSeriesTransformations: (json['TimeSeriesTransformations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TimeSeriesTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      whatIfAnalysisArn: json['WhatIfAnalysisArn'] as String?,
      whatIfForecastArn: json['WhatIfForecastArn'] as String?,
      whatIfForecastName: json['WhatIfForecastName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final estimatedTimeRemainingInMinutes =
        this.estimatedTimeRemainingInMinutes;
    final forecastTypes = this.forecastTypes;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final status = this.status;
    final timeSeriesReplacementsDataSource =
        this.timeSeriesReplacementsDataSource;
    final timeSeriesTransformations = this.timeSeriesTransformations;
    final whatIfAnalysisArn = this.whatIfAnalysisArn;
    final whatIfForecastArn = this.whatIfForecastArn;
    final whatIfForecastName = this.whatIfForecastName;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (estimatedTimeRemainingInMinutes != null)
        'EstimatedTimeRemainingInMinutes': estimatedTimeRemainingInMinutes,
      if (forecastTypes != null) 'ForecastTypes': forecastTypes,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
      if (timeSeriesReplacementsDataSource != null)
        'TimeSeriesReplacementsDataSource': timeSeriesReplacementsDataSource,
      if (timeSeriesTransformations != null)
        'TimeSeriesTransformations': timeSeriesTransformations,
      if (whatIfAnalysisArn != null) 'WhatIfAnalysisArn': whatIfAnalysisArn,
      if (whatIfForecastArn != null) 'WhatIfForecastArn': whatIfForecastArn,
      if (whatIfForecastName != null) 'WhatIfForecastName': whatIfForecastName,
    };
  }
}

enum Domain {
  retail,
  custom,
  inventoryPlanning,
  ec2Capacity,
  workForce,
  webTraffic,
  metrics,
}

extension DomainValueExtension on Domain {
  String toValue() {
    switch (this) {
      case Domain.retail:
        return 'RETAIL';
      case Domain.custom:
        return 'CUSTOM';
      case Domain.inventoryPlanning:
        return 'INVENTORY_PLANNING';
      case Domain.ec2Capacity:
        return 'EC2_CAPACITY';
      case Domain.workForce:
        return 'WORK_FORCE';
      case Domain.webTraffic:
        return 'WEB_TRAFFIC';
      case Domain.metrics:
        return 'METRICS';
    }
  }
}

extension DomainFromString on String {
  Domain toDomain() {
    switch (this) {
      case 'RETAIL':
        return Domain.retail;
      case 'CUSTOM':
        return Domain.custom;
      case 'INVENTORY_PLANNING':
        return Domain.inventoryPlanning;
      case 'EC2_CAPACITY':
        return Domain.ec2Capacity;
      case 'WORK_FORCE':
        return Domain.workForce;
      case 'WEB_TRAFFIC':
        return Domain.webTraffic;
      case 'METRICS':
        return Domain.metrics;
    }
    throw Exception('$this is not known in enum Domain');
  }
}

/// An Key Management Service (KMS) key and an Identity and Access Management
/// (IAM) role that Amazon Forecast can assume to access the key. You can
/// specify this optional object in the <a>CreateDataset</a> and
/// <a>CreatePredictor</a> requests.
class EncryptionConfig {
  /// The Amazon Resource Name (ARN) of the KMS key.
  final String kMSKeyArn;

  /// The ARN of the IAM role that Amazon Forecast can assume to access the KMS
  /// key.
  ///
  /// Passing a role across Amazon Web Services accounts is not allowed. If you
  /// pass a role that isn't in your account, you get an
  /// <code>InvalidInputException</code> error.
  final String roleArn;

  EncryptionConfig({
    required this.kMSKeyArn,
    required this.roleArn,
  });

  factory EncryptionConfig.fromJson(Map<String, dynamic> json) {
    return EncryptionConfig(
      kMSKeyArn: json['KMSKeyArn'] as String,
      roleArn: json['RoleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final kMSKeyArn = this.kMSKeyArn;
    final roleArn = this.roleArn;
    return {
      'KMSKeyArn': kMSKeyArn,
      'RoleArn': roleArn,
    };
  }
}

/// Provides detailed error metrics to evaluate the performance of a predictor.
/// This object is part of the <a>Metrics</a> object.
class ErrorMetric {
  /// The Forecast type used to compute WAPE, MAPE, MASE, and RMSE.
  final String? forecastType;

  /// The Mean Absolute Percentage Error (MAPE)
  final double? mape;

  /// The Mean Absolute Scaled Error (MASE)
  final double? mase;

  /// The root-mean-square error (RMSE).
  final double? rmse;

  /// The weighted absolute percentage error (WAPE).
  final double? wape;

  ErrorMetric({
    this.forecastType,
    this.mape,
    this.mase,
    this.rmse,
    this.wape,
  });

  factory ErrorMetric.fromJson(Map<String, dynamic> json) {
    return ErrorMetric(
      forecastType: json['ForecastType'] as String?,
      mape: json['MAPE'] as double?,
      mase: json['MASE'] as double?,
      rmse: json['RMSE'] as double?,
      wape: json['WAPE'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final forecastType = this.forecastType;
    final mape = this.mape;
    final mase = this.mase;
    final rmse = this.rmse;
    final wape = this.wape;
    return {
      if (forecastType != null) 'ForecastType': forecastType,
      if (mape != null) 'MAPE': mape,
      if (mase != null) 'MASE': mase,
      if (rmse != null) 'RMSE': rmse,
      if (wape != null) 'WAPE': wape,
    };
  }
}

/// Parameters that define how to split a dataset into training data and testing
/// data, and the number of iterations to perform. These parameters are
/// specified in the predefined algorithms but you can override them in the
/// <a>CreatePredictor</a> request.
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
  final int? backTestWindowOffset;

  /// The number of times to split the input data. The default is 1. Valid values
  /// are 1 through 5.
  final int? numberOfBacktestWindows;

  EvaluationParameters({
    this.backTestWindowOffset,
    this.numberOfBacktestWindows,
  });

  factory EvaluationParameters.fromJson(Map<String, dynamic> json) {
    return EvaluationParameters(
      backTestWindowOffset: json['BackTestWindowOffset'] as int?,
      numberOfBacktestWindows: json['NumberOfBacktestWindows'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final backTestWindowOffset = this.backTestWindowOffset;
    final numberOfBacktestWindows = this.numberOfBacktestWindows;
    return {
      if (backTestWindowOffset != null)
        'BackTestWindowOffset': backTestWindowOffset,
      if (numberOfBacktestWindows != null)
        'NumberOfBacktestWindows': numberOfBacktestWindows,
    };
  }
}

/// The results of evaluating an algorithm. Returned as part of the
/// <a>GetAccuracyMetrics</a> response.
class EvaluationResult {
  /// The Amazon Resource Name (ARN) of the algorithm that was evaluated.
  final String? algorithmArn;

  /// The array of test windows used for evaluating the algorithm. The
  /// <code>NumberOfBacktestWindows</code> from the <a>EvaluationParameters</a>
  /// object determines the number of windows in the array.
  final List<WindowSummary>? testWindows;

  EvaluationResult({
    this.algorithmArn,
    this.testWindows,
  });

  factory EvaluationResult.fromJson(Map<String, dynamic> json) {
    return EvaluationResult(
      algorithmArn: json['AlgorithmArn'] as String?,
      testWindows: (json['TestWindows'] as List?)
          ?.whereNotNull()
          .map((e) => WindowSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmArn = this.algorithmArn;
    final testWindows = this.testWindows;
    return {
      if (algorithmArn != null) 'AlgorithmArn': algorithmArn,
      if (testWindows != null) 'TestWindows': testWindows,
    };
  }
}

enum EvaluationType {
  summary,
  computed,
}

extension EvaluationTypeValueExtension on EvaluationType {
  String toValue() {
    switch (this) {
      case EvaluationType.summary:
        return 'SUMMARY';
      case EvaluationType.computed:
        return 'COMPUTED';
    }
  }
}

extension EvaluationTypeFromString on String {
  EvaluationType toEvaluationType() {
    switch (this) {
      case 'SUMMARY':
        return EvaluationType.summary;
      case 'COMPUTED':
        return EvaluationType.computed;
    }
    throw Exception('$this is not known in enum EvaluationType');
  }
}

/// The ExplainabilityConfig data type defines the number of time series and
/// time points included in <a>CreateExplainability</a>.
///
/// If you provide a predictor ARN for <code>ResourceArn</code>, you must set
/// both <code>TimePointGranularity</code> and
/// <code>TimeSeriesGranularity</code> to “ALL”. When creating Predictor
/// Explainability, Amazon Forecast considers all time series and time points.
///
/// If you provide a forecast ARN for <code>ResourceArn</code>, you can set
/// <code>TimePointGranularity</code> and <code>TimeSeriesGranularity</code> to
/// either “ALL” or “Specific”.
class ExplainabilityConfig {
  /// To create an Explainability for all time points in your forecast horizon,
  /// use <code>ALL</code>. To create an Explainability for specific time points
  /// in your forecast horizon, use <code>SPECIFIC</code>.
  ///
  /// Specify time points with the <code>StartDateTime</code> and
  /// <code>EndDateTime</code> parameters within the <a>CreateExplainability</a>
  /// operation.
  final TimePointGranularity timePointGranularity;

  /// To create an Explainability for all time series in your datasets, use
  /// <code>ALL</code>. To create an Explainability for specific time series in
  /// your datasets, use <code>SPECIFIC</code>.
  ///
  /// Specify time series by uploading a CSV or Parquet file to an Amazon S3
  /// bucket and set the location within the <a>DataDestination</a> data type.
  final TimeSeriesGranularity timeSeriesGranularity;

  ExplainabilityConfig({
    required this.timePointGranularity,
    required this.timeSeriesGranularity,
  });

  factory ExplainabilityConfig.fromJson(Map<String, dynamic> json) {
    return ExplainabilityConfig(
      timePointGranularity:
          (json['TimePointGranularity'] as String).toTimePointGranularity(),
      timeSeriesGranularity:
          (json['TimeSeriesGranularity'] as String).toTimeSeriesGranularity(),
    );
  }

  Map<String, dynamic> toJson() {
    final timePointGranularity = this.timePointGranularity;
    final timeSeriesGranularity = this.timeSeriesGranularity;
    return {
      'TimePointGranularity': timePointGranularity.toValue(),
      'TimeSeriesGranularity': timeSeriesGranularity.toValue(),
    };
  }
}

/// Provides a summary of the Explainability export properties used in the
/// <a>ListExplainabilityExports</a> operation. To get a complete set of
/// properties, call the <a>DescribeExplainabilityExport</a> operation, and
/// provide the <code>ExplainabilityExportArn</code>.
class ExplainabilityExportSummary {
  /// When the Explainability was created.
  final DateTime? creationTime;
  final DataDestination? destination;

  /// The Amazon Resource Name (ARN) of the Explainability export.
  final String? explainabilityExportArn;

  /// The name of the Explainability export
  final String? explainabilityExportName;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// Information about any errors that may have occurred during the
  /// Explainability export.
  final String? message;

  /// The status of the Explainability export. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul>
  final String? status;

  ExplainabilityExportSummary({
    this.creationTime,
    this.destination,
    this.explainabilityExportArn,
    this.explainabilityExportName,
    this.lastModificationTime,
    this.message,
    this.status,
  });

  factory ExplainabilityExportSummary.fromJson(Map<String, dynamic> json) {
    return ExplainabilityExportSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      destination: json['Destination'] != null
          ? DataDestination.fromJson(
              json['Destination'] as Map<String, dynamic>)
          : null,
      explainabilityExportArn: json['ExplainabilityExportArn'] as String?,
      explainabilityExportName: json['ExplainabilityExportName'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destination = this.destination;
    final explainabilityExportArn = this.explainabilityExportArn;
    final explainabilityExportName = this.explainabilityExportName;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (destination != null) 'Destination': destination,
      if (explainabilityExportArn != null)
        'ExplainabilityExportArn': explainabilityExportArn,
      if (explainabilityExportName != null)
        'ExplainabilityExportName': explainabilityExportName,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
    };
  }
}

/// Provides information about the Explainability resource.
class ExplainabilityInfo {
  /// The Amazon Resource Name (ARN) of the Explainability.
  final String? explainabilityArn;

  /// The status of the Explainability. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul>
  final String? status;

  ExplainabilityInfo({
    this.explainabilityArn,
    this.status,
  });

  factory ExplainabilityInfo.fromJson(Map<String, dynamic> json) {
    return ExplainabilityInfo(
      explainabilityArn: json['ExplainabilityArn'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final explainabilityArn = this.explainabilityArn;
    final status = this.status;
    return {
      if (explainabilityArn != null) 'ExplainabilityArn': explainabilityArn,
      if (status != null) 'Status': status,
    };
  }
}

/// Provides a summary of the Explainability properties used in the
/// <a>ListExplainabilities</a> operation. To get a complete set of properties,
/// call the <a>DescribeExplainability</a> operation, and provide the listed
/// <code>ExplainabilityArn</code>.
class ExplainabilitySummary {
  /// When the Explainability was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the Explainability.
  final String? explainabilityArn;

  /// The configuration settings that define the granularity of time series and
  /// time points for the Explainability.
  final ExplainabilityConfig? explainabilityConfig;

  /// The name of the Explainability.
  final String? explainabilityName;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// Information about any errors that may have occurred during the
  /// Explainability creation process.
  final String? message;

  /// The Amazon Resource Name (ARN) of the Predictor or Forecast used to create
  /// the Explainability.
  final String? resourceArn;

  /// The status of the Explainability. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul>
  final String? status;

  ExplainabilitySummary({
    this.creationTime,
    this.explainabilityArn,
    this.explainabilityConfig,
    this.explainabilityName,
    this.lastModificationTime,
    this.message,
    this.resourceArn,
    this.status,
  });

  factory ExplainabilitySummary.fromJson(Map<String, dynamic> json) {
    return ExplainabilitySummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      explainabilityArn: json['ExplainabilityArn'] as String?,
      explainabilityConfig: json['ExplainabilityConfig'] != null
          ? ExplainabilityConfig.fromJson(
              json['ExplainabilityConfig'] as Map<String, dynamic>)
          : null,
      explainabilityName: json['ExplainabilityName'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final explainabilityArn = this.explainabilityArn;
    final explainabilityConfig = this.explainabilityConfig;
    final explainabilityName = this.explainabilityName;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final resourceArn = this.resourceArn;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (explainabilityArn != null) 'ExplainabilityArn': explainabilityArn,
      if (explainabilityConfig != null)
        'ExplainabilityConfig': explainabilityConfig,
      if (explainabilityName != null) 'ExplainabilityName': explainabilityName,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (status != null) 'Status': status,
    };
  }
}

/// <note>
/// This object belongs to the <a>CreatePredictor</a> operation. If you created
/// your predictor with <a>CreateAutoPredictor</a>, see <a>AttributeConfig</a>.
/// </note>
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
class Featurization {
  /// The name of the schema attribute that specifies the data field to be
  /// featurized. Amazon Forecast supports the target field of the
  /// <code>TARGET_TIME_SERIES</code> and the <code>RELATED_TIME_SERIES</code>
  /// datasets. For example, for the <code>RETAIL</code> domain, the target is
  /// <code>demand</code>, and for the <code>CUSTOM</code> domain, the target is
  /// <code>target_value</code>. For more information, see
  /// <a>howitworks-missing-values</a>.
  final String attributeName;

  /// An array of one <code>FeaturizationMethod</code> object that specifies the
  /// feature transformation method.
  final List<FeaturizationMethod>? featurizationPipeline;

  Featurization({
    required this.attributeName,
    this.featurizationPipeline,
  });

  factory Featurization.fromJson(Map<String, dynamic> json) {
    return Featurization(
      attributeName: json['AttributeName'] as String,
      featurizationPipeline: (json['FeaturizationPipeline'] as List?)
          ?.whereNotNull()
          .map((e) => FeaturizationMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final featurizationPipeline = this.featurizationPipeline;
    return {
      'AttributeName': attributeName,
      if (featurizationPipeline != null)
        'FeaturizationPipeline': featurizationPipeline,
    };
  }
}

/// <note>
/// This object belongs to the <a>CreatePredictor</a> operation. If you created
/// your predictor with <a>CreateAutoPredictor</a>, see <a>AttributeConfig</a>.
/// </note>
/// In a <a>CreatePredictor</a> operation, the specified algorithm trains a
/// model using the specified dataset group. You can optionally tell the
/// operation to modify data fields prior to training a model. These
/// modifications are referred to as <i>featurization</i>.
///
/// You define featurization using the <code>FeaturizationConfig</code> object.
/// You specify an array of transformations, one for each field that you want to
/// featurize. You then include the <code>FeaturizationConfig</code> object in
/// your <code>CreatePredictor</code> request. Amazon Forecast applies the
/// featurization to the <code>TARGET_TIME_SERIES</code> and
/// <code>RELATED_TIME_SERIES</code> datasets before model training.
///
/// You can create multiple featurization configurations. For example, you might
/// call the <code>CreatePredictor</code> operation twice by specifying
/// different featurization configurations.
class FeaturizationConfig {
  /// The frequency of predictions in a forecast.
  ///
  /// Valid intervals are an integer followed by Y (Year), M (Month), W (Week), D
  /// (Day), H (Hour), and min (Minute). For example, "1D" indicates every day and
  /// "15min" indicates every 15 minutes. You cannot specify a value that would
  /// overlap with the next larger frequency. That means, for example, you cannot
  /// specify a frequency of 60 minutes, because that is equivalent to 1 hour. The
  /// valid values for each frequency are the following:
  ///
  /// <ul>
  /// <li>
  /// Minute - 1-59
  /// </li>
  /// <li>
  /// Hour - 1-23
  /// </li>
  /// <li>
  /// Day - 1-6
  /// </li>
  /// <li>
  /// Week - 1-4
  /// </li>
  /// <li>
  /// Month - 1-11
  /// </li>
  /// <li>
  /// Year - 1
  /// </li>
  /// </ul>
  /// Thus, if you want every other week forecasts, specify "2W". Or, if you want
  /// quarterly forecasts, you specify "3M".
  ///
  /// The frequency must be greater than or equal to the TARGET_TIME_SERIES
  /// dataset frequency.
  ///
  /// When a RELATED_TIME_SERIES dataset is provided, the frequency must be equal
  /// to the TARGET_TIME_SERIES dataset frequency.
  final String forecastFrequency;

  /// An array of featurization (transformation) information for the fields of a
  /// dataset.
  final List<Featurization>? featurizations;

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
  final List<String>? forecastDimensions;

  FeaturizationConfig({
    required this.forecastFrequency,
    this.featurizations,
    this.forecastDimensions,
  });

  factory FeaturizationConfig.fromJson(Map<String, dynamic> json) {
    return FeaturizationConfig(
      forecastFrequency: json['ForecastFrequency'] as String,
      featurizations: (json['Featurizations'] as List?)
          ?.whereNotNull()
          .map((e) => Featurization.fromJson(e as Map<String, dynamic>))
          .toList(),
      forecastDimensions: (json['ForecastDimensions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final forecastFrequency = this.forecastFrequency;
    final featurizations = this.featurizations;
    final forecastDimensions = this.forecastDimensions;
    return {
      'ForecastFrequency': forecastFrequency,
      if (featurizations != null) 'Featurizations': featurizations,
      if (forecastDimensions != null) 'ForecastDimensions': forecastDimensions,
    };
  }
}

/// Provides information about the method that featurizes (transforms) a dataset
/// field. The method is part of the <code>FeaturizationPipeline</code> of the
/// <a>Featurization</a> object.
///
/// The following is an example of how you specify a
/// <code>FeaturizationMethod</code> object.
///
/// <code>{</code>
///
/// <code>"FeaturizationMethodName": "filling",</code>
///
/// <code>"FeaturizationMethodParameters": {"aggregation": "sum", "middlefill":
/// "zero", "backfill": "zero"}</code>
///
/// <code>}</code>
class FeaturizationMethod {
  /// The name of the method. The "filling" method is the only supported method.
  final FeaturizationMethodName featurizationMethodName;

  /// The method parameters (key-value pairs), which are a map of override
  /// parameters. Specify these parameters to override the default values. Related
  /// Time Series attributes do not accept aggregation parameters.
  ///
  /// The following list shows the parameters and their valid values for the
  /// "filling" featurization method for a <b>Target Time Series</b> dataset. Bold
  /// signifies the default value.
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
  /// <code>middlefill</code>: <b>zero</b>, <code>nan</code> (not a number),
  /// <code>value</code>, <code>median</code>, <code>mean</code>,
  /// <code>min</code>, <code>max</code>
  /// </li>
  /// <li>
  /// <code>backfill</code>: <b>zero</b>, <code>nan</code>, <code>value</code>,
  /// <code>median</code>, <code>mean</code>, <code>min</code>, <code>max</code>
  /// </li>
  /// </ul>
  /// The following list shows the parameters and their valid values for a
  /// <b>Related Time Series</b> featurization method (there are no defaults):
  ///
  /// <ul>
  /// <li>
  /// <code>middlefill</code>: <code>zero</code>, <code>value</code>,
  /// <code>median</code>, <code>mean</code>, <code>min</code>, <code>max</code>
  /// </li>
  /// <li>
  /// <code>backfill</code>: <code>zero</code>, <code>value</code>,
  /// <code>median</code>, <code>mean</code>, <code>min</code>, <code>max</code>
  /// </li>
  /// <li>
  /// <code>futurefill</code>: <code>zero</code>, <code>value</code>,
  /// <code>median</code>, <code>mean</code>, <code>min</code>, <code>max</code>
  /// </li>
  /// </ul>
  /// To set a filling method to a specific value, set the fill parameter to
  /// <code>value</code> and define the value in a corresponding
  /// <code>_value</code> parameter. For example, to set backfilling to a value of
  /// 2, include the following: <code>"backfill": "value"</code> and
  /// <code>"backfill_value":"2"</code>.
  final Map<String, String>? featurizationMethodParameters;

  FeaturizationMethod({
    required this.featurizationMethodName,
    this.featurizationMethodParameters,
  });

  factory FeaturizationMethod.fromJson(Map<String, dynamic> json) {
    return FeaturizationMethod(
      featurizationMethodName: (json['FeaturizationMethodName'] as String)
          .toFeaturizationMethodName(),
      featurizationMethodParameters:
          (json['FeaturizationMethodParameters'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final featurizationMethodName = this.featurizationMethodName;
    final featurizationMethodParameters = this.featurizationMethodParameters;
    return {
      'FeaturizationMethodName': featurizationMethodName.toValue(),
      if (featurizationMethodParameters != null)
        'FeaturizationMethodParameters': featurizationMethodParameters,
    };
  }
}

enum FeaturizationMethodName {
  filling,
}

extension FeaturizationMethodNameValueExtension on FeaturizationMethodName {
  String toValue() {
    switch (this) {
      case FeaturizationMethodName.filling:
        return 'filling';
    }
  }
}

extension FeaturizationMethodNameFromString on String {
  FeaturizationMethodName toFeaturizationMethodName() {
    switch (this) {
      case 'filling':
        return FeaturizationMethodName.filling;
    }
    throw Exception('$this is not known in enum FeaturizationMethodName');
  }
}

/// Describes a filter for choosing a subset of objects. Each filter consists of
/// a condition and a match statement. The condition is either <code>IS</code>
/// or <code>IS_NOT</code>, which specifies whether to include or exclude the
/// objects that match the statement, respectively. The match statement consists
/// of a key and a value.
class Filter {
  /// The condition to apply. To include the objects that match the statement,
  /// specify <code>IS</code>. To exclude matching objects, specify
  /// <code>IS_NOT</code>.
  final FilterConditionString condition;

  /// The name of the parameter to filter on.
  final String key;

  /// The value to match.
  final String value;

  Filter({
    required this.condition,
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final key = this.key;
    final value = this.value;
    return {
      'Condition': condition.toValue(),
      'Key': key,
      'Value': value,
    };
  }
}

enum FilterConditionString {
  $is,
  isNot,
}

extension FilterConditionStringValueExtension on FilterConditionString {
  String toValue() {
    switch (this) {
      case FilterConditionString.$is:
        return 'IS';
      case FilterConditionString.isNot:
        return 'IS_NOT';
    }
  }
}

extension FilterConditionStringFromString on String {
  FilterConditionString toFilterConditionString() {
    switch (this) {
      case 'IS':
        return FilterConditionString.$is;
      case 'IS_NOT':
        return FilterConditionString.isNot;
    }
    throw Exception('$this is not known in enum FilterConditionString');
  }
}

/// Provides a summary of the forecast export job properties used in the
/// <a>ListForecastExportJobs</a> operation. To get the complete set of
/// properties, call the <a>DescribeForecastExportJob</a> operation, and provide
/// the listed <code>ForecastExportJobArn</code>.
class ForecastExportJobSummary {
  /// When the forecast export job was created.
  final DateTime? creationTime;

  /// The path to the Amazon Simple Storage Service (Amazon S3) bucket where the
  /// forecast is exported.
  final DataDestination? destination;

  /// The Amazon Resource Name (ARN) of the forecast export job.
  final String? forecastExportJobArn;

  /// The name of the forecast export job.
  final String? forecastExportJobName;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the forecast export job must be
  /// <code>ACTIVE</code> before you can access the forecast in your S3 bucket.
  /// </note>
  final String? status;

  ForecastExportJobSummary({
    this.creationTime,
    this.destination,
    this.forecastExportJobArn,
    this.forecastExportJobName,
    this.lastModificationTime,
    this.message,
    this.status,
  });

  factory ForecastExportJobSummary.fromJson(Map<String, dynamic> json) {
    return ForecastExportJobSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      destination: json['Destination'] != null
          ? DataDestination.fromJson(
              json['Destination'] as Map<String, dynamic>)
          : null,
      forecastExportJobArn: json['ForecastExportJobArn'] as String?,
      forecastExportJobName: json['ForecastExportJobName'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destination = this.destination;
    final forecastExportJobArn = this.forecastExportJobArn;
    final forecastExportJobName = this.forecastExportJobName;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (destination != null) 'Destination': destination,
      if (forecastExportJobArn != null)
        'ForecastExportJobArn': forecastExportJobArn,
      if (forecastExportJobName != null)
        'ForecastExportJobName': forecastExportJobName,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
    };
  }
}

/// Provides a summary of the forecast properties used in the
/// <a>ListForecasts</a> operation. To get the complete set of properties, call
/// the <a>DescribeForecast</a> operation, and provide the
/// <code>ForecastArn</code> that is listed in the summary.
class ForecastSummary {
  /// Whether the Forecast was created from an AutoPredictor.
  final bool? createdUsingAutoPredictor;

  /// When the forecast creation task was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the dataset group that provided the data
  /// used to train the predictor.
  final String? datasetGroupArn;

  /// The ARN of the forecast.
  final String? forecastArn;

  /// The name of the forecast.
  final String? forecastName;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

  /// The ARN of the predictor used to generate the forecast.
  final String? predictorArn;

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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the forecast must be <code>ACTIVE</code> before
  /// you can query or export the forecast.
  /// </note>
  final String? status;

  ForecastSummary({
    this.createdUsingAutoPredictor,
    this.creationTime,
    this.datasetGroupArn,
    this.forecastArn,
    this.forecastName,
    this.lastModificationTime,
    this.message,
    this.predictorArn,
    this.status,
  });

  factory ForecastSummary.fromJson(Map<String, dynamic> json) {
    return ForecastSummary(
      createdUsingAutoPredictor: json['CreatedUsingAutoPredictor'] as bool?,
      creationTime: timeStampFromJson(json['CreationTime']),
      datasetGroupArn: json['DatasetGroupArn'] as String?,
      forecastArn: json['ForecastArn'] as String?,
      forecastName: json['ForecastName'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      predictorArn: json['PredictorArn'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdUsingAutoPredictor = this.createdUsingAutoPredictor;
    final creationTime = this.creationTime;
    final datasetGroupArn = this.datasetGroupArn;
    final forecastArn = this.forecastArn;
    final forecastName = this.forecastName;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final predictorArn = this.predictorArn;
    final status = this.status;
    return {
      if (createdUsingAutoPredictor != null)
        'CreatedUsingAutoPredictor': createdUsingAutoPredictor,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (datasetGroupArn != null) 'DatasetGroupArn': datasetGroupArn,
      if (forecastArn != null) 'ForecastArn': forecastArn,
      if (forecastName != null) 'ForecastName': forecastName,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (predictorArn != null) 'PredictorArn': predictorArn,
      if (status != null) 'Status': status,
    };
  }
}

class GetAccuracyMetricsResponse {
  /// <note>
  /// The <code>LatencyOptimized</code> AutoML override strategy is only available
  /// in private beta. Contact Amazon Web Services Support or your account manager
  /// to learn more about access privileges.
  /// </note>
  /// The AutoML strategy used to train the predictor. Unless
  /// <code>LatencyOptimized</code> is specified, the AutoML strategy optimizes
  /// predictor accuracy.
  ///
  /// This parameter is only valid for predictors trained using AutoML.
  final AutoMLOverrideStrategy? autoMLOverrideStrategy;

  /// Whether the predictor was created with <a>CreateAutoPredictor</a>.
  final bool? isAutoPredictor;

  /// The accuracy metric used to optimize the predictor.
  final OptimizationMetric? optimizationMetric;

  /// An array of results from evaluating the predictor.
  final List<EvaluationResult>? predictorEvaluationResults;

  GetAccuracyMetricsResponse({
    this.autoMLOverrideStrategy,
    this.isAutoPredictor,
    this.optimizationMetric,
    this.predictorEvaluationResults,
  });

  factory GetAccuracyMetricsResponse.fromJson(Map<String, dynamic> json) {
    return GetAccuracyMetricsResponse(
      autoMLOverrideStrategy: (json['AutoMLOverrideStrategy'] as String?)
          ?.toAutoMLOverrideStrategy(),
      isAutoPredictor: json['IsAutoPredictor'] as bool?,
      optimizationMetric:
          (json['OptimizationMetric'] as String?)?.toOptimizationMetric(),
      predictorEvaluationResults: (json['PredictorEvaluationResults'] as List?)
          ?.whereNotNull()
          .map((e) => EvaluationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoMLOverrideStrategy = this.autoMLOverrideStrategy;
    final isAutoPredictor = this.isAutoPredictor;
    final optimizationMetric = this.optimizationMetric;
    final predictorEvaluationResults = this.predictorEvaluationResults;
    return {
      if (autoMLOverrideStrategy != null)
        'AutoMLOverrideStrategy': autoMLOverrideStrategy.toValue(),
      if (isAutoPredictor != null) 'IsAutoPredictor': isAutoPredictor,
      if (optimizationMetric != null)
        'OptimizationMetric': optimizationMetric.toValue(),
      if (predictorEvaluationResults != null)
        'PredictorEvaluationResults': predictorEvaluationResults,
    };
  }
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
class HyperParameterTuningJobConfig {
  /// Specifies the ranges of valid values for the hyperparameters.
  final ParameterRanges? parameterRanges;

  HyperParameterTuningJobConfig({
    this.parameterRanges,
  });

  factory HyperParameterTuningJobConfig.fromJson(Map<String, dynamic> json) {
    return HyperParameterTuningJobConfig(
      parameterRanges: json['ParameterRanges'] != null
          ? ParameterRanges.fromJson(
              json['ParameterRanges'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterRanges = this.parameterRanges;
    return {
      if (parameterRanges != null) 'ParameterRanges': parameterRanges,
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

/// <note>
/// This object belongs to the <a>CreatePredictor</a> operation. If you created
/// your predictor with <a>CreateAutoPredictor</a>, see <a>DataConfig</a>.
/// </note>
/// The data used to train a predictor. The data includes a dataset group and
/// any supplementary features. You specify this object in the
/// <a>CreatePredictor</a> request.
class InputDataConfig {
  /// The Amazon Resource Name (ARN) of the dataset group.
  final String datasetGroupArn;

  /// An array of supplementary features. The only supported feature is a holiday
  /// calendar.
  final List<SupplementaryFeature>? supplementaryFeatures;

  InputDataConfig({
    required this.datasetGroupArn,
    this.supplementaryFeatures,
  });

  factory InputDataConfig.fromJson(Map<String, dynamic> json) {
    return InputDataConfig(
      datasetGroupArn: json['DatasetGroupArn'] as String,
      supplementaryFeatures: (json['SupplementaryFeatures'] as List?)
          ?.whereNotNull()
          .map((e) => SupplementaryFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final datasetGroupArn = this.datasetGroupArn;
    final supplementaryFeatures = this.supplementaryFeatures;
    return {
      'DatasetGroupArn': datasetGroupArn,
      if (supplementaryFeatures != null)
        'SupplementaryFeatures': supplementaryFeatures,
    };
  }
}

/// Specifies an integer hyperparameter and it's range of tunable values. This
/// object is part of the <a>ParameterRanges</a> object.
class IntegerParameterRange {
  /// The maximum tunable value of the hyperparameter.
  final int maxValue;

  /// The minimum tunable value of the hyperparameter.
  final int minValue;

  /// The name of the hyperparameter to tune.
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
  final ScalingType? scalingType;

  IntegerParameterRange({
    required this.maxValue,
    required this.minValue,
    required this.name,
    this.scalingType,
  });

  factory IntegerParameterRange.fromJson(Map<String, dynamic> json) {
    return IntegerParameterRange(
      maxValue: json['MaxValue'] as int,
      minValue: json['MinValue'] as int,
      name: json['Name'] as String,
      scalingType: (json['ScalingType'] as String?)?.toScalingType(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxValue = this.maxValue;
    final minValue = this.minValue;
    final name = this.name;
    final scalingType = this.scalingType;
    return {
      'MaxValue': maxValue,
      'MinValue': minValue,
      'Name': name,
      if (scalingType != null) 'ScalingType': scalingType.toValue(),
    };
  }
}

class ListDatasetGroupsResponse {
  /// An array of objects that summarize each dataset group's properties.
  final List<DatasetGroupSummary>? datasetGroups;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String? nextToken;

  ListDatasetGroupsResponse({
    this.datasetGroups,
    this.nextToken,
  });

  factory ListDatasetGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetGroupsResponse(
      datasetGroups: (json['DatasetGroups'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetGroups = this.datasetGroups;
    final nextToken = this.nextToken;
    return {
      if (datasetGroups != null) 'DatasetGroups': datasetGroups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDatasetImportJobsResponse {
  /// An array of objects that summarize each dataset import job's properties.
  final List<DatasetImportJobSummary>? datasetImportJobs;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String? nextToken;

  ListDatasetImportJobsResponse({
    this.datasetImportJobs,
    this.nextToken,
  });

  factory ListDatasetImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetImportJobsResponse(
      datasetImportJobs: (json['DatasetImportJobs'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DatasetImportJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetImportJobs = this.datasetImportJobs;
    final nextToken = this.nextToken;
    return {
      if (datasetImportJobs != null) 'DatasetImportJobs': datasetImportJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDatasetsResponse {
  /// An array of objects that summarize each dataset's properties.
  final List<DatasetSummary>? datasets;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String? nextToken;

  ListDatasetsResponse({
    this.datasets,
    this.nextToken,
  });

  factory ListDatasetsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetsResponse(
      datasets: (json['Datasets'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasets = this.datasets;
    final nextToken = this.nextToken;
    return {
      if (datasets != null) 'Datasets': datasets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListExplainabilitiesResponse {
  /// An array of objects that summarize the properties of each Explainability
  /// resource.
  final List<ExplainabilitySummary>? explainabilities;

  /// Returns this token if the response is truncated. To retrieve the next set of
  /// results, use the token in the next request.
  final String? nextToken;

  ListExplainabilitiesResponse({
    this.explainabilities,
    this.nextToken,
  });

  factory ListExplainabilitiesResponse.fromJson(Map<String, dynamic> json) {
    return ListExplainabilitiesResponse(
      explainabilities: (json['Explainabilities'] as List?)
          ?.whereNotNull()
          .map((e) => ExplainabilitySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final explainabilities = this.explainabilities;
    final nextToken = this.nextToken;
    return {
      if (explainabilities != null) 'Explainabilities': explainabilities,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListExplainabilityExportsResponse {
  /// An array of objects that summarize the properties of each Explainability
  /// export.
  final List<ExplainabilityExportSummary>? explainabilityExports;

  /// Returns this token if the response is truncated. To retrieve the next set of
  /// results, use the token in the next request.
  final String? nextToken;

  ListExplainabilityExportsResponse({
    this.explainabilityExports,
    this.nextToken,
  });

  factory ListExplainabilityExportsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListExplainabilityExportsResponse(
      explainabilityExports: (json['ExplainabilityExports'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ExplainabilityExportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final explainabilityExports = this.explainabilityExports;
    final nextToken = this.nextToken;
    return {
      if (explainabilityExports != null)
        'ExplainabilityExports': explainabilityExports,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListForecastExportJobsResponse {
  /// An array of objects that summarize each export job's properties.
  final List<ForecastExportJobSummary>? forecastExportJobs;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String? nextToken;

  ListForecastExportJobsResponse({
    this.forecastExportJobs,
    this.nextToken,
  });

  factory ListForecastExportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListForecastExportJobsResponse(
      forecastExportJobs: (json['ForecastExportJobs'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ForecastExportJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final forecastExportJobs = this.forecastExportJobs;
    final nextToken = this.nextToken;
    return {
      if (forecastExportJobs != null) 'ForecastExportJobs': forecastExportJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListForecastsResponse {
  /// An array of objects that summarize each forecast's properties.
  final List<ForecastSummary>? forecasts;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String? nextToken;

  ListForecastsResponse({
    this.forecasts,
    this.nextToken,
  });

  factory ListForecastsResponse.fromJson(Map<String, dynamic> json) {
    return ListForecastsResponse(
      forecasts: (json['Forecasts'] as List?)
          ?.whereNotNull()
          .map((e) => ForecastSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final forecasts = this.forecasts;
    final nextToken = this.nextToken;
    return {
      if (forecasts != null) 'Forecasts': forecasts,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMonitorEvaluationsResponse {
  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request. Tokens
  /// expire after 24 hours.
  final String? nextToken;

  /// The monitoring results and predictor events collected by the monitor
  /// resource during different windows of time.
  ///
  /// For information about monitoring see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/predictor-monitoring-results.html">Viewing
  /// Monitoring Results</a>. For more information about retrieving monitoring
  /// results see <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/predictor-monitoring-results.html">Viewing
  /// Monitoring Results</a>.
  final List<PredictorMonitorEvaluation>? predictorMonitorEvaluations;

  ListMonitorEvaluationsResponse({
    this.nextToken,
    this.predictorMonitorEvaluations,
  });

  factory ListMonitorEvaluationsResponse.fromJson(Map<String, dynamic> json) {
    return ListMonitorEvaluationsResponse(
      nextToken: json['NextToken'] as String?,
      predictorMonitorEvaluations: (json['PredictorMonitorEvaluations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              PredictorMonitorEvaluation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final predictorMonitorEvaluations = this.predictorMonitorEvaluations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (predictorMonitorEvaluations != null)
        'PredictorMonitorEvaluations': predictorMonitorEvaluations,
    };
  }
}

class ListMonitorsResponse {
  /// An array of objects that summarize each monitor's properties.
  final List<MonitorSummary>? monitors;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String? nextToken;

  ListMonitorsResponse({
    this.monitors,
    this.nextToken,
  });

  factory ListMonitorsResponse.fromJson(Map<String, dynamic> json) {
    return ListMonitorsResponse(
      monitors: (json['Monitors'] as List?)
          ?.whereNotNull()
          .map((e) => MonitorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final monitors = this.monitors;
    final nextToken = this.nextToken;
    return {
      if (monitors != null) 'Monitors': monitors,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPredictorBacktestExportJobsResponse {
  /// Returns this token if the response is truncated. To retrieve the next set of
  /// results, use the token in the next request.
  final String? nextToken;

  /// An array of objects that summarize the properties of each predictor backtest
  /// export job.
  final List<PredictorBacktestExportJobSummary>? predictorBacktestExportJobs;

  ListPredictorBacktestExportJobsResponse({
    this.nextToken,
    this.predictorBacktestExportJobs,
  });

  factory ListPredictorBacktestExportJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPredictorBacktestExportJobsResponse(
      nextToken: json['NextToken'] as String?,
      predictorBacktestExportJobs:
          (json['PredictorBacktestExportJobs'] as List?)
              ?.whereNotNull()
              .map((e) => PredictorBacktestExportJobSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final predictorBacktestExportJobs = this.predictorBacktestExportJobs;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (predictorBacktestExportJobs != null)
        'PredictorBacktestExportJobs': predictorBacktestExportJobs,
    };
  }
}

class ListPredictorsResponse {
  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String? nextToken;

  /// An array of objects that summarize each predictor's properties.
  final List<PredictorSummary>? predictors;

  ListPredictorsResponse({
    this.nextToken,
    this.predictors,
  });

  factory ListPredictorsResponse.fromJson(Map<String, dynamic> json) {
    return ListPredictorsResponse(
      nextToken: json['NextToken'] as String?,
      predictors: (json['Predictors'] as List?)
          ?.whereNotNull()
          .map((e) => PredictorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final predictors = this.predictors;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (predictors != null) 'Predictors': predictors,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags for the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListWhatIfAnalysesResponse {
  /// If the response is truncated, Forecast returns this token. To retrieve the
  /// next set of results, use the token in the next request.
  final String? nextToken;

  /// An array of <code>WhatIfAnalysisSummary</code> objects that describe the
  /// matched analyses.
  final List<WhatIfAnalysisSummary>? whatIfAnalyses;

  ListWhatIfAnalysesResponse({
    this.nextToken,
    this.whatIfAnalyses,
  });

  factory ListWhatIfAnalysesResponse.fromJson(Map<String, dynamic> json) {
    return ListWhatIfAnalysesResponse(
      nextToken: json['NextToken'] as String?,
      whatIfAnalyses: (json['WhatIfAnalyses'] as List?)
          ?.whereNotNull()
          .map((e) => WhatIfAnalysisSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final whatIfAnalyses = this.whatIfAnalyses;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (whatIfAnalyses != null) 'WhatIfAnalyses': whatIfAnalyses,
    };
  }
}

class ListWhatIfForecastExportsResponse {
  /// If the response is truncated, Forecast returns this token. To retrieve the
  /// next set of results, use the token in the next request.
  final String? nextToken;

  /// An array of <code>WhatIfForecastExports</code> objects that describe the
  /// matched forecast exports.
  final List<WhatIfForecastExportSummary>? whatIfForecastExports;

  ListWhatIfForecastExportsResponse({
    this.nextToken,
    this.whatIfForecastExports,
  });

  factory ListWhatIfForecastExportsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListWhatIfForecastExportsResponse(
      nextToken: json['NextToken'] as String?,
      whatIfForecastExports: (json['WhatIfForecastExports'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WhatIfForecastExportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final whatIfForecastExports = this.whatIfForecastExports;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (whatIfForecastExports != null)
        'WhatIfForecastExports': whatIfForecastExports,
    };
  }
}

class ListWhatIfForecastsResponse {
  /// If the result of the previous request was truncated, the response includes a
  /// <code>NextToken</code>. To retrieve the next set of results, use the token
  /// in the next&#x2028; request. Tokens expire after 24 hours.
  final String? nextToken;

  /// An array of <code>WhatIfForecasts</code> objects that describe the matched
  /// forecasts.
  final List<WhatIfForecastSummary>? whatIfForecasts;

  ListWhatIfForecastsResponse({
    this.nextToken,
    this.whatIfForecasts,
  });

  factory ListWhatIfForecastsResponse.fromJson(Map<String, dynamic> json) {
    return ListWhatIfForecastsResponse(
      nextToken: json['NextToken'] as String?,
      whatIfForecasts: (json['WhatIfForecasts'] as List?)
          ?.whereNotNull()
          .map((e) => WhatIfForecastSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final whatIfForecasts = this.whatIfForecasts;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (whatIfForecasts != null) 'WhatIfForecasts': whatIfForecasts,
    };
  }
}

/// An individual metric Forecast calculated when monitoring predictor usage.
/// You can compare the value for this metric to the metric's value in the
/// <a>Baseline</a> to see how your predictor's performance is changing.
///
/// For more information about metrics generated by Forecast see <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/metrics.html">Evaluating
/// Predictor Accuracy</a>
class MetricResult {
  /// The name of the metric.
  final String? metricName;

  /// The value for the metric.
  final double? metricValue;

  MetricResult({
    this.metricName,
    this.metricValue,
  });

  factory MetricResult.fromJson(Map<String, dynamic> json) {
    return MetricResult(
      metricName: json['MetricName'] as String?,
      metricValue: json['MetricValue'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final metricValue = this.metricValue;
    return {
      if (metricName != null) 'MetricName': metricName,
      if (metricValue != null) 'MetricValue': metricValue,
    };
  }
}

/// Provides metrics that are used to evaluate the performance of a predictor.
/// This object is part of the <a>WindowSummary</a> object.
class Metrics {
  /// The average value of all weighted quantile losses.
  final double? averageWeightedQuantileLoss;

  /// Provides detailed error metrics for each forecast type. Metrics include
  /// root-mean square-error (RMSE), mean absolute percentage error (MAPE), mean
  /// absolute scaled error (MASE), and weighted average percentage error (WAPE).
  final List<ErrorMetric>? errorMetrics;

  /// The root-mean-square error (RMSE).
  final double? rmse;

  /// An array of weighted quantile losses. Quantiles divide a probability
  /// distribution into regions of equal probability. The distribution in this
  /// case is the loss function.
  final List<WeightedQuantileLoss>? weightedQuantileLosses;

  Metrics({
    this.averageWeightedQuantileLoss,
    this.errorMetrics,
    this.rmse,
    this.weightedQuantileLosses,
  });

  factory Metrics.fromJson(Map<String, dynamic> json) {
    return Metrics(
      averageWeightedQuantileLoss:
          json['AverageWeightedQuantileLoss'] as double?,
      errorMetrics: (json['ErrorMetrics'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      rmse: json['RMSE'] as double?,
      weightedQuantileLosses: (json['WeightedQuantileLosses'] as List?)
          ?.whereNotNull()
          .map((e) => WeightedQuantileLoss.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final averageWeightedQuantileLoss = this.averageWeightedQuantileLoss;
    final errorMetrics = this.errorMetrics;
    final rmse = this.rmse;
    final weightedQuantileLosses = this.weightedQuantileLosses;
    return {
      if (averageWeightedQuantileLoss != null)
        'AverageWeightedQuantileLoss': averageWeightedQuantileLoss,
      if (errorMetrics != null) 'ErrorMetrics': errorMetrics,
      if (rmse != null) 'RMSE': rmse,
      if (weightedQuantileLosses != null)
        'WeightedQuantileLosses': weightedQuantileLosses,
    };
  }
}

/// The configuration details for the predictor monitor.
class MonitorConfig {
  /// The name of the monitor resource.
  final String monitorName;

  MonitorConfig({
    required this.monitorName,
  });

  Map<String, dynamic> toJson() {
    final monitorName = this.monitorName;
    return {
      'MonitorName': monitorName,
    };
  }
}

/// The source of the data the monitor used during the evaluation.
class MonitorDataSource {
  /// The Amazon Resource Name (ARN) of the dataset import job used to import the
  /// data that initiated the monitor evaluation.
  final String? datasetImportJobArn;

  /// The Amazon Resource Name (ARN) of the forecast the monitor used during the
  /// evaluation.
  final String? forecastArn;

  /// The Amazon Resource Name (ARN) of the predictor resource you are monitoring.
  final String? predictorArn;

  MonitorDataSource({
    this.datasetImportJobArn,
    this.forecastArn,
    this.predictorArn,
  });

  factory MonitorDataSource.fromJson(Map<String, dynamic> json) {
    return MonitorDataSource(
      datasetImportJobArn: json['DatasetImportJobArn'] as String?,
      forecastArn: json['ForecastArn'] as String?,
      predictorArn: json['PredictorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetImportJobArn = this.datasetImportJobArn;
    final forecastArn = this.forecastArn;
    final predictorArn = this.predictorArn;
    return {
      if (datasetImportJobArn != null)
        'DatasetImportJobArn': datasetImportJobArn,
      if (forecastArn != null) 'ForecastArn': forecastArn,
      if (predictorArn != null) 'PredictorArn': predictorArn,
    };
  }
}

/// Provides information about the monitor resource.
class MonitorInfo {
  /// The Amazon Resource Name (ARN) of the monitor resource.
  final String? monitorArn;

  /// The status of the monitor. States include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>ACTIVE_STOPPING</code>, <code>ACTIVE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>UPDATE_IN_PROGRESS</code>
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
  final String? status;

  MonitorInfo({
    this.monitorArn,
    this.status,
  });

  factory MonitorInfo.fromJson(Map<String, dynamic> json) {
    return MonitorInfo(
      monitorArn: json['MonitorArn'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final monitorArn = this.monitorArn;
    final status = this.status;
    return {
      if (monitorArn != null) 'MonitorArn': monitorArn,
      if (status != null) 'Status': status,
    };
  }
}

/// Provides a summary of the monitor properties used in the <a>ListMonitors</a>
/// operation. To get a complete set of properties, call the
/// <a>DescribeMonitor</a> operation, and provide the listed
/// <code>MonitorArn</code>.
class MonitorSummary {
  /// When the monitor resource was created.
  final DateTime? creationTime;

  /// The last time the monitor resource was modified. The timestamp depends on
  /// the status of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>STOPPED</code> - When the resource stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the monitor
  /// creation finished or failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// The Amazon Resource Name (ARN) of the monitor resource.
  final String? monitorArn;

  /// The name of the monitor resource.
  final String? monitorName;

  /// The Amazon Resource Name (ARN) of the predictor being monitored.
  final String? resourceArn;

  /// The status of the monitor. States include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>ACTIVE_STOPPING</code>, <code>ACTIVE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>UPDATE_IN_PROGRESS</code>
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
  final String? status;

  MonitorSummary({
    this.creationTime,
    this.lastModificationTime,
    this.monitorArn,
    this.monitorName,
    this.resourceArn,
    this.status,
  });

  factory MonitorSummary.fromJson(Map<String, dynamic> json) {
    return MonitorSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      monitorArn: json['MonitorArn'] as String?,
      monitorName: json['MonitorName'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    final monitorArn = this.monitorArn;
    final monitorName = this.monitorName;
    final resourceArn = this.resourceArn;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (monitorArn != null) 'MonitorArn': monitorArn,
      if (monitorName != null) 'MonitorName': monitorName,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (status != null) 'Status': status,
    };
  }
}

enum Month {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december,
}

extension MonthValueExtension on Month {
  String toValue() {
    switch (this) {
      case Month.january:
        return 'JANUARY';
      case Month.february:
        return 'FEBRUARY';
      case Month.march:
        return 'MARCH';
      case Month.april:
        return 'APRIL';
      case Month.may:
        return 'MAY';
      case Month.june:
        return 'JUNE';
      case Month.july:
        return 'JULY';
      case Month.august:
        return 'AUGUST';
      case Month.september:
        return 'SEPTEMBER';
      case Month.october:
        return 'OCTOBER';
      case Month.november:
        return 'NOVEMBER';
      case Month.december:
        return 'DECEMBER';
    }
  }
}

extension MonthFromString on String {
  Month toMonth() {
    switch (this) {
      case 'JANUARY':
        return Month.january;
      case 'FEBRUARY':
        return Month.february;
      case 'MARCH':
        return Month.march;
      case 'APRIL':
        return Month.april;
      case 'MAY':
        return Month.may;
      case 'JUNE':
        return Month.june;
      case 'JULY':
        return Month.july;
      case 'AUGUST':
        return Month.august;
      case 'SEPTEMBER':
        return Month.september;
      case 'OCTOBER':
        return Month.october;
      case 'NOVEMBER':
        return Month.november;
      case 'DECEMBER':
        return Month.december;
    }
    throw Exception('$this is not known in enum Month');
  }
}

enum Operation {
  add,
  subtract,
  multiply,
  divide,
}

extension OperationValueExtension on Operation {
  String toValue() {
    switch (this) {
      case Operation.add:
        return 'ADD';
      case Operation.subtract:
        return 'SUBTRACT';
      case Operation.multiply:
        return 'MULTIPLY';
      case Operation.divide:
        return 'DIVIDE';
    }
  }
}

extension OperationFromString on String {
  Operation toOperation() {
    switch (this) {
      case 'ADD':
        return Operation.add;
      case 'SUBTRACT':
        return Operation.subtract;
      case 'MULTIPLY':
        return Operation.multiply;
      case 'DIVIDE':
        return Operation.divide;
    }
    throw Exception('$this is not known in enum Operation');
  }
}

enum OptimizationMetric {
  wape,
  rmse,
  averageWeightedQuantileLoss,
  mase,
  mape,
}

extension OptimizationMetricValueExtension on OptimizationMetric {
  String toValue() {
    switch (this) {
      case OptimizationMetric.wape:
        return 'WAPE';
      case OptimizationMetric.rmse:
        return 'RMSE';
      case OptimizationMetric.averageWeightedQuantileLoss:
        return 'AverageWeightedQuantileLoss';
      case OptimizationMetric.mase:
        return 'MASE';
      case OptimizationMetric.mape:
        return 'MAPE';
    }
  }
}

extension OptimizationMetricFromString on String {
  OptimizationMetric toOptimizationMetric() {
    switch (this) {
      case 'WAPE':
        return OptimizationMetric.wape;
      case 'RMSE':
        return OptimizationMetric.rmse;
      case 'AverageWeightedQuantileLoss':
        return OptimizationMetric.averageWeightedQuantileLoss;
      case 'MASE':
        return OptimizationMetric.mase;
      case 'MAPE':
        return OptimizationMetric.mape;
    }
    throw Exception('$this is not known in enum OptimizationMetric');
  }
}

/// Specifies the categorical, continuous, and integer hyperparameters, and
/// their ranges of tunable values. The range of tunable values determines which
/// values that a hyperparameter tuning job can choose for the specified
/// hyperparameter. This object is part of the
/// <a>HyperParameterTuningJobConfig</a> object.
class ParameterRanges {
  /// Specifies the tunable range for each categorical hyperparameter.
  final List<CategoricalParameterRange>? categoricalParameterRanges;

  /// Specifies the tunable range for each continuous hyperparameter.
  final List<ContinuousParameterRange>? continuousParameterRanges;

  /// Specifies the tunable range for each integer hyperparameter.
  final List<IntegerParameterRange>? integerParameterRanges;

  ParameterRanges({
    this.categoricalParameterRanges,
    this.continuousParameterRanges,
    this.integerParameterRanges,
  });

  factory ParameterRanges.fromJson(Map<String, dynamic> json) {
    return ParameterRanges(
      categoricalParameterRanges: (json['CategoricalParameterRanges'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CategoricalParameterRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      continuousParameterRanges: (json['ContinuousParameterRanges'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ContinuousParameterRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      integerParameterRanges: (json['IntegerParameterRanges'] as List?)
          ?.whereNotNull()
          .map((e) => IntegerParameterRange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final categoricalParameterRanges = this.categoricalParameterRanges;
    final continuousParameterRanges = this.continuousParameterRanges;
    final integerParameterRanges = this.integerParameterRanges;
    return {
      if (categoricalParameterRanges != null)
        'CategoricalParameterRanges': categoricalParameterRanges,
      if (continuousParameterRanges != null)
        'ContinuousParameterRanges': continuousParameterRanges,
      if (integerParameterRanges != null)
        'IntegerParameterRanges': integerParameterRanges,
    };
  }
}

/// Provides a summary of the predictor backtest export job properties used in
/// the <a>ListPredictorBacktestExportJobs</a> operation. To get a complete set
/// of properties, call the <a>DescribePredictorBacktestExportJob</a> operation,
/// and provide the listed <code>PredictorBacktestExportJobArn</code>.
class PredictorBacktestExportJobSummary {
  /// When the predictor backtest export job was created.
  final DateTime? creationTime;
  final DataDestination? destination;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// Information about any errors that may have occurred during the backtest
  /// export.
  final String? message;

  /// The Amazon Resource Name (ARN) of the predictor backtest export job.
  final String? predictorBacktestExportJobArn;

  /// The name of the predictor backtest export job.
  final String? predictorBacktestExportJobName;

  /// The status of the predictor backtest export job. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul>
  final String? status;

  PredictorBacktestExportJobSummary({
    this.creationTime,
    this.destination,
    this.lastModificationTime,
    this.message,
    this.predictorBacktestExportJobArn,
    this.predictorBacktestExportJobName,
    this.status,
  });

  factory PredictorBacktestExportJobSummary.fromJson(
      Map<String, dynamic> json) {
    return PredictorBacktestExportJobSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      destination: json['Destination'] != null
          ? DataDestination.fromJson(
              json['Destination'] as Map<String, dynamic>)
          : null,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      predictorBacktestExportJobArn:
          json['PredictorBacktestExportJobArn'] as String?,
      predictorBacktestExportJobName:
          json['PredictorBacktestExportJobName'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destination = this.destination;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final predictorBacktestExportJobArn = this.predictorBacktestExportJobArn;
    final predictorBacktestExportJobName = this.predictorBacktestExportJobName;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (destination != null) 'Destination': destination,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (predictorBacktestExportJobArn != null)
        'PredictorBacktestExportJobArn': predictorBacktestExportJobArn,
      if (predictorBacktestExportJobName != null)
        'PredictorBacktestExportJobName': predictorBacktestExportJobName,
      if (status != null) 'Status': status,
    };
  }
}

/// Metrics you can use as a baseline for comparison purposes. Use these metrics
/// when you interpret monitoring results for an auto predictor.
class PredictorBaseline {
  /// The initial <a
  /// href="https://docs.aws.amazon.com/forecast/latest/dg/metrics.html">accuracy
  /// metrics</a> for the predictor. Use these metrics as a baseline for
  /// comparison purposes as you use your predictor and the metrics change.
  final List<BaselineMetric>? baselineMetrics;

  PredictorBaseline({
    this.baselineMetrics,
  });

  factory PredictorBaseline.fromJson(Map<String, dynamic> json) {
    return PredictorBaseline(
      baselineMetrics: (json['BaselineMetrics'] as List?)
          ?.whereNotNull()
          .map((e) => BaselineMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final baselineMetrics = this.baselineMetrics;
    return {
      if (baselineMetrics != null) 'BaselineMetrics': baselineMetrics,
    };
  }
}

/// Provides details about a predictor event, such as a retraining.
class PredictorEvent {
  /// The timestamp for when the event occurred.
  final DateTime? datetime;

  /// The type of event. For example, <code>Retrain</code>. A retraining event
  /// denotes the timepoint when a predictor was retrained. Any monitor results
  /// from before the <code>Datetime</code> are from the previous predictor. Any
  /// new metrics are for the newly retrained predictor.
  final String? detail;

  PredictorEvent({
    this.datetime,
    this.detail,
  });

  factory PredictorEvent.fromJson(Map<String, dynamic> json) {
    return PredictorEvent(
      datetime: timeStampFromJson(json['Datetime']),
      detail: json['Detail'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datetime = this.datetime;
    final detail = this.detail;
    return {
      if (datetime != null) 'Datetime': unixTimestampToJson(datetime),
      if (detail != null) 'Detail': detail,
    };
  }
}

/// The algorithm used to perform a backtest and the status of those tests.
class PredictorExecution {
  /// The ARN of the algorithm used to test the predictor.
  final String? algorithmArn;

  /// An array of test windows used to evaluate the algorithm. The
  /// <code>NumberOfBacktestWindows</code> from the object determines the number
  /// of windows in the array.
  final List<TestWindowSummary>? testWindows;

  PredictorExecution({
    this.algorithmArn,
    this.testWindows,
  });

  factory PredictorExecution.fromJson(Map<String, dynamic> json) {
    return PredictorExecution(
      algorithmArn: json['AlgorithmArn'] as String?,
      testWindows: (json['TestWindows'] as List?)
          ?.whereNotNull()
          .map((e) => TestWindowSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmArn = this.algorithmArn;
    final testWindows = this.testWindows;
    return {
      if (algorithmArn != null) 'AlgorithmArn': algorithmArn,
      if (testWindows != null) 'TestWindows': testWindows,
    };
  }
}

/// Contains details on the backtests performed to evaluate the accuracy of the
/// predictor. The tests are returned in descending order of accuracy, with the
/// most accurate backtest appearing first. You specify the number of backtests
/// to perform when you call the operation.
class PredictorExecutionDetails {
  /// An array of the backtests performed to evaluate the accuracy of the
  /// predictor against a particular algorithm. The
  /// <code>NumberOfBacktestWindows</code> from the object determines the number
  /// of windows in the array.
  final List<PredictorExecution>? predictorExecutions;

  PredictorExecutionDetails({
    this.predictorExecutions,
  });

  factory PredictorExecutionDetails.fromJson(Map<String, dynamic> json) {
    return PredictorExecutionDetails(
      predictorExecutions: (json['PredictorExecutions'] as List?)
          ?.whereNotNull()
          .map((e) => PredictorExecution.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final predictorExecutions = this.predictorExecutions;
    return {
      if (predictorExecutions != null)
        'PredictorExecutions': predictorExecutions,
    };
  }
}

/// Describes the results of a monitor evaluation.
class PredictorMonitorEvaluation {
  /// The status of the monitor evaluation. The state can be <code>SUCCESS</code>
  /// or <code>FAILURE</code>.
  final String? evaluationState;

  /// The timestamp that indicates when the monitor evaluation was started.
  final DateTime? evaluationTime;

  /// Information about any errors that may have occurred during the monitor
  /// evaluation.
  final String? message;

  /// A list of metrics Forecast calculated when monitoring a predictor. You can
  /// compare the value for each metric in the list to the metric's value in the
  /// <a>Baseline</a> to see how your predictor's performance is changing.
  final List<MetricResult>? metricResults;

  /// The Amazon Resource Name (ARN) of the monitor resource.
  final String? monitorArn;

  /// The source of the data the monitor resource used during the evaluation.
  final MonitorDataSource? monitorDataSource;

  /// The number of items considered during the evaluation.
  final int? numItemsEvaluated;

  /// Provides details about a predictor event, such as a retraining.
  final PredictorEvent? predictorEvent;

  /// The Amazon Resource Name (ARN) of the resource to monitor.
  final String? resourceArn;

  /// The timestamp that indicates the end of the window that is used for monitor
  /// evaluation.
  final DateTime? windowEndDatetime;

  /// The timestamp that indicates the start of the window that is used for
  /// monitor evaluation.
  final DateTime? windowStartDatetime;

  PredictorMonitorEvaluation({
    this.evaluationState,
    this.evaluationTime,
    this.message,
    this.metricResults,
    this.monitorArn,
    this.monitorDataSource,
    this.numItemsEvaluated,
    this.predictorEvent,
    this.resourceArn,
    this.windowEndDatetime,
    this.windowStartDatetime,
  });

  factory PredictorMonitorEvaluation.fromJson(Map<String, dynamic> json) {
    return PredictorMonitorEvaluation(
      evaluationState: json['EvaluationState'] as String?,
      evaluationTime: timeStampFromJson(json['EvaluationTime']),
      message: json['Message'] as String?,
      metricResults: (json['MetricResults'] as List?)
          ?.whereNotNull()
          .map((e) => MetricResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      monitorArn: json['MonitorArn'] as String?,
      monitorDataSource: json['MonitorDataSource'] != null
          ? MonitorDataSource.fromJson(
              json['MonitorDataSource'] as Map<String, dynamic>)
          : null,
      numItemsEvaluated: json['NumItemsEvaluated'] as int?,
      predictorEvent: json['PredictorEvent'] != null
          ? PredictorEvent.fromJson(
              json['PredictorEvent'] as Map<String, dynamic>)
          : null,
      resourceArn: json['ResourceArn'] as String?,
      windowEndDatetime: timeStampFromJson(json['WindowEndDatetime']),
      windowStartDatetime: timeStampFromJson(json['WindowStartDatetime']),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationState = this.evaluationState;
    final evaluationTime = this.evaluationTime;
    final message = this.message;
    final metricResults = this.metricResults;
    final monitorArn = this.monitorArn;
    final monitorDataSource = this.monitorDataSource;
    final numItemsEvaluated = this.numItemsEvaluated;
    final predictorEvent = this.predictorEvent;
    final resourceArn = this.resourceArn;
    final windowEndDatetime = this.windowEndDatetime;
    final windowStartDatetime = this.windowStartDatetime;
    return {
      if (evaluationState != null) 'EvaluationState': evaluationState,
      if (evaluationTime != null)
        'EvaluationTime': unixTimestampToJson(evaluationTime),
      if (message != null) 'Message': message,
      if (metricResults != null) 'MetricResults': metricResults,
      if (monitorArn != null) 'MonitorArn': monitorArn,
      if (monitorDataSource != null) 'MonitorDataSource': monitorDataSource,
      if (numItemsEvaluated != null) 'NumItemsEvaluated': numItemsEvaluated,
      if (predictorEvent != null) 'PredictorEvent': predictorEvent,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (windowEndDatetime != null)
        'WindowEndDatetime': unixTimestampToJson(windowEndDatetime),
      if (windowStartDatetime != null)
        'WindowStartDatetime': unixTimestampToJson(windowStartDatetime),
    };
  }
}

/// Provides a summary of the predictor properties that are used in the
/// <a>ListPredictors</a> operation. To get the complete set of properties, call
/// the <a>DescribePredictor</a> operation, and provide the listed
/// <code>PredictorArn</code>.
class PredictorSummary {
  /// When the model training task was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the dataset group that contains the data
  /// used to train the predictor.
  final String? datasetGroupArn;

  /// Whether AutoPredictor was used to create the predictor.
  final bool? isAutoPredictor;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

  /// The ARN of the predictor.
  final String? predictorArn;

  /// The name of the predictor.
  final String? predictorName;

  /// A summary of the reference predictor used if the predictor was retrained or
  /// upgraded.
  final ReferencePredictorSummary? referencePredictorSummary;

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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the predictor must be <code>ACTIVE</code> before
  /// you can use the predictor to create a forecast.
  /// </note>
  final String? status;

  PredictorSummary({
    this.creationTime,
    this.datasetGroupArn,
    this.isAutoPredictor,
    this.lastModificationTime,
    this.message,
    this.predictorArn,
    this.predictorName,
    this.referencePredictorSummary,
    this.status,
  });

  factory PredictorSummary.fromJson(Map<String, dynamic> json) {
    return PredictorSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      datasetGroupArn: json['DatasetGroupArn'] as String?,
      isAutoPredictor: json['IsAutoPredictor'] as bool?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      predictorArn: json['PredictorArn'] as String?,
      predictorName: json['PredictorName'] as String?,
      referencePredictorSummary: json['ReferencePredictorSummary'] != null
          ? ReferencePredictorSummary.fromJson(
              json['ReferencePredictorSummary'] as Map<String, dynamic>)
          : null,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final datasetGroupArn = this.datasetGroupArn;
    final isAutoPredictor = this.isAutoPredictor;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final predictorArn = this.predictorArn;
    final predictorName = this.predictorName;
    final referencePredictorSummary = this.referencePredictorSummary;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (datasetGroupArn != null) 'DatasetGroupArn': datasetGroupArn,
      if (isAutoPredictor != null) 'IsAutoPredictor': isAutoPredictor,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (predictorArn != null) 'PredictorArn': predictorArn,
      if (predictorName != null) 'PredictorName': predictorName,
      if (referencePredictorSummary != null)
        'ReferencePredictorSummary': referencePredictorSummary,
      if (status != null) 'Status': status,
    };
  }
}

/// Provides a summary of the reference predictor used when retraining or
/// upgrading a predictor.
class ReferencePredictorSummary {
  /// The ARN of the reference predictor.
  final String? arn;

  /// Whether the reference predictor is <code>Active</code> or
  /// <code>Deleted</code>.
  final State? state;

  ReferencePredictorSummary({
    this.arn,
    this.state,
  });

  factory ReferencePredictorSummary.fromJson(Map<String, dynamic> json) {
    return ReferencePredictorSummary(
      arn: json['Arn'] as String?,
      state: (json['State'] as String?)?.toState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// The path to the file(s) in an Amazon Simple Storage Service (Amazon S3)
/// bucket, and an Identity and Access Management (IAM) role that Amazon
/// Forecast can assume to access the file(s). Optionally, includes an Key
/// Management Service (KMS) key. This object is part of the <a>DataSource</a>
/// object that is submitted in the <a>CreateDatasetImportJob</a> request, and
/// part of the <a>DataDestination</a> object.
class S3Config {
  /// The path to an Amazon Simple Storage Service (Amazon S3) bucket or file(s)
  /// in an Amazon S3 bucket.
  final String path;

  /// The ARN of the Identity and Access Management (IAM) role that Amazon
  /// Forecast can assume to access the Amazon S3 bucket or files. If you provide
  /// a value for the <code>KMSKeyArn</code> key, the role must allow access to
  /// the key.
  ///
  /// Passing a role across Amazon Web Services accounts is not allowed. If you
  /// pass a role that isn't in your account, you get an
  /// <code>InvalidInputException</code> error.
  final String roleArn;

  /// The Amazon Resource Name (ARN) of an Key Management Service (KMS) key.
  final String? kMSKeyArn;

  S3Config({
    required this.path,
    required this.roleArn,
    this.kMSKeyArn,
  });

  factory S3Config.fromJson(Map<String, dynamic> json) {
    return S3Config(
      path: json['Path'] as String,
      roleArn: json['RoleArn'] as String,
      kMSKeyArn: json['KMSKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final roleArn = this.roleArn;
    final kMSKeyArn = this.kMSKeyArn;
    return {
      'Path': path,
      'RoleArn': roleArn,
      if (kMSKeyArn != null) 'KMSKeyArn': kMSKeyArn,
    };
  }
}

enum ScalingType {
  auto,
  linear,
  logarithmic,
  reverseLogarithmic,
}

extension ScalingTypeValueExtension on ScalingType {
  String toValue() {
    switch (this) {
      case ScalingType.auto:
        return 'Auto';
      case ScalingType.linear:
        return 'Linear';
      case ScalingType.logarithmic:
        return 'Logarithmic';
      case ScalingType.reverseLogarithmic:
        return 'ReverseLogarithmic';
    }
  }
}

extension ScalingTypeFromString on String {
  ScalingType toScalingType() {
    switch (this) {
      case 'Auto':
        return ScalingType.auto;
      case 'Linear':
        return ScalingType.linear;
      case 'Logarithmic':
        return ScalingType.logarithmic;
      case 'ReverseLogarithmic':
        return ScalingType.reverseLogarithmic;
    }
    throw Exception('$this is not known in enum ScalingType');
  }
}

/// Defines the fields of a dataset.
class Schema {
  /// An array of attributes specifying the name and type of each field in a
  /// dataset.
  final List<SchemaAttribute>? attributes;

  Schema({
    this.attributes,
  });

  factory Schema.fromJson(Map<String, dynamic> json) {
    return Schema(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => SchemaAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// An attribute of a schema, which defines a dataset field. A schema attribute
/// is required for every field in a dataset. The <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/API_Schema.html">Schema</a>
/// object contains an array of <code>SchemaAttribute</code> objects.
class SchemaAttribute {
  /// The name of the dataset field.
  final String? attributeName;

  /// The data type of the field.
  ///
  /// For a related time series dataset, other than date, item_id, and forecast
  /// dimensions attributes, all attributes should be of numerical type
  /// (integer/float).
  final AttributeType? attributeType;

  SchemaAttribute({
    this.attributeName,
    this.attributeType,
  });

  factory SchemaAttribute.fromJson(Map<String, dynamic> json) {
    return SchemaAttribute(
      attributeName: json['AttributeName'] as String?,
      attributeType: (json['AttributeType'] as String?)?.toAttributeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final attributeType = this.attributeType;
    return {
      if (attributeName != null) 'AttributeName': attributeName,
      if (attributeType != null) 'AttributeType': attributeType.toValue(),
    };
  }
}

enum State {
  active,
  deleted,
}

extension StateValueExtension on State {
  String toValue() {
    switch (this) {
      case State.active:
        return 'Active';
      case State.deleted:
        return 'Deleted';
    }
  }
}

extension StateFromString on String {
  State toState() {
    switch (this) {
      case 'Active':
        return State.active;
      case 'Deleted':
        return State.deleted;
    }
    throw Exception('$this is not known in enum State');
  }
}

/// Provides statistics for each data field imported into to an Amazon Forecast
/// dataset with the <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html">CreateDatasetImportJob</a>
/// operation.
class Statistics {
  /// For a numeric field, the average value in the field.
  final double? avg;

  /// The number of values in the field. If the response value is -1, refer to
  /// <code>CountLong</code>.
  final int? count;

  /// The number of distinct values in the field. If the response value is -1,
  /// refer to <code>CountDistinctLong</code>.
  final int? countDistinct;

  /// The number of distinct values in the field. <code>CountDistinctLong</code>
  /// is used instead of <code>CountDistinct</code> if the value is greater than
  /// 2,147,483,647.
  final int? countDistinctLong;

  /// The number of values in the field. <code>CountLong</code> is used instead of
  /// <code>Count</code> if the value is greater than 2,147,483,647.
  final int? countLong;

  /// The number of NAN (not a number) values in the field. If the response value
  /// is -1, refer to <code>CountNanLong</code>.
  final int? countNan;

  /// The number of NAN (not a number) values in the field.
  /// <code>CountNanLong</code> is used instead of <code>CountNan</code> if the
  /// value is greater than 2,147,483,647.
  final int? countNanLong;

  /// The number of null values in the field. If the response value is -1, refer
  /// to <code>CountNullLong</code>.
  final int? countNull;

  /// The number of null values in the field. <code>CountNullLong</code> is used
  /// instead of <code>CountNull</code> if the value is greater than
  /// 2,147,483,647.
  final int? countNullLong;

  /// For a numeric field, the maximum value in the field.
  final String? max;

  /// For a numeric field, the minimum value in the field.
  final String? min;

  /// For a numeric field, the standard deviation.
  final double? stddev;

  Statistics({
    this.avg,
    this.count,
    this.countDistinct,
    this.countDistinctLong,
    this.countLong,
    this.countNan,
    this.countNanLong,
    this.countNull,
    this.countNullLong,
    this.max,
    this.min,
    this.stddev,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      avg: json['Avg'] as double?,
      count: json['Count'] as int?,
      countDistinct: json['CountDistinct'] as int?,
      countDistinctLong: json['CountDistinctLong'] as int?,
      countLong: json['CountLong'] as int?,
      countNan: json['CountNan'] as int?,
      countNanLong: json['CountNanLong'] as int?,
      countNull: json['CountNull'] as int?,
      countNullLong: json['CountNullLong'] as int?,
      max: json['Max'] as String?,
      min: json['Min'] as String?,
      stddev: json['Stddev'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final avg = this.avg;
    final count = this.count;
    final countDistinct = this.countDistinct;
    final countDistinctLong = this.countDistinctLong;
    final countLong = this.countLong;
    final countNan = this.countNan;
    final countNanLong = this.countNanLong;
    final countNull = this.countNull;
    final countNullLong = this.countNullLong;
    final max = this.max;
    final min = this.min;
    final stddev = this.stddev;
    return {
      if (avg != null) 'Avg': avg,
      if (count != null) 'Count': count,
      if (countDistinct != null) 'CountDistinct': countDistinct,
      if (countDistinctLong != null) 'CountDistinctLong': countDistinctLong,
      if (countLong != null) 'CountLong': countLong,
      if (countNan != null) 'CountNan': countNan,
      if (countNanLong != null) 'CountNanLong': countNanLong,
      if (countNull != null) 'CountNull': countNull,
      if (countNullLong != null) 'CountNullLong': countNullLong,
      if (max != null) 'Max': max,
      if (min != null) 'Min': min,
      if (stddev != null) 'Stddev': stddev,
    };
  }
}

/// <note>
/// This object belongs to the <a>CreatePredictor</a> operation. If you created
/// your predictor with <a>CreateAutoPredictor</a>, see
/// <a>AdditionalDataset</a>.
/// </note>
/// Describes a supplementary feature of a dataset group. This object is part of
/// the <a>InputDataConfig</a> object. Forecast supports the Weather Index and
/// Holidays built-in featurizations.
///
/// <b>Weather Index</b>
///
/// The Amazon Forecast Weather Index is a built-in featurization that
/// incorporates historical and projected weather information into your model.
/// The Weather Index supplements your datasets with over two years of
/// historical weather data and up to 14 days of projected weather data. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/weather.html">Amazon
/// Forecast Weather Index</a>.
///
/// <b>Holidays</b>
///
/// Holidays is a built-in featurization that incorporates a feature-engineered
/// dataset of national holiday information into your model. It provides native
/// support for the holiday calendars of 66 countries. To view the holiday
/// calendars, refer to the <a
/// href="http://jollyday.sourceforge.net/data.html">Jollyday</a> library. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/holidays.html">Holidays
/// Featurization</a>.
class SupplementaryFeature {
  /// The name of the feature. Valid values: <code>"holiday"</code> and
  /// <code>"weather"</code>.
  final String name;

  /// <b>Weather Index</b>
  ///
  /// To enable the Weather Index, set the value to <code>"true"</code>
  ///
  /// <b>Holidays</b>
  ///
  /// To enable Holidays, specify a country with one of the following two-letter
  /// country codes:
  ///
  /// <ul>
  /// <li>
  /// "AL" - ALBANIA
  /// </li>
  /// <li>
  /// "AR" - ARGENTINA
  /// </li>
  /// <li>
  /// "AT" - AUSTRIA
  /// </li>
  /// <li>
  /// "AU" - AUSTRALIA
  /// </li>
  /// <li>
  /// "BA" - BOSNIA HERZEGOVINA
  /// </li>
  /// <li>
  /// "BE" - BELGIUM
  /// </li>
  /// <li>
  /// "BG" - BULGARIA
  /// </li>
  /// <li>
  /// "BO" - BOLIVIA
  /// </li>
  /// <li>
  /// "BR" - BRAZIL
  /// </li>
  /// <li>
  /// "BY" - BELARUS
  /// </li>
  /// <li>
  /// "CA" - CANADA
  /// </li>
  /// <li>
  /// "CL" - CHILE
  /// </li>
  /// <li>
  /// "CO" - COLOMBIA
  /// </li>
  /// <li>
  /// "CR" - COSTA RICA
  /// </li>
  /// <li>
  /// "HR" - CROATIA
  /// </li>
  /// <li>
  /// "CZ" - CZECH REPUBLIC
  /// </li>
  /// <li>
  /// "DK" - DENMARK
  /// </li>
  /// <li>
  /// "EC" - ECUADOR
  /// </li>
  /// <li>
  /// "EE" - ESTONIA
  /// </li>
  /// <li>
  /// "ET" - ETHIOPIA
  /// </li>
  /// <li>
  /// "FI" - FINLAND
  /// </li>
  /// <li>
  /// "FR" - FRANCE
  /// </li>
  /// <li>
  /// "DE" - GERMANY
  /// </li>
  /// <li>
  /// "GR" - GREECE
  /// </li>
  /// <li>
  /// "HU" - HUNGARY
  /// </li>
  /// <li>
  /// "IS" - ICELAND
  /// </li>
  /// <li>
  /// "IN" - INDIA
  /// </li>
  /// <li>
  /// "IE" - IRELAND
  /// </li>
  /// <li>
  /// "IT" - ITALY
  /// </li>
  /// <li>
  /// "JP" - JAPAN
  /// </li>
  /// <li>
  /// "KZ" - KAZAKHSTAN
  /// </li>
  /// <li>
  /// "KR" - KOREA
  /// </li>
  /// <li>
  /// "LV" - LATVIA
  /// </li>
  /// <li>
  /// "LI" - LIECHTENSTEIN
  /// </li>
  /// <li>
  /// "LT" - LITHUANIA
  /// </li>
  /// <li>
  /// "LU" - LUXEMBOURG
  /// </li>
  /// <li>
  /// "MK" - MACEDONIA
  /// </li>
  /// <li>
  /// "MT" - MALTA
  /// </li>
  /// <li>
  /// "MX" - MEXICO
  /// </li>
  /// <li>
  /// "MD" - MOLDOVA
  /// </li>
  /// <li>
  /// "ME" - MONTENEGRO
  /// </li>
  /// <li>
  /// "NL" - NETHERLANDS
  /// </li>
  /// <li>
  /// "NZ" - NEW ZEALAND
  /// </li>
  /// <li>
  /// "NI" - NICARAGUA
  /// </li>
  /// <li>
  /// "NG" - NIGERIA
  /// </li>
  /// <li>
  /// "NO" - NORWAY
  /// </li>
  /// <li>
  /// "PA" - PANAMA
  /// </li>
  /// <li>
  /// "PY" - PARAGUAY
  /// </li>
  /// <li>
  /// "PE" - PERU
  /// </li>
  /// <li>
  /// "PL" - POLAND
  /// </li>
  /// <li>
  /// "PT" - PORTUGAL
  /// </li>
  /// <li>
  /// "RO" - ROMANIA
  /// </li>
  /// <li>
  /// "RU" - RUSSIA
  /// </li>
  /// <li>
  /// "RS" - SERBIA
  /// </li>
  /// <li>
  /// "SK" - SLOVAKIA
  /// </li>
  /// <li>
  /// "SI" - SLOVENIA
  /// </li>
  /// <li>
  /// "ZA" - SOUTH AFRICA
  /// </li>
  /// <li>
  /// "ES" - SPAIN
  /// </li>
  /// <li>
  /// "SE" - SWEDEN
  /// </li>
  /// <li>
  /// "CH" - SWITZERLAND
  /// </li>
  /// <li>
  /// "UA" - UKRAINE
  /// </li>
  /// <li>
  /// "AE" - UNITED ARAB EMIRATES
  /// </li>
  /// <li>
  /// "US" - UNITED STATES
  /// </li>
  /// <li>
  /// "UK" - UNITED KINGDOM
  /// </li>
  /// <li>
  /// "UY" - URUGUAY
  /// </li>
  /// <li>
  /// "VE" - VENEZUELA
  /// </li>
  /// </ul>
  final String value;

  SupplementaryFeature({
    required this.name,
    required this.value,
  });

  factory SupplementaryFeature.fromJson(Map<String, dynamic> json) {
    return SupplementaryFeature(
      name: json['Name'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// The optional metadata that you apply to a resource to help you categorize
/// and organize them. Each tag consists of a key and an optional value, both of
/// which you define.
///
/// The following basic restrictions apply to tags:
///
/// <ul>
/// <li>
/// Maximum number of tags per resource - 50.
/// </li>
/// <li>
/// For each resource, each tag key must be unique, and each tag key can have
/// only one value.
/// </li>
/// <li>
/// Maximum key length - 128 Unicode characters in UTF-8.
/// </li>
/// <li>
/// Maximum value length - 256 Unicode characters in UTF-8.
/// </li>
/// <li>
/// If your tagging schema is used across multiple services and resources,
/// remember that other services may have restrictions on allowed characters.
/// Generally allowed characters are: letters, numbers, and spaces representable
/// in UTF-8, and the following characters: + - = . _ : / @.
/// </li>
/// <li>
/// Tag keys and values are case sensitive.
/// </li>
/// <li>
/// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
/// combination of such as a prefix for keys as it is reserved for Amazon Web
/// Services use. You cannot edit or delete tag keys with this prefix. Values
/// can have this prefix. If a tag value has <code>aws</code> as its prefix but
/// the key does not, then Forecast considers it to be a user tag and will count
/// against the limit of 50 tags. Tags with only the key prefix of
/// <code>aws</code> do not count against your tags per resource limit.
/// </li>
/// </ul>
class Tag {
  /// One part of a key-value pair that makes up a tag. A <code>key</code> is a
  /// general label that acts like a category for more specific tag values.
  final String key;

  /// The optional part of a key-value pair that makes up a tag. A
  /// <code>value</code> acts as a descriptor within a tag category (key).
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
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

/// The status, start time, and end time of a backtest, as well as a failure
/// reason if applicable.
class TestWindowSummary {
  /// If the test failed, the reason why it failed.
  final String? message;

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
  final String? status;

  /// The time at which the test ended.
  final DateTime? testWindowEnd;

  /// The time at which the test began.
  final DateTime? testWindowStart;

  TestWindowSummary({
    this.message,
    this.status,
    this.testWindowEnd,
    this.testWindowStart,
  });

  factory TestWindowSummary.fromJson(Map<String, dynamic> json) {
    return TestWindowSummary(
      message: json['Message'] as String?,
      status: json['Status'] as String?,
      testWindowEnd: timeStampFromJson(json['TestWindowEnd']),
      testWindowStart: timeStampFromJson(json['TestWindowStart']),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final status = this.status;
    final testWindowEnd = this.testWindowEnd;
    final testWindowStart = this.testWindowStart;
    return {
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
      if (testWindowEnd != null)
        'TestWindowEnd': unixTimestampToJson(testWindowEnd),
      if (testWindowStart != null)
        'TestWindowStart': unixTimestampToJson(testWindowStart),
    };
  }
}

/// The time boundary Forecast uses to align and aggregate your data to match
/// your forecast frequency. Provide the unit of time and the time boundary as a
/// key value pair. If you don't provide a time boundary, Forecast uses a set of
/// <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/data-aggregation.html#default-time-boundaries">Default
/// Time Boundaries</a>.
///
/// For more information about aggregation, see <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/data-aggregation.html">Data
/// Aggregation for Different Forecast Frequencies</a>. For more information
/// setting a custom time boundary, see <a
/// href="https://docs.aws.amazon.com/forecast/latest/dg/data-aggregation.html#specifying-time-boundary">Specifying
/// a Time Boundary</a>.
class TimeAlignmentBoundary {
  /// The day of the month to use for time alignment during aggregation.
  final int? dayOfMonth;

  /// The day of week to use for time alignment during aggregation. The day must
  /// be in uppercase.
  final DayOfWeek? dayOfWeek;

  /// The hour of day to use for time alignment during aggregation.
  final int? hour;

  /// The month to use for time alignment during aggregation. The month must be in
  /// uppercase.
  final Month? month;

  TimeAlignmentBoundary({
    this.dayOfMonth,
    this.dayOfWeek,
    this.hour,
    this.month,
  });

  factory TimeAlignmentBoundary.fromJson(Map<String, dynamic> json) {
    return TimeAlignmentBoundary(
      dayOfMonth: json['DayOfMonth'] as int?,
      dayOfWeek: (json['DayOfWeek'] as String?)?.toDayOfWeek(),
      hour: json['Hour'] as int?,
      month: (json['Month'] as String?)?.toMonth(),
    );
  }

  Map<String, dynamic> toJson() {
    final dayOfMonth = this.dayOfMonth;
    final dayOfWeek = this.dayOfWeek;
    final hour = this.hour;
    final month = this.month;
    return {
      if (dayOfMonth != null) 'DayOfMonth': dayOfMonth,
      if (dayOfWeek != null) 'DayOfWeek': dayOfWeek.toValue(),
      if (hour != null) 'Hour': hour,
      if (month != null) 'Month': month.toValue(),
    };
  }
}

enum TimePointGranularity {
  all,
  specific,
}

extension TimePointGranularityValueExtension on TimePointGranularity {
  String toValue() {
    switch (this) {
      case TimePointGranularity.all:
        return 'ALL';
      case TimePointGranularity.specific:
        return 'SPECIFIC';
    }
  }
}

extension TimePointGranularityFromString on String {
  TimePointGranularity toTimePointGranularity() {
    switch (this) {
      case 'ALL':
        return TimePointGranularity.all;
      case 'SPECIFIC':
        return TimePointGranularity.specific;
    }
    throw Exception('$this is not known in enum TimePointGranularity');
  }
}

/// Creates a subset of items within an attribute that are modified. For
/// example, you can use this operation to create a subset of items that cost $5
/// or less. To do this, you specify <code>"AttributeName": "price"</code>,
/// <code>"AttributeValue": "5"</code>, and <code>"Condition":
/// "LESS_THAN"</code>. Pair this operation with the <a>Action</a> operation
/// within the <a>CreateWhatIfForecastRequest$TimeSeriesTransformations</a>
/// operation to define how the attribute is modified.
class TimeSeriesCondition {
  /// The item_id, dimension name, IM name, or timestamp that you are modifying.
  final String attributeName;

  /// The value that is applied for the chosen <code>Condition</code>.
  final String attributeValue;

  /// The condition to apply. Valid values are <code>EQUALS</code>,
  /// <code>NOT_EQUALS</code>, <code>LESS_THAN</code> and
  /// <code>GREATER_THAN</code>.
  final Condition condition;

  TimeSeriesCondition({
    required this.attributeName,
    required this.attributeValue,
    required this.condition,
  });

  factory TimeSeriesCondition.fromJson(Map<String, dynamic> json) {
    return TimeSeriesCondition(
      attributeName: json['AttributeName'] as String,
      attributeValue: json['AttributeValue'] as String,
      condition: (json['Condition'] as String).toCondition(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final attributeValue = this.attributeValue;
    final condition = this.condition;
    return {
      'AttributeName': attributeName,
      'AttributeValue': attributeValue,
      'Condition': condition.toValue(),
    };
  }
}

enum TimeSeriesGranularity {
  all,
  specific,
}

extension TimeSeriesGranularityValueExtension on TimeSeriesGranularity {
  String toValue() {
    switch (this) {
      case TimeSeriesGranularity.all:
        return 'ALL';
      case TimeSeriesGranularity.specific:
        return 'SPECIFIC';
    }
  }
}

extension TimeSeriesGranularityFromString on String {
  TimeSeriesGranularity toTimeSeriesGranularity() {
    switch (this) {
      case 'ALL':
        return TimeSeriesGranularity.all;
      case 'SPECIFIC':
        return TimeSeriesGranularity.specific;
    }
    throw Exception('$this is not known in enum TimeSeriesGranularity');
  }
}

/// Details about the import file that contains the time series for which you
/// want to create forecasts.
class TimeSeriesIdentifiers {
  final DataSource? dataSource;

  /// The format of the data, either CSV or PARQUET.
  final String? format;
  final Schema? schema;

  TimeSeriesIdentifiers({
    this.dataSource,
    this.format,
    this.schema,
  });

  factory TimeSeriesIdentifiers.fromJson(Map<String, dynamic> json) {
    return TimeSeriesIdentifiers(
      dataSource: json['DataSource'] != null
          ? DataSource.fromJson(json['DataSource'] as Map<String, dynamic>)
          : null,
      format: json['Format'] as String?,
      schema: json['Schema'] != null
          ? Schema.fromJson(json['Schema'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final format = this.format;
    final schema = this.schema;
    return {
      if (dataSource != null) 'DataSource': dataSource,
      if (format != null) 'Format': format,
      if (schema != null) 'Schema': schema,
    };
  }
}

/// A replacement dataset is a modified version of the baseline related time
/// series that contains only the values that you want to include in a what-if
/// forecast. The replacement dataset must contain the forecast dimensions and
/// item identifiers in the baseline related time series as well as at least 1
/// changed time series. This dataset is merged with the baseline related time
/// series to create a transformed dataset that is used for the what-if
/// forecast.
class TimeSeriesReplacementsDataSource {
  final S3Config s3Config;
  final Schema schema;

  /// The format of the replacement data, CSV or PARQUET.
  final String? format;

  /// The timestamp format of the replacement data.
  final String? timestampFormat;

  TimeSeriesReplacementsDataSource({
    required this.s3Config,
    required this.schema,
    this.format,
    this.timestampFormat,
  });

  factory TimeSeriesReplacementsDataSource.fromJson(Map<String, dynamic> json) {
    return TimeSeriesReplacementsDataSource(
      s3Config: S3Config.fromJson(json['S3Config'] as Map<String, dynamic>),
      schema: Schema.fromJson(json['Schema'] as Map<String, dynamic>),
      format: json['Format'] as String?,
      timestampFormat: json['TimestampFormat'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Config = this.s3Config;
    final schema = this.schema;
    final format = this.format;
    final timestampFormat = this.timestampFormat;
    return {
      'S3Config': s3Config,
      'Schema': schema,
      if (format != null) 'Format': format,
      if (timestampFormat != null) 'TimestampFormat': timestampFormat,
    };
  }
}

/// Defines the set of time series that are used to create the forecasts in a
/// <code>TimeSeriesIdentifiers</code> object.
///
/// The <code>TimeSeriesIdentifiers</code> object needs the following
/// information:
///
/// <ul>
/// <li>
/// <code>DataSource</code>
/// </li>
/// <li>
/// <code>Format</code>
/// </li>
/// <li>
/// <code>Schema</code>
/// </li>
/// </ul>
class TimeSeriesSelector {
  /// Details about the import file that contains the time series for which you
  /// want to create forecasts.
  final TimeSeriesIdentifiers? timeSeriesIdentifiers;

  TimeSeriesSelector({
    this.timeSeriesIdentifiers,
  });

  factory TimeSeriesSelector.fromJson(Map<String, dynamic> json) {
    return TimeSeriesSelector(
      timeSeriesIdentifiers: json['TimeSeriesIdentifiers'] != null
          ? TimeSeriesIdentifiers.fromJson(
              json['TimeSeriesIdentifiers'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final timeSeriesIdentifiers = this.timeSeriesIdentifiers;
    return {
      if (timeSeriesIdentifiers != null)
        'TimeSeriesIdentifiers': timeSeriesIdentifiers,
    };
  }
}

/// A transformation function is a pair of operations that select and modify the
/// rows in a related time series. You select the rows that you want with a
/// condition operation and you modify the rows with a transformation operation.
/// All conditions are joined with an AND operation, meaning that all conditions
/// must be true for the transformation to be applied. Transformations are
/// applied in the order that they are listed.
class TimeSeriesTransformation {
  /// An array of actions that define a time series and how it is transformed.
  /// These transformations create a new time series that is used for the what-if
  /// analysis.
  final Action? action;

  /// An array of conditions that define which members of the related time series
  /// are transformed.
  final List<TimeSeriesCondition>? timeSeriesConditions;

  TimeSeriesTransformation({
    this.action,
    this.timeSeriesConditions,
  });

  factory TimeSeriesTransformation.fromJson(Map<String, dynamic> json) {
    return TimeSeriesTransformation(
      action: json['Action'] != null
          ? Action.fromJson(json['Action'] as Map<String, dynamic>)
          : null,
      timeSeriesConditions: (json['TimeSeriesConditions'] as List?)
          ?.whereNotNull()
          .map((e) => TimeSeriesCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final timeSeriesConditions = this.timeSeriesConditions;
    return {
      if (action != null) 'Action': action,
      if (timeSeriesConditions != null)
        'TimeSeriesConditions': timeSeriesConditions,
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

class UpdateDatasetGroupResponse {
  UpdateDatasetGroupResponse();

  factory UpdateDatasetGroupResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDatasetGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The weighted loss value for a quantile. This object is part of the
/// <a>Metrics</a> object.
class WeightedQuantileLoss {
  /// The difference between the predicted value and the actual value over the
  /// quantile, weighted (normalized) by dividing by the sum over all quantiles.
  final double? lossValue;

  /// The quantile. Quantiles divide a probability distribution into regions of
  /// equal probability. For example, if the distribution was divided into 5
  /// regions of equal probability, the quantiles would be 0.2, 0.4, 0.6, and 0.8.
  final double? quantile;

  WeightedQuantileLoss({
    this.lossValue,
    this.quantile,
  });

  factory WeightedQuantileLoss.fromJson(Map<String, dynamic> json) {
    return WeightedQuantileLoss(
      lossValue: json['LossValue'] as double?,
      quantile: json['Quantile'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final lossValue = this.lossValue;
    final quantile = this.quantile;
    return {
      if (lossValue != null) 'LossValue': lossValue,
      if (quantile != null) 'Quantile': quantile,
    };
  }
}

/// Provides a summary of the what-if analysis properties used in the
/// <a>ListWhatIfAnalyses</a> operation. To get the complete set of properties,
/// call the <a>DescribeWhatIfAnalysis</a> operation, and provide the
/// <code>WhatIfAnalysisArn</code> that is listed in the summary.
class WhatIfAnalysisSummary {
  /// When the what-if analysis was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the baseline forecast that is being used
  /// in this what-if analysis.
  final String? forecastArn;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

  /// The status of the what-if analysis. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the what-if analysis must be <code>ACTIVE</code>
  /// before you can access the analysis.
  /// </note>
  final String? status;

  /// The Amazon Resource Name (ARN) of the what-if analysis.
  final String? whatIfAnalysisArn;

  /// The name of the what-if analysis.
  final String? whatIfAnalysisName;

  WhatIfAnalysisSummary({
    this.creationTime,
    this.forecastArn,
    this.lastModificationTime,
    this.message,
    this.status,
    this.whatIfAnalysisArn,
    this.whatIfAnalysisName,
  });

  factory WhatIfAnalysisSummary.fromJson(Map<String, dynamic> json) {
    return WhatIfAnalysisSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      forecastArn: json['ForecastArn'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
      whatIfAnalysisArn: json['WhatIfAnalysisArn'] as String?,
      whatIfAnalysisName: json['WhatIfAnalysisName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final forecastArn = this.forecastArn;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final status = this.status;
    final whatIfAnalysisArn = this.whatIfAnalysisArn;
    final whatIfAnalysisName = this.whatIfAnalysisName;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (forecastArn != null) 'ForecastArn': forecastArn,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
      if (whatIfAnalysisArn != null) 'WhatIfAnalysisArn': whatIfAnalysisArn,
      if (whatIfAnalysisName != null) 'WhatIfAnalysisName': whatIfAnalysisName,
    };
  }
}

/// Provides a summary of the what-if forecast export properties used in the
/// <a>ListWhatIfForecastExports</a> operation. To get the complete set of
/// properties, call the <a>DescribeWhatIfForecastExport</a> operation, and
/// provide the <code>WhatIfForecastExportArn</code> that is listed in the
/// summary.
class WhatIfForecastExportSummary {
  /// When the what-if forecast export was created.
  final DateTime? creationTime;

  /// The path to the Amazon Simple Storage Service (Amazon S3) bucket where the
  /// forecast is exported.
  final DataDestination? destination;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

  /// The status of the what-if forecast export. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the what-if analysis must be <code>ACTIVE</code>
  /// before you can access the analysis.
  /// </note>
  final String? status;

  /// An array of Amazon Resource Names (ARNs) that define the what-if forecasts
  /// included in the export.
  final List<String>? whatIfForecastArns;

  /// The Amazon Resource Name (ARN) of the what-if forecast export.
  final String? whatIfForecastExportArn;

  /// The what-if forecast export name.
  final String? whatIfForecastExportName;

  WhatIfForecastExportSummary({
    this.creationTime,
    this.destination,
    this.lastModificationTime,
    this.message,
    this.status,
    this.whatIfForecastArns,
    this.whatIfForecastExportArn,
    this.whatIfForecastExportName,
  });

  factory WhatIfForecastExportSummary.fromJson(Map<String, dynamic> json) {
    return WhatIfForecastExportSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      destination: json['Destination'] != null
          ? DataDestination.fromJson(
              json['Destination'] as Map<String, dynamic>)
          : null,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
      whatIfForecastArns: (json['WhatIfForecastArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      whatIfForecastExportArn: json['WhatIfForecastExportArn'] as String?,
      whatIfForecastExportName: json['WhatIfForecastExportName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destination = this.destination;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final status = this.status;
    final whatIfForecastArns = this.whatIfForecastArns;
    final whatIfForecastExportArn = this.whatIfForecastExportArn;
    final whatIfForecastExportName = this.whatIfForecastExportName;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (destination != null) 'Destination': destination,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
      if (whatIfForecastArns != null) 'WhatIfForecastArns': whatIfForecastArns,
      if (whatIfForecastExportArn != null)
        'WhatIfForecastExportArn': whatIfForecastExportArn,
      if (whatIfForecastExportName != null)
        'WhatIfForecastExportName': whatIfForecastExportName,
    };
  }
}

/// Provides a summary of the what-if forecast properties used in the
/// <a>ListWhatIfForecasts</a> operation. To get the complete set of properties,
/// call the <a>DescribeWhatIfForecast</a> operation, and provide the
/// <code>WhatIfForecastArn</code> that is listed in the summary.
class WhatIfForecastSummary {
  /// When the what-if forecast was created.
  final DateTime? creationTime;

  /// The last time the resource was modified. The timestamp depends on the status
  /// of the job:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPING</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>CREATE_STOPPED</code> - When the job stopped.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  final DateTime? lastModificationTime;

  /// If an error occurred, an informational message about the error.
  final String? message;

  /// The status of the what-if forecast. States include:
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
  /// <code>CREATE_STOPPING</code>, <code>CREATE_STOPPED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the what-if analysis must be <code>ACTIVE</code>
  /// before you can access the analysis.
  /// </note>
  final String? status;

  /// The Amazon Resource Name (ARN) of the what-if analysis that contains this
  /// what-if forecast.
  final String? whatIfAnalysisArn;

  /// The Amazon Resource Name (ARN) of the what-if forecast.
  final String? whatIfForecastArn;

  /// The name of the what-if forecast.
  final String? whatIfForecastName;

  WhatIfForecastSummary({
    this.creationTime,
    this.lastModificationTime,
    this.message,
    this.status,
    this.whatIfAnalysisArn,
    this.whatIfForecastArn,
    this.whatIfForecastName,
  });

  factory WhatIfForecastSummary.fromJson(Map<String, dynamic> json) {
    return WhatIfForecastSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
      whatIfAnalysisArn: json['WhatIfAnalysisArn'] as String?,
      whatIfForecastArn: json['WhatIfForecastArn'] as String?,
      whatIfForecastName: json['WhatIfForecastName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final status = this.status;
    final whatIfAnalysisArn = this.whatIfAnalysisArn;
    final whatIfForecastArn = this.whatIfForecastArn;
    final whatIfForecastName = this.whatIfForecastName;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
      if (whatIfAnalysisArn != null) 'WhatIfAnalysisArn': whatIfAnalysisArn,
      if (whatIfForecastArn != null) 'WhatIfForecastArn': whatIfForecastArn,
      if (whatIfForecastName != null) 'WhatIfForecastName': whatIfForecastName,
    };
  }
}

/// The metrics for a time range within the evaluation portion of a dataset.
/// This object is part of the <a>EvaluationResult</a> object.
///
/// The <code>TestWindowStart</code> and <code>TestWindowEnd</code> parameters
/// are determined by the <code>BackTestWindowOffset</code> parameter of the
/// <a>EvaluationParameters</a> object.
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
  final EvaluationType? evaluationType;

  /// The number of data points within the window.
  final int? itemCount;

  /// Provides metrics used to evaluate the performance of a predictor.
  final Metrics? metrics;

  /// The timestamp that defines the end of the window.
  final DateTime? testWindowEnd;

  /// The timestamp that defines the start of the window.
  final DateTime? testWindowStart;

  WindowSummary({
    this.evaluationType,
    this.itemCount,
    this.metrics,
    this.testWindowEnd,
    this.testWindowStart,
  });

  factory WindowSummary.fromJson(Map<String, dynamic> json) {
    return WindowSummary(
      evaluationType: (json['EvaluationType'] as String?)?.toEvaluationType(),
      itemCount: json['ItemCount'] as int?,
      metrics: json['Metrics'] != null
          ? Metrics.fromJson(json['Metrics'] as Map<String, dynamic>)
          : null,
      testWindowEnd: timeStampFromJson(json['TestWindowEnd']),
      testWindowStart: timeStampFromJson(json['TestWindowStart']),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationType = this.evaluationType;
    final itemCount = this.itemCount;
    final metrics = this.metrics;
    final testWindowEnd = this.testWindowEnd;
    final testWindowStart = this.testWindowStart;
    return {
      if (evaluationType != null) 'EvaluationType': evaluationType.toValue(),
      if (itemCount != null) 'ItemCount': itemCount,
      if (metrics != null) 'Metrics': metrics,
      if (testWindowEnd != null)
        'TestWindowEnd': unixTimestampToJson(testWindowEnd),
      if (testWindowStart != null)
        'TestWindowStart': unixTimestampToJson(testWindowStart),
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

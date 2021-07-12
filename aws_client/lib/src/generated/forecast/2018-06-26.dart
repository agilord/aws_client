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

/// Provides APIs for creating and managing Amazon Forecast resources.
class Forecast {
  final _s.JsonProtocol _protocol;
  Forecast({
    required String region,
    _s.AwsClientCredentials? credentials,
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
  /// href="https://github.com/aws-samples/amazon-forecast-samples">Amazon
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
  /// combination of such as a prefix for keys as it is reserved for AWS use.
  /// You cannot edit or delete tag keys with this prefix. Values can have this
  /// prefix. If a tag value has <code>aws</code> as its prefix but the key does
  /// not, then Forecast considers it to be a user tag and will count against
  /// the limit of 50 tags. Tags with only the key prefix of <code>aws</code> do
  /// not count against your tags per resource limit.
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
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(datasetType, 'datasetType');
    ArgumentError.checkNotNull(domain, 'domain');
    ArgumentError.checkNotNull(schema, 'schema');
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
  /// before you can use the dataset group to create a predictor. To get the
  /// status, use the <a>DescribeDatasetGroup</a> operation.
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
  /// combination of such as a prefix for keys as it is reserved for AWS use.
  /// You cannot edit or delete tag keys with this prefix. Values can have this
  /// prefix. If a tag value has <code>aws</code> as its prefix but the key does
  /// not, then Forecast considers it to be a user tag and will count against
  /// the limit of 50 tags. Tags with only the key prefix of <code>aws</code> do
  /// not count against your tags per resource limit.
  /// </li>
  /// </ul>
  Future<CreateDatasetGroupResponse> createDatasetGroup({
    required String datasetGroupName,
    required Domain domain,
    List<String>? datasetArns,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(datasetGroupName, 'datasetGroupName');
    _s.validateStringLength(
      'datasetGroupName',
      datasetGroupName,
      1,
      63,
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
  /// You must specify a <a>DataSource</a> object that includes an AWS Identity
  /// and Access Management (IAM) role that Amazon Forecast can assume to access
  /// the data, as Amazon Forecast makes a copy of your data and processes it in
  /// an internal AWS system. For more information, see
  /// <a>aws-forecast-iam-roles</a>.
  ///
  /// The training data must be in CSV format. The delimiter must be a comma
  /// (,).
  ///
  /// You can specify the path to a specific CSV file, the S3 bucket, or to a
  /// folder in the S3 bucket. For the latter two cases, Amazon Forecast imports
  /// all files up to the limit of 10,000 files.
  ///
  /// Because dataset imports are not aggregated, your most recent dataset
  /// import is the one that is used when training a predictor or generating a
  /// forecast. Make sure that your most recent dataset import contains all of
  /// the data you want to model off of, and not just the new data collected
  /// since the previous import.
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
  /// combination of such as a prefix for keys as it is reserved for AWS use.
  /// You cannot edit or delete tag keys with this prefix. Values can have this
  /// prefix. If a tag value has <code>aws</code> as its prefix but the key does
  /// not, then Forecast considers it to be a user tag and will count against
  /// the limit of 50 tags. Tags with only the key prefix of <code>aws</code> do
  /// not count against your tags per resource limit.
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
    String? geolocationFormat,
    List<Tag>? tags,
    String? timeZone,
    String? timestampFormat,
    bool? useGeolocationForTimeZone,
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
    ArgumentError.checkNotNull(datasetImportJobName, 'datasetImportJobName');
    _s.validateStringLength(
      'datasetImportJobName',
      datasetImportJobName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringLength(
      'geolocationFormat',
      geolocationFormat,
      0,
      256,
    );
    _s.validateStringLength(
      'timeZone',
      timeZone,
      0,
      256,
    );
    _s.validateStringLength(
      'timestampFormat',
      timestampFormat,
      0,
      256,
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
        if (geolocationFormat != null) 'GeolocationFormat': geolocationFormat,
        if (tags != null) 'Tags': tags,
        if (timeZone != null) 'TimeZone': timeZone,
        if (timestampFormat != null) 'TimestampFormat': timestampFormat,
        if (useGeolocationForTimeZone != null)
          'UseGeolocationForTimeZone': useGeolocationForTimeZone,
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
  /// Binomial). The default value is <code>["0.1", "0.5", "0.9"]</code>.
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
  /// combination of such as a prefix for keys as it is reserved for AWS use.
  /// You cannot edit or delete tag keys with this prefix. Values can have this
  /// prefix. If a tag value has <code>aws</code> as its prefix but the key does
  /// not, then Forecast considers it to be a user tag and will count against
  /// the limit of 50 tags. Tags with only the key prefix of <code>aws</code> do
  /// not count against your tags per resource limit.
  /// </li>
  /// </ul>
  Future<CreateForecastResponse> createForecast({
    required String forecastName,
    required String predictorArn,
    List<String>? forecastTypes,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(forecastName, 'forecastName');
    _s.validateStringLength(
      'forecastName',
      forecastName,
      1,
      63,
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
  /// combination of such as a prefix for keys as it is reserved for AWS use.
  /// You cannot edit or delete tag keys with this prefix. Values can have this
  /// prefix. If a tag value has <code>aws</code> as its prefix but the key does
  /// not, then Forecast considers it to be a user tag and will count against
  /// the limit of 50 tags. Tags with only the key prefix of <code>aws</code> do
  /// not count against your tags per resource limit.
  /// </li>
  /// </ul>
  Future<CreateForecastExportJobResponse> createForecastExportJob({
    required DataDestination destination,
    required String forecastArn,
    required String forecastExportJobName,
    List<Tag>? tags,
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
    ArgumentError.checkNotNull(forecastExportJobName, 'forecastExportJobName');
    _s.validateStringLength(
      'forecastExportJobName',
      forecastExportJobName,
      1,
      63,
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
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateForecastExportJobResponse.fromJson(jsonResponse.body);
  }

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
  /// Used to overide the default AutoML strategy, which is to optimize
  /// predictor accuracy. To apply an AutoML strategy that minimizes training
  /// time, use <code>LatencyOptimized</code>.
  ///
  /// This parameter is only valid for predictors trained using AutoML.
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
  /// combination of such as a prefix for keys as it is reserved for AWS use.
  /// You cannot edit or delete tag keys with this prefix. Values can have this
  /// prefix. If a tag value has <code>aws</code> as its prefix but the key does
  /// not, then Forecast considers it to be a user tag and will count against
  /// the limit of 50 tags. Tags with only the key prefix of <code>aws</code> do
  /// not count against your tags per resource limit.
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
    bool? performAutoML,
    bool? performHPO,
    List<Tag>? tags,
    Map<String, String>? trainingParameters,
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
    _s.validateStringLength(
      'algorithmArn',
      algorithmArn,
      0,
      256,
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
        if (algorithmArn != null) 'AlgorithmArn': algorithmArn,
        if (autoMLOverrideStrategy != null)
          'AutoMLOverrideStrategy': autoMLOverrideStrategy.toValue(),
        if (encryptionConfig != null) 'EncryptionConfig': encryptionConfig,
        if (evaluationParameters != null)
          'EvaluationParameters': evaluationParameters,
        if (forecastTypes != null) 'ForecastTypes': forecastTypes,
        if (hPOConfig != null) 'HPOConfig': hPOConfig,
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
  /// <a>CreatePredictor</a> operation. Two folders containing CSV files are
  /// exported to your specified S3 bucket.
  ///
  /// The export file names will match the following conventions:
  ///
  /// <code>&lt;ExportJobName&gt;_&lt;ExportTimestamp&gt;_&lt;PartNumber&gt;.csv</code>
  ///
  /// The &lt;ExportTimestamp&gt; component is in Java SimpleDate format
  /// (yyyy-MM-ddTHH-mm-ssZ).
  ///
  /// You must specify a <a>DataDestination</a> object that includes an Amazon
  /// S3 bucket and an AWS Identity and Access Management (IAM) role that Amazon
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
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(destination, 'destination');
    ArgumentError.checkNotNull(predictorArn, 'predictorArn');
    _s.validateStringLength(
      'predictorArn',
      predictorArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        predictorBacktestExportJobName, 'predictorBacktestExportJobName');
    _s.validateStringLength(
      'predictorBacktestExportJobName',
      predictorBacktestExportJobName,
      1,
      63,
      isRequired: true,
    );
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
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePredictorBacktestExportJobResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon Forecast dataset that was created using the
  /// <a>CreateDataset</a> operation. You can only delete datasets that have a
  /// status of <code>ACTIVE</code> or <code>CREATE_FAILED</code>. To get the
  /// status use the <a>DescribeDataset</a> operation.
  /// <note>
  /// Forecast does not automatically update any dataset groups that contain the
  /// deleted dataset. In order to update the dataset group, use the operation,
  /// omitting the deleted dataset's ARN.
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
    ArgumentError.checkNotNull(forecastArn, 'forecastArn');
    _s.validateStringLength(
      'forecastArn',
      forecastArn,
      0,
      256,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(forecastExportJobArn, 'forecastExportJobArn');
    _s.validateStringLength(
      'forecastExportJobArn',
      forecastExportJobArn,
      0,
      256,
      isRequired: true,
    );
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
    required String predictorArn,
  }) async {
    ArgumentError.checkNotNull(predictorArn, 'predictorArn');
    _s.validateStringLength(
      'predictorArn',
      predictorArn,
      0,
      256,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(
        predictorBacktestExportJobArn, 'predictorBacktestExportJobArn');
    _s.validateStringLength(
      'predictorBacktestExportJobArn',
      predictorBacktestExportJobArn,
      0,
      256,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
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
    required String forecastArn,
  }) async {
    ArgumentError.checkNotNull(forecastArn, 'forecastArn');
    _s.validateStringLength(
      'forecastArn',
      forecastArn,
      0,
      256,
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
    required String forecastExportJobArn,
  }) async {
    ArgumentError.checkNotNull(forecastExportJobArn, 'forecastExportJobArn');
    _s.validateStringLength(
      'forecastExportJobArn',
      forecastExportJobArn,
      0,
      256,
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
    required String predictorArn,
  }) async {
    ArgumentError.checkNotNull(predictorArn, 'predictorArn');
    _s.validateStringLength(
      'predictorArn',
      predictorArn,
      0,
      256,
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
    ArgumentError.checkNotNull(
        predictorBacktestExportJobArn, 'predictorBacktestExportJobArn');
    _s.validateStringLength(
      'predictorBacktestExportJobArn',
      predictorBacktestExportJobArn,
      0,
      256,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(predictorArn, 'predictorArn');
    _s.validateStringLength(
      'predictorArn',
      predictorArn,
      0,
      256,
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
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
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
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
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListForecastsResponse.fromJson(jsonResponse.body);
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      3000,
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
  /// list the tags. Currently, the supported resources are Forecast dataset
  /// groups, datasets, dataset import jobs, predictors, forecasts, and forecast
  /// export jobs.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
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
  /// <code>ForecastArn</code>, and <code>ForecastExportJobArn</code>.
  Future<void> stopResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
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
  /// list the tags. Currently, the supported resources are Forecast dataset
  /// groups, datasets, dataset import jobs, predictors, forecasts, and forecast
  /// export jobs.
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
  /// combination of such as a prefix for keys as it is reserved for AWS use.
  /// You cannot edit or delete tag keys with this prefix. Values can have this
  /// prefix. If a tag value has <code>aws</code> as its prefix but the key does
  /// not, then Forecast considers it to be a user tag and will count against
  /// the limit of 50 tags. Tags with only the key prefix of <code>aws</code> do
  /// not count against your tags per resource limit.
  /// </li>
  /// </ul>
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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
  /// list the tags. Currently, the supported resources are Forecast dataset
  /// groups, datasets, dataset import jobs, predictors, forecasts, and forecast
  /// exports.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
    required List<String> datasetArns,
    required String datasetGroupArn,
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

enum AttributeType {
  string,
  integer,
  float,
  timestamp,
  geolocation,
}

extension on AttributeType {
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

extension on String {
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
}

extension on AutoMLOverrideStrategy {
  String toValue() {
    switch (this) {
      case AutoMLOverrideStrategy.latencyOptimized:
        return 'LatencyOptimized';
    }
  }
}

extension on String {
  AutoMLOverrideStrategy toAutoMLOverrideStrategy() {
    switch (this) {
      case 'LatencyOptimized':
        return AutoMLOverrideStrategy.latencyOptimized;
    }
    throw Exception('$this is not known in enum AutoMLOverrideStrategy');
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

/// The destination for an export job. Provide an S3 path, an AWS Identity and
/// Access Management (IAM) role that allows Amazon Forecast to access the
/// location, and an AWS Key Management Service (KMS) key (optional).
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

/// The source of your training data, an AWS Identity and Access Management
/// (IAM) role that allows Amazon Forecast to access the data and, optionally,
/// an AWS Key Management Service (KMS) key. This object is submitted in the
/// <a>CreateDatasetImportJob</a> request.
class DataSource {
  /// The path to the training data stored in an Amazon Simple Storage Service
  /// (Amazon S3) bucket along with the credentials to access the data.
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

/// Provides a summary of the dataset group properties used in the
/// <a>ListDatasetGroups</a> operation. To get the complete set of properties,
/// call the <a>DescribeDatasetGroup</a> operation, and provide the
/// <code>DatasetGroupArn</code>.
class DatasetGroupSummary {
  /// When the dataset group was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the dataset group.
  final String? datasetGroupArn;

  /// The name of the dataset group.
  final String? datasetGroupName;

  /// When the dataset group was created or last updated from a call to the
  /// <a>UpdateDatasetGroup</a> operation. While the dataset group is being
  /// updated, <code>LastModificationTime</code> is the current time of the
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

/// Provides a summary of the dataset import job properties used in the
/// <a>ListDatasetImportJobs</a> operation. To get the complete set of
/// properties, call the <a>DescribeDatasetImportJob</a> operation, and provide
/// the <code>DatasetImportJobArn</code>.
class DatasetImportJobSummary {
  /// When the dataset import job was created.
  final DateTime? creationTime;

  /// The location of the training data to import and an AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the data.
  /// The training data must be stored in an Amazon S3 bucket.
  ///
  /// If encryption is used, <code>DataSource</code> includes an AWS Key
  /// Management Service (KMS) key.
  final DataSource? dataSource;

  /// The Amazon Resource Name (ARN) of the dataset import job.
  final String? datasetImportJobArn;

  /// The name of the dataset import job.
  final String? datasetImportJobName;

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
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status,
    };
  }
}

/// Provides a summary of the dataset properties used in the <a>ListDatasets</a>
/// operation. To get the complete set of properties, call the
/// <a>DescribeDataset</a> operation, and provide the <code>DatasetArn</code>.
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
  /// <code>ListDatasets</code> call. After a <a>CreateDatasetImportJob</a>
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

extension on DatasetType {
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

extension on String {
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

  /// When the dataset group was created or last updated from a call to the
  /// <a>UpdateDatasetGroup</a> operation. While the dataset group is being
  /// updated, <code>LastModificationTime</code> is the current time of the
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
  /// The <code>UPDATE</code> states apply when you call the
  /// <a>UpdateDatasetGroup</a> operation.
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

  /// The location of the training data to import and an AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the data.
  ///
  /// If encryption is used, <code>DataSource</code> includes an AWS Key
  /// Management Service (KMS) key.
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

  /// The format of the geolocation attribute. Valid
  /// Values:<code>"LAT_LONG"</code> and <code>"CC_POSTALCODE"</code>.
  final String? geolocationFormat;

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
    this.geolocationFormat,
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
      geolocationFormat: json['GeolocationFormat'] as String?,
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
    final geolocationFormat = this.geolocationFormat;
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
      if (geolocationFormat != null) 'GeolocationFormat': geolocationFormat,
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

  /// The AWS Key Management Service (KMS) key and the AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the key.
  final EncryptionConfig? encryptionConfig;

  /// When you create a dataset, <code>LastModificationTime</code> is the same as
  /// <code>CreationTime</code>. While data is being imported to the dataset,
  /// <code>LastModificationTime</code> is the current time of the
  /// <code>DescribeDataset</code> call. After a <a>CreateDatasetImportJob</a>
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
  /// from a call to the <a>CreateDatasetImportJob</a> operation and reflect the
  /// status of the dataset import job. For example, when the import job status is
  /// <code>CREATE_IN_PROGRESS</code>, the status of the dataset is
  /// <code>UPDATE_IN_PROGRESS</code>.
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
    };
  }
}

class DescribePredictorBacktestExportJobResponse {
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

  /// An AWS Key Management Service (KMS) key and the AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the key.
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
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
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
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
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
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
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

enum Domain {
  retail,
  custom,
  inventoryPlanning,
  ec2Capacity,
  workForce,
  webTraffic,
  metrics,
}

extension on Domain {
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

extension on String {
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

/// An AWS Key Management Service (KMS) key and an AWS Identity and Access
/// Management (IAM) role that Amazon Forecast can assume to access the key. You
/// can specify this optional object in the <a>CreateDataset</a> and
/// <a>CreatePredictor</a> requests.
class EncryptionConfig {
  /// The Amazon Resource Name (ARN) of the KMS key.
  final String kMSKeyArn;

  /// The ARN of the IAM role that Amazon Forecast can assume to access the AWS
  /// KMS key.
  ///
  /// Passing a role across AWS accounts is not allowed. If you pass a role that
  /// isn't in your account, you get an <code>InvalidInputException</code> error.
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
  /// The Forecast type used to compute WAPE and RMSE.
  final String? forecastType;

  /// The root-mean-square error (RMSE).
  final double? rmse;

  /// The weighted absolute percentage error (WAPE).
  final double? wape;

  ErrorMetric({
    this.forecastType,
    this.rmse,
    this.wape,
  });

  factory ErrorMetric.fromJson(Map<String, dynamic> json) {
    return ErrorMetric(
      forecastType: json['ForecastType'] as String?,
      rmse: json['RMSE'] as double?,
      wape: json['WAPE'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final forecastType = this.forecastType;
    final rmse = this.rmse;
    final wape = this.wape;
    return {
      if (forecastType != null) 'ForecastType': forecastType,
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

extension on EvaluationType {
  String toValue() {
    switch (this) {
      case EvaluationType.summary:
        return 'SUMMARY';
      case EvaluationType.computed:
        return 'COMPUTED';
    }
  }
}

extension on String {
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

extension on FeaturizationMethodName {
  String toValue() {
    switch (this) {
      case FeaturizationMethodName.filling:
        return 'filling';
    }
  }
}

extension on String {
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

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      condition: (json['Condition'] as String).toFilterConditionString(),
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

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

extension on FilterConditionString {
  String toValue() {
    switch (this) {
      case FilterConditionString.$is:
        return 'IS';
      case FilterConditionString.isNot:
        return 'IS_NOT';
    }
  }
}

extension on String {
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
    final creationTime = this.creationTime;
    final datasetGroupArn = this.datasetGroupArn;
    final forecastArn = this.forecastArn;
    final forecastName = this.forecastName;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final predictorArn = this.predictorArn;
    final status = this.status;
    return {
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
  /// The AutoML strategy used to train the predictor. Unless
  /// <code>LatencyOptimized</code> is specified, the AutoML strategy optimizes
  /// predictor accuracy.
  ///
  /// This parameter is only valid for predictors trained using AutoML.
  final AutoMLOverrideStrategy? autoMLOverrideStrategy;

  /// An array of results from evaluating the predictor.
  final List<EvaluationResult>? predictorEvaluationResults;

  GetAccuracyMetricsResponse({
    this.autoMLOverrideStrategy,
    this.predictorEvaluationResults,
  });

  factory GetAccuracyMetricsResponse.fromJson(Map<String, dynamic> json) {
    return GetAccuracyMetricsResponse(
      autoMLOverrideStrategy: (json['AutoMLOverrideStrategy'] as String?)
          ?.toAutoMLOverrideStrategy(),
      predictorEvaluationResults: (json['PredictorEvaluationResults'] as List?)
          ?.whereNotNull()
          .map((e) => EvaluationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoMLOverrideStrategy = this.autoMLOverrideStrategy;
    final predictorEvaluationResults = this.predictorEvaluationResults;
    return {
      if (autoMLOverrideStrategy != null)
        'AutoMLOverrideStrategy': autoMLOverrideStrategy.toValue(),
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

/// Provides metrics that are used to evaluate the performance of a predictor.
/// This object is part of the <a>WindowSummary</a> object.
class Metrics {
  /// Provides detailed error metrics on forecast type, root-mean square-error
  /// (RMSE), and weighted average percentage error (WAPE).
  final List<ErrorMetric>? errorMetrics;

  /// The root-mean-square error (RMSE).
  final double? rmse;

  /// An array of weighted quantile losses. Quantiles divide a probability
  /// distribution into regions of equal probability. The distribution in this
  /// case is the loss function.
  final List<WeightedQuantileLoss>? weightedQuantileLosses;

  Metrics({
    this.errorMetrics,
    this.rmse,
    this.weightedQuantileLosses,
  });

  factory Metrics.fromJson(Map<String, dynamic> json) {
    return Metrics(
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
    final errorMetrics = this.errorMetrics;
    final rmse = this.rmse;
    final weightedQuantileLosses = this.weightedQuantileLosses;
    return {
      if (errorMetrics != null) 'ErrorMetrics': errorMetrics,
      if (rmse != null) 'RMSE': rmse,
      if (weightedQuantileLosses != null)
        'WeightedQuantileLosses': weightedQuantileLosses,
    };
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
    this.lastModificationTime,
    this.message,
    this.predictorArn,
    this.predictorName,
    this.status,
  });

  factory PredictorSummary.fromJson(Map<String, dynamic> json) {
    return PredictorSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      datasetGroupArn: json['DatasetGroupArn'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      message: json['Message'] as String?,
      predictorArn: json['PredictorArn'] as String?,
      predictorName: json['PredictorName'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final datasetGroupArn = this.datasetGroupArn;
    final lastModificationTime = this.lastModificationTime;
    final message = this.message;
    final predictorArn = this.predictorArn;
    final predictorName = this.predictorName;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (datasetGroupArn != null) 'DatasetGroupArn': datasetGroupArn,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (message != null) 'Message': message,
      if (predictorArn != null) 'PredictorArn': predictorArn,
      if (predictorName != null) 'PredictorName': predictorName,
      if (status != null) 'Status': status,
    };
  }
}

/// The path to the file(s) in an Amazon Simple Storage Service (Amazon S3)
/// bucket, and an AWS Identity and Access Management (IAM) role that Amazon
/// Forecast can assume to access the file(s). Optionally, includes an AWS Key
/// Management Service (KMS) key. This object is part of the <a>DataSource</a>
/// object that is submitted in the <a>CreateDatasetImportJob</a> request, and
/// part of the <a>DataDestination</a> object.
class S3Config {
  /// The path to an Amazon Simple Storage Service (Amazon S3) bucket or file(s)
  /// in an Amazon S3 bucket.
  final String path;

  /// The ARN of the AWS Identity and Access Management (IAM) role that Amazon
  /// Forecast can assume to access the Amazon S3 bucket or files. If you provide
  /// a value for the <code>KMSKeyArn</code> key, the role must allow access to
  /// the key.
  ///
  /// Passing a role across AWS accounts is not allowed. If you pass a role that
  /// isn't in your account, you get an <code>InvalidInputException</code> error.
  final String roleArn;

  /// The Amazon Resource Name (ARN) of an AWS Key Management Service (KMS) key.
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

extension on ScalingType {
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

extension on String {
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

/// Defines the fields of a dataset. You specify this object in the
/// <a>CreateDataset</a> request.
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
/// is required for every field in a dataset. The <a>Schema</a> object contains
/// an array of <code>SchemaAttribute</code> objects.
class SchemaAttribute {
  /// The name of the dataset field.
  final String? attributeName;

  /// The data type of the field.
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

/// Provides statistics for each data field imported into to an Amazon Forecast
/// dataset with the <a>CreateDatasetImportJob</a> operation.
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
/// combination of such as a prefix for keys as it is reserved for AWS use. You
/// cannot edit or delete tag keys with this prefix. Values can have this
/// prefix. If a tag value has <code>aws</code> as its prefix but the key does
/// not, then Forecast considers it to be a user tag and will count against the
/// limit of 50 tags. Tags with only the key prefix of <code>aws</code> do not
/// count against your tags per resource limit.
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

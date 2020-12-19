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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'forecastquery-2018-06-26.g.dart';

/// Provides APIs for creating and managing Amazon Forecast resources.
class ForecastQueryService {
  final _s.JsonProtocol _protocol;
  ForecastQueryService({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'forecastquery',
            signingName: 'forecast',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Retrieves a forecast for a single item, filtered by the supplied criteria.
  ///
  /// The criteria is a key-value pair. The key is either <code>item_id</code>
  /// (or the equivalent non-timestamp, non-target field) from the
  /// <code>TARGET_TIME_SERIES</code> dataset, or one of the forecast dimensions
  /// specified as part of the <code>FeaturizationConfig</code> object.
  ///
  /// By default, <code>QueryForecast</code> returns the complete date range for
  /// the filtered forecast. You can request a specific date range.
  ///
  /// To get the full forecast, use the <a
  /// href="https://docs.aws.amazon.com/en_us/forecast/latest/dg/API_CreateForecastExportJob.html">CreateForecastExportJob</a>
  /// operation.
  /// <note>
  /// The forecasts generated by Amazon Forecast are in the same timezone as the
  /// dataset that was used to create the predictor.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [filters] :
  /// The filtering criteria to apply when retrieving the forecast. For example,
  /// to get the forecast for <code>client_21</code> in the electricity usage
  /// dataset, specify the following:
  ///
  /// <code>{"item_id" : "client_21"}</code>
  ///
  /// To get the full forecast, use the <a
  /// href="https://docs.aws.amazon.com/en_us/forecast/latest/dg/API_CreateForecastExportJob.html">CreateForecastExportJob</a>
  /// operation.
  ///
  /// Parameter [forecastArn] :
  /// The Amazon Resource Name (ARN) of the forecast to query.
  ///
  /// Parameter [endDate] :
  /// The end date for the forecast. Specify the date using this format:
  /// yyyy-MM-dd'T'HH:mm:ss (ISO 8601 format). For example, 2015-01-01T20:00:00.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
  ///
  /// Parameter [startDate] :
  /// The start date for the forecast. Specify the date using this format:
  /// yyyy-MM-dd'T'HH:mm:ss (ISO 8601 format). For example, 2015-01-01T08:00:00.
  Future<QueryForecastResponse> queryForecast({
    @_s.required Map<String, String> filters,
    @_s.required String forecastArn,
    String endDate,
    String nextToken,
    String startDate,
  }) async {
    ArgumentError.checkNotNull(filters, 'filters');
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
      r'''arn:([a-z\d-]+):forecast:.*:.*:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      3000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecastRuntime.QueryForecast'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'ForecastArn': forecastArn,
        if (endDate != null) 'EndDate': endDate,
        if (nextToken != null) 'NextToken': nextToken,
        if (startDate != null) 'StartDate': startDate,
      },
    );

    return QueryForecastResponse.fromJson(jsonResponse.body);
  }
}

/// The forecast value for a specific date. Part of the <a>Forecast</a> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataPoint {
  /// The timestamp of the specific forecast.
  @_s.JsonKey(name: 'Timestamp')
  final String timestamp;

  /// The forecast value.
  @_s.JsonKey(name: 'Value')
  final double value;

  DataPoint({
    this.timestamp,
    this.value,
  });
  factory DataPoint.fromJson(Map<String, dynamic> json) =>
      _$DataPointFromJson(json);
}

/// Provides information about a forecast. Returned as part of the
/// <a>QueryForecast</a> response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Forecast {
  /// The forecast.
  ///
  /// The <i>string</i> of the string-to-array map is one of the following values:
  ///
  /// <ul>
  /// <li>
  /// p10
  /// </li>
  /// <li>
  /// p50
  /// </li>
  /// <li>
  /// p90
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Predictions')
  final Map<String, List<DataPoint>> predictions;

  Forecast({
    this.predictions,
  });
  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryForecastResponse {
  /// The forecast.
  @_s.JsonKey(name: 'Forecast')
  final Forecast forecast;

  QueryForecastResponse({
    this.forecast,
  });
  factory QueryForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$QueryForecastResponseFromJson(json);
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
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};

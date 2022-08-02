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

/// With Amazon CloudWatch RUM, you can perform real-user monitoring to collect
/// client-side data about your web application performance from actual user
/// sessions in real time. The data collected includes page load times,
/// client-side errors, and user behavior. When you view this data, you can see
/// it all aggregated together and also see breakdowns by the browsers and
/// devices that your customers use.
/// <pre><code> &lt;p&gt;You can use the collected data to quickly identify and
/// debug client-side performance issues. CloudWatch RUM helps you visualize
/// anomalies in your application performance and find relevant debugging data
/// such as error messages, stack traces, and user sessions. You can also use
/// RUM to understand the range of end-user impact including the number of
/// users, geolocations, and browsers used.&lt;/p&gt; </code></pre>
class CloudWatchRum {
  final _s.RestJsonProtocol _protocol;
  CloudWatchRum({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rum',
            signingName: 'rum',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a Amazon CloudWatch RUM app monitor, which collects telemetry data
  /// from your application and sends that data to RUM. The data includes
  /// performance and reliability information such as page load time,
  /// client-side errors, and user behavior.
  ///
  /// You use this operation only to create a new app monitor. To update an
  /// existing app monitor, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_UpdateAppMonitor.html">UpdateAppMonitor</a>
  /// instead.
  ///
  /// After you create an app monitor, sign in to the CloudWatch RUM console to
  /// get the JavaScript code snippet to add to your web application. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-find-code-snippet.html">How
  /// do I find a code snippet that I've already generated?</a>
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domain] :
  /// The top-level internet domain name for which your application has
  /// administrative authority.
  ///
  /// Parameter [name] :
  /// A name for the app monitor.
  ///
  /// Parameter [appMonitorConfiguration] :
  /// A structure that contains much of the configuration data for the app
  /// monitor. If you are using Amazon Cognito for authorization, you must
  /// include this structure in your request, and it must include the ID of the
  /// Amazon Cognito identity pool to use for authorization. If you don't
  /// include <code>AppMonitorConfiguration</code>, you must set up your own
  /// authorization method. For more information, see <a
  /// href="https://docs.aws.amazon.com/monitoring/CloudWatch-RUM-get-started-authorization.html">Authorize
  /// your application to send data to Amazon Web Services</a>.
  ///
  /// If you omit this argument, the sample rate used for RUM is set to 10% of
  /// the user sessions.
  ///
  /// Parameter [cwLogEnabled] :
  /// Data collected by RUM is kept by RUM for 30 days and then deleted. This
  /// parameter specifies whether RUM sends a copy of this telemetry data to
  /// Amazon CloudWatch Logs in your account. This enables you to keep the
  /// telemetry data for more than 30 days, but it does incur Amazon CloudWatch
  /// Logs charges.
  ///
  /// If you omit this parameter, the default is <code>false</code>.
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags (key-value pairs) to the app monitor.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  /// <pre><code> &lt;p&gt;You can associate as many as 50 tags with an app
  /// monitor.&lt;/p&gt; &lt;p&gt;For more information, see &lt;a
  /// href=&quot;https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html&quot;&gt;Tagging
  /// Amazon Web Services resources&lt;/a&gt;.&lt;/p&gt; </code></pre>
  Future<CreateAppMonitorResponse> createAppMonitor({
    required String domain,
    required String name,
    AppMonitorConfiguration? appMonitorConfiguration,
    bool? cwLogEnabled,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'Domain': domain,
      'Name': name,
      if (appMonitorConfiguration != null)
        'AppMonitorConfiguration': appMonitorConfiguration,
      if (cwLogEnabled != null) 'CwLogEnabled': cwLogEnabled,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/appmonitor',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAppMonitorResponse.fromJson(response);
  }

  /// Deletes an existing app monitor. This immediately stops the collection of
  /// data.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the app monitor to delete.
  Future<void> deleteAppMonitor({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/appmonitor/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the complete configuration information for one app monitor.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The app monitor to retrieve information for.
  Future<GetAppMonitorResponse> getAppMonitor({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/appmonitor/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAppMonitorResponse.fromJson(response);
  }

  /// Retrieves the raw performance events that RUM has collected from your web
  /// application, so that you can do your own processing or analysis of this
  /// data.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the app monitor that collected the data that you want to
  /// retrieve.
  ///
  /// Parameter [timeRange] :
  /// A structure that defines the time range that you want to retrieve results
  /// from.
  ///
  /// Parameter [filters] :
  /// An array of structures that you can use to filter the results to those
  /// that match one or more sets of key-value pairs that you specify.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation.
  ///
  /// Parameter [nextToken] :
  /// Use the token returned by the previous operation to request the next page
  /// of results.
  Future<GetAppMonitorDataResponse> getAppMonitorData({
    required String name,
    required TimeRange timeRange,
    List<QueryFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(timeRange, 'timeRange');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      'TimeRange': timeRange,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/appmonitor/${Uri.encodeComponent(name)}/data',
      exceptionFnMap: _exceptionFns,
    );
    return GetAppMonitorDataResponse.fromJson(response);
  }

  /// Returns a list of the Amazon CloudWatch RUM app monitors in the account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation.
  ///
  /// Parameter [nextToken] :
  /// Use the token returned by the previous operation to request the next page
  /// of results.
  Future<ListAppMonitorsResponse> listAppMonitors({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/appmonitors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppMonitorsResponse.fromJson(response);
  }

  /// Displays the tags associated with a CloudWatch RUM resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that you want to see the tags of.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Sends telemetry events about your application performance and user
  /// behavior to CloudWatch RUM. The code snippet that RUM generates for you to
  /// add to your application includes <code>PutRumEvents</code> operations to
  /// send this data to RUM.
  ///
  /// Each <code>PutRumEvents</code> operation can send a batch of events from
  /// one user session.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appMonitorDetails] :
  /// A structure that contains information about the app monitor that collected
  /// this telemetry information.
  ///
  /// Parameter [batchId] :
  /// A unique identifier for this batch of RUM event data.
  ///
  /// Parameter [id] :
  /// The ID of the app monitor that is sending this data.
  ///
  /// Parameter [rumEvents] :
  /// An array of structures that contain the telemetry event data.
  ///
  /// Parameter [userDetails] :
  /// A structure that contains information about the user session that this
  /// batch of events was collected from.
  Future<void> putRumEvents({
    required AppMonitorDetails appMonitorDetails,
    required String batchId,
    required String id,
    required List<RumEvent> rumEvents,
    required UserDetails userDetails,
  }) async {
    ArgumentError.checkNotNull(appMonitorDetails, 'appMonitorDetails');
    ArgumentError.checkNotNull(batchId, 'batchId');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(rumEvents, 'rumEvents');
    ArgumentError.checkNotNull(userDetails, 'userDetails');
    final $payload = <String, dynamic>{
      'AppMonitorDetails': appMonitorDetails,
      'BatchId': batchId,
      'RumEvents': rumEvents,
      'UserDetails': userDetails,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/appmonitors/${Uri.encodeComponent(id)}/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns one or more tags (key-value pairs) to the specified CloudWatch RUM
  /// resource. Currently, the only resources that can be tagged app monitors.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can use the <code>TagResource</code> action with a resource that
  /// already has tags. If you specify a new tag key for the resource, this tag
  /// is appended to the list of tags associated with the alarm. If you specify
  /// a tag key that is already associated with the resource, the new tag value
  /// that you specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a resource.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch RUM resource that you're adding tags to.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch RUM resource that you're removing tags from.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the configuration of an existing app monitor. When you use this
  /// operation, only the parts of the app monitor configuration that you
  /// specify in this operation are changed. For any parameters that you omit,
  /// the existing values are kept.
  ///
  /// You can't use this operation to change the tags of an existing app
  /// monitor. To change the tags of an existing app monitor, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_TagResource.html">TagResource</a>.
  ///
  /// To create a new app monitor, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_CreateAppMonitor.html">CreateAppMonitor</a>.
  ///
  /// After you update an app monitor, sign in to the CloudWatch RUM console to
  /// get the updated JavaScript code snippet to add to your web application.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-find-code-snippet.html">How
  /// do I find a code snippet that I've already generated?</a>
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the app monitor to update.
  ///
  /// Parameter [appMonitorConfiguration] :
  /// A structure that contains much of the configuration data for the app
  /// monitor. If you are using Amazon Cognito for authorization, you must
  /// include this structure in your request, and it must include the ID of the
  /// Amazon Cognito identity pool to use for authorization. If you don't
  /// include <code>AppMonitorConfiguration</code>, you must set up your own
  /// authorization method. For more information, see <a
  /// href="https://docs.aws.amazon.com/monitoring/CloudWatch-RUM-get-started-authorization.html">Authorize
  /// your application to send data to Amazon Web Services</a>.
  ///
  /// Parameter [cwLogEnabled] :
  /// Data collected by RUM is kept by RUM for 30 days and then deleted. This
  /// parameter specifies whether RUM sends a copy of this telemetry data to
  /// Amazon CloudWatch Logs in your account. This enables you to keep the
  /// telemetry data for more than 30 days, but it does incur Amazon CloudWatch
  /// Logs charges.
  ///
  /// Parameter [domain] :
  /// The top-level internet domain name for which your application has
  /// administrative authority.
  Future<void> updateAppMonitor({
    required String name,
    AppMonitorConfiguration? appMonitorConfiguration,
    bool? cwLogEnabled,
    String? domain,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      if (appMonitorConfiguration != null)
        'AppMonitorConfiguration': appMonitorConfiguration,
      if (cwLogEnabled != null) 'CwLogEnabled': cwLogEnabled,
      if (domain != null) 'Domain': domain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/appmonitor/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// A RUM app monitor collects telemetry data from your application and sends
/// that data to RUM. The data includes performance and reliability information
/// such as page load time, client-side errors, and user behavior.
class AppMonitor {
  /// A structure that contains much of the configuration data for the app
  /// monitor.
  final AppMonitorConfiguration? appMonitorConfiguration;

  /// The date and time that this app monitor was created.
  final String? created;

  /// A structure that contains information about whether this app monitor stores
  /// a copy of the telemetry data that RUM collects using CloudWatch Logs.
  final DataStorage? dataStorage;

  /// The top-level internet domain name for which your application has
  /// administrative authority.
  final String? domain;

  /// The unique ID of this app monitor.
  final String? id;

  /// The date and time of the most recent changes to this app monitor's
  /// configuration.
  final String? lastModified;

  /// The name of the app monitor.
  final String? name;

  /// The current state of the app monitor.
  final StateEnum? state;

  /// The list of tag keys and values associated with this app monitor.
  final Map<String, String>? tags;

  AppMonitor({
    this.appMonitorConfiguration,
    this.created,
    this.dataStorage,
    this.domain,
    this.id,
    this.lastModified,
    this.name,
    this.state,
    this.tags,
  });

  factory AppMonitor.fromJson(Map<String, dynamic> json) {
    return AppMonitor(
      appMonitorConfiguration: json['AppMonitorConfiguration'] != null
          ? AppMonitorConfiguration.fromJson(
              json['AppMonitorConfiguration'] as Map<String, dynamic>)
          : null,
      created: json['Created'] as String?,
      dataStorage: json['DataStorage'] != null
          ? DataStorage.fromJson(json['DataStorage'] as Map<String, dynamic>)
          : null,
      domain: json['Domain'] as String?,
      id: json['Id'] as String?,
      lastModified: json['LastModified'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toStateEnum(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final appMonitorConfiguration = this.appMonitorConfiguration;
    final created = this.created;
    final dataStorage = this.dataStorage;
    final domain = this.domain;
    final id = this.id;
    final lastModified = this.lastModified;
    final name = this.name;
    final state = this.state;
    final tags = this.tags;
    return {
      if (appMonitorConfiguration != null)
        'AppMonitorConfiguration': appMonitorConfiguration,
      if (created != null) 'Created': created,
      if (dataStorage != null) 'DataStorage': dataStorage,
      if (domain != null) 'Domain': domain,
      if (id != null) 'Id': id,
      if (lastModified != null) 'LastModified': lastModified,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// This structure contains much of the configuration data for the app monitor.
class AppMonitorConfiguration {
  /// If you set this to <code>true</code>, the RUM web client sets two cookies, a
  /// session cookie and a user cookie. The cookies allow the RUM web client to
  /// collect data relating to the number of users an application has and the
  /// behavior of the application across a sequence of events. Cookies are stored
  /// in the top-level domain of the current page.
  final bool? allowCookies;

  /// If you set this to <code>true</code>, RUM enables X-Ray tracing for the user
  /// sessions that RUM samples. RUM adds an X-Ray trace header to allowed HTTP
  /// requests. It also records an X-Ray segment for allowed HTTP requests. You
  /// can see traces and segments from these user sessions in the X-Ray console
  /// and the CloudWatch ServiceLens console. For more information, see <a
  /// href="https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html">What
  /// is X-Ray?</a>
  final bool? enableXRay;

  /// A list of URLs in your website or application to exclude from RUM data
  /// collection.
  ///
  /// You can't include both <code>ExcludedPages</code> and
  /// <code>IncludedPages</code> in the same operation.
  final List<String>? excludedPages;

  /// A list of pages in the CloudWatch RUM console that are to be displayed with
  /// a "favorite" icon.
  final List<String>? favoritePages;

  /// The ARN of the guest IAM role that is attached to the Amazon Cognito
  /// identity pool that is used to authorize the sending of data to RUM.
  final String? guestRoleArn;

  /// The ID of the Amazon Cognito identity pool that is used to authorize the
  /// sending of data to RUM.
  final String? identityPoolId;

  /// If this app monitor is to collect data from only certain pages in your
  /// application, this structure lists those pages.
  /// <pre><code> &lt;p&gt;You can't include both
  /// &lt;code&gt;ExcludedPages&lt;/code&gt; and
  /// &lt;code&gt;IncludedPages&lt;/code&gt; in the same operation.&lt;/p&gt;
  /// </code></pre>
  final List<String>? includedPages;

  /// Specifies the percentage of user sessions to use for RUM data collection.
  /// Choosing a higher percentage gives you more data but also incurs more costs.
  ///
  /// The number you specify is the percentage of user sessions that will be used.
  ///
  /// If you omit this parameter, the default of 10 is used.
  final double? sessionSampleRate;

  /// An array that lists the types of telemetry data that this app monitor is to
  /// collect.
  ///
  /// <ul>
  /// <li>
  /// <code>errors</code> indicates that RUM collects data about unhandled
  /// JavaScript errors raised by your application.
  /// </li>
  /// <li>
  /// <code>performance</code> indicates that RUM collects performance data about
  /// how your application and its resources are loaded and rendered. This
  /// includes Core Web Vitals.
  /// </li>
  /// <li>
  /// <code>http</code> indicates that RUM collects data about HTTP errors thrown
  /// by your application.
  /// </li>
  /// </ul>
  final List<Telemetry>? telemetries;

  AppMonitorConfiguration({
    this.allowCookies,
    this.enableXRay,
    this.excludedPages,
    this.favoritePages,
    this.guestRoleArn,
    this.identityPoolId,
    this.includedPages,
    this.sessionSampleRate,
    this.telemetries,
  });

  factory AppMonitorConfiguration.fromJson(Map<String, dynamic> json) {
    return AppMonitorConfiguration(
      allowCookies: json['AllowCookies'] as bool?,
      enableXRay: json['EnableXRay'] as bool?,
      excludedPages: (json['ExcludedPages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      favoritePages: (json['FavoritePages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      guestRoleArn: json['GuestRoleArn'] as String?,
      identityPoolId: json['IdentityPoolId'] as String?,
      includedPages: (json['IncludedPages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sessionSampleRate: json['SessionSampleRate'] as double?,
      telemetries: (json['Telemetries'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toTelemetry())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowCookies = this.allowCookies;
    final enableXRay = this.enableXRay;
    final excludedPages = this.excludedPages;
    final favoritePages = this.favoritePages;
    final guestRoleArn = this.guestRoleArn;
    final identityPoolId = this.identityPoolId;
    final includedPages = this.includedPages;
    final sessionSampleRate = this.sessionSampleRate;
    final telemetries = this.telemetries;
    return {
      if (allowCookies != null) 'AllowCookies': allowCookies,
      if (enableXRay != null) 'EnableXRay': enableXRay,
      if (excludedPages != null) 'ExcludedPages': excludedPages,
      if (favoritePages != null) 'FavoritePages': favoritePages,
      if (guestRoleArn != null) 'GuestRoleArn': guestRoleArn,
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
      if (includedPages != null) 'IncludedPages': includedPages,
      if (sessionSampleRate != null) 'SessionSampleRate': sessionSampleRate,
      if (telemetries != null)
        'Telemetries': telemetries.map((e) => e.toValue()).toList(),
    };
  }
}

/// A structure that contains information about the RUM app monitor.
class AppMonitorDetails {
  /// The unique ID of the app monitor.
  final String? id;

  /// The name of the app monitor.
  final String? name;

  /// The version of the app monitor.
  final String? version;

  AppMonitorDetails({
    this.id,
    this.name,
    this.version,
  });

  factory AppMonitorDetails.fromJson(Map<String, dynamic> json) {
    return AppMonitorDetails(
      id: json['id'] as String?,
      name: json['name'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final version = this.version;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (version != null) 'version': version,
    };
  }
}

/// A structure that includes some data about app monitors and their settings.
class AppMonitorSummary {
  /// The date and time that the app monitor was created.
  final String? created;

  /// The unique ID of this app monitor.
  final String? id;

  /// The date and time of the most recent changes to this app monitor's
  /// configuration.
  final String? lastModified;

  /// The name of this app monitor.
  final String? name;

  /// The current state of this app monitor.
  final StateEnum? state;

  AppMonitorSummary({
    this.created,
    this.id,
    this.lastModified,
    this.name,
    this.state,
  });

  factory AppMonitorSummary.fromJson(Map<String, dynamic> json) {
    return AppMonitorSummary(
      created: json['Created'] as String?,
      id: json['Id'] as String?,
      lastModified: json['LastModified'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toStateEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final id = this.id;
    final lastModified = this.lastModified;
    final name = this.name;
    final state = this.state;
    return {
      if (created != null) 'Created': created,
      if (id != null) 'Id': id,
      if (lastModified != null) 'LastModified': lastModified,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

class CreateAppMonitorResponse {
  /// The unique ID of the new app monitor.
  final String? id;

  CreateAppMonitorResponse({
    this.id,
  });

  factory CreateAppMonitorResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppMonitorResponse(
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

/// A structure that contains the information about whether the app monitor
/// stores copies of the data that RUM collects in CloudWatch Logs. If it does,
/// this structure also contains the name of the log group.
class CwLog {
  /// Indicated whether the app monitor stores copies of the data that RUM
  /// collects in CloudWatch Logs.
  final bool? cwLogEnabled;

  /// The name of the log group where the copies are stored.
  final String? cwLogGroup;

  CwLog({
    this.cwLogEnabled,
    this.cwLogGroup,
  });

  factory CwLog.fromJson(Map<String, dynamic> json) {
    return CwLog(
      cwLogEnabled: json['CwLogEnabled'] as bool?,
      cwLogGroup: json['CwLogGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cwLogEnabled = this.cwLogEnabled;
    final cwLogGroup = this.cwLogGroup;
    return {
      if (cwLogEnabled != null) 'CwLogEnabled': cwLogEnabled,
      if (cwLogGroup != null) 'CwLogGroup': cwLogGroup,
    };
  }
}

/// A structure that contains information about whether this app monitor stores
/// a copy of the telemetry data that RUM collects using CloudWatch Logs.
class DataStorage {
  /// A structure that contains the information about whether the app monitor
  /// stores copies of the data that RUM collects in CloudWatch Logs. If it does,
  /// this structure also contains the name of the log group.
  final CwLog? cwLog;

  DataStorage({
    this.cwLog,
  });

  factory DataStorage.fromJson(Map<String, dynamic> json) {
    return DataStorage(
      cwLog: json['CwLog'] != null
          ? CwLog.fromJson(json['CwLog'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cwLog = this.cwLog;
    return {
      if (cwLog != null) 'CwLog': cwLog,
    };
  }
}

class DeleteAppMonitorResponse {
  DeleteAppMonitorResponse();

  factory DeleteAppMonitorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAppMonitorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetAppMonitorDataResponse {
  /// The events that RUM collected that match your request.
  final List<String>? events;

  /// A token that you can use in a subsequent operation to retrieve the next set
  /// of results.
  final String? nextToken;

  GetAppMonitorDataResponse({
    this.events,
    this.nextToken,
  });

  factory GetAppMonitorDataResponse.fromJson(Map<String, dynamic> json) {
    return GetAppMonitorDataResponse(
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      if (events != null) 'Events': events,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetAppMonitorResponse {
  /// A structure containing all the configuration information for the app
  /// monitor.
  final AppMonitor? appMonitor;

  GetAppMonitorResponse({
    this.appMonitor,
  });

  factory GetAppMonitorResponse.fromJson(Map<String, dynamic> json) {
    return GetAppMonitorResponse(
      appMonitor: json['AppMonitor'] != null
          ? AppMonitor.fromJson(json['AppMonitor'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appMonitor = this.appMonitor;
    return {
      if (appMonitor != null) 'AppMonitor': appMonitor,
    };
  }
}

class ListAppMonitorsResponse {
  /// An array of structures that contain information about the returned app
  /// monitors.
  final List<AppMonitorSummary>? appMonitorSummaries;

  /// A token that you can use in a subsequent operation to retrieve the next set
  /// of results.
  final String? nextToken;

  ListAppMonitorsResponse({
    this.appMonitorSummaries,
    this.nextToken,
  });

  factory ListAppMonitorsResponse.fromJson(Map<String, dynamic> json) {
    return ListAppMonitorsResponse(
      appMonitorSummaries: (json['AppMonitorSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => AppMonitorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appMonitorSummaries = this.appMonitorSummaries;
    final nextToken = this.nextToken;
    return {
      if (appMonitorSummaries != null)
        'AppMonitorSummaries': appMonitorSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The ARN of the resource that you are viewing.
  final String resourceArn;

  /// The list of tag keys and values associated with the resource you specified.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.resourceArn,
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceArn: json['ResourceArn'] as String,
      tags: (json['Tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      'ResourceArn': resourceArn,
      'Tags': tags,
    };
  }
}

class PutRumEventsResponse {
  PutRumEventsResponse();

  factory PutRumEventsResponse.fromJson(Map<String, dynamic> _) {
    return PutRumEventsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure that defines a key and values that you can use to filter the
/// results. The only performance events that are returned are those that have
/// values matching the ones that you specify in one of your
/// <code>QueryFilter</code> structures.
///
/// For example, you could specify <code>Browser</code> as the <code>Name</code>
/// and specify <code>Chrome,Firefox</code> as the <code>Values</code> to return
/// events generated only from those browsers.
///
/// Specifying <code>Invert</code> as the <code>Name</code> works as a "not
/// equal to" filter. For example, specify <code>Invert</code> as the
/// <code>Name</code> and specify <code>Chrome</code> as the value to return all
/// events except events from user sessions with the Chrome browser.
class QueryFilter {
  /// The name of a key to search for. The filter returns only the events that
  /// match the <code>Name</code> and <code>Values</code> that you specify.
  ///
  /// Valid values for <code>Name</code> are <code>Browser</code> |
  /// <code>Device</code> | <code>Country</code> | <code>Page</code> |
  /// <code>OS</code> | <code>EventType</code> | <code>Invert</code>
  final String? name;

  /// The values of the <code>Name</code> that are to be be included in the
  /// returned results.
  final List<String>? values;

  QueryFilter({
    this.name,
    this.values,
  });

  factory QueryFilter.fromJson(Map<String, dynamic> json) {
    return QueryFilter(
      name: json['Name'] as String?,
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name,
      if (values != null) 'Values': values,
    };
  }
}

/// A structure that contains the information for one performance event that RUM
/// collects from a user session with your application.
class RumEvent {
  /// A string containing details about the event.
  final Object details;

  /// A unique ID for this event.
  final String id;

  /// The exact time that this event occurred.
  final DateTime timestamp;

  /// The JSON schema that denotes the type of event this is, such as a page load
  /// or a new session.
  final String type;

  /// Metadata about this event, which contains a JSON serialization of the
  /// identity of the user for this session. The user information comes from
  /// information such as the HTTP user-agent request header and document
  /// interface.
  final Object? metadata;

  RumEvent({
    required this.details,
    required this.id,
    required this.timestamp,
    required this.type,
    this.metadata,
  });

  factory RumEvent.fromJson(Map<String, dynamic> json) {
    return RumEvent(
      details: jsonDecode(json['details'] as String) as Object,
      id: json['id'] as String,
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] as Object),
      type: json['type'] as String,
      metadata: json['metadata'] == null
          ? null
          : jsonDecode(json['metadata'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final id = this.id;
    final timestamp = this.timestamp;
    final type = this.type;
    final metadata = this.metadata;
    return {
      'details': jsonEncode(details),
      'id': id,
      'timestamp': unixTimestampToJson(timestamp),
      'type': type,
      if (metadata != null) 'metadata': jsonEncode(metadata),
    };
  }
}

enum StateEnum {
  created,
  deleting,
  active,
}

extension on StateEnum {
  String toValue() {
    switch (this) {
      case StateEnum.created:
        return 'CREATED';
      case StateEnum.deleting:
        return 'DELETING';
      case StateEnum.active:
        return 'ACTIVE';
    }
  }
}

extension on String {
  StateEnum toStateEnum() {
    switch (this) {
      case 'CREATED':
        return StateEnum.created;
      case 'DELETING':
        return StateEnum.deleting;
      case 'ACTIVE':
        return StateEnum.active;
    }
    throw Exception('$this is not known in enum StateEnum');
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

enum Telemetry {
  errors,
  performance,
  http,
}

extension on Telemetry {
  String toValue() {
    switch (this) {
      case Telemetry.errors:
        return 'errors';
      case Telemetry.performance:
        return 'performance';
      case Telemetry.http:
        return 'http';
    }
  }
}

extension on String {
  Telemetry toTelemetry() {
    switch (this) {
      case 'errors':
        return Telemetry.errors;
      case 'performance':
        return Telemetry.performance;
      case 'http':
        return Telemetry.http;
    }
    throw Exception('$this is not known in enum Telemetry');
  }
}

/// A structure that defines the time range that you want to retrieve results
/// from.
class TimeRange {
  /// The beginning of the time range to retrieve performance events from.
  final int after;

  /// The end of the time range to retrieve performance events from. If you omit
  /// this, the time range extends to the time that this operation is performed.
  final int? before;

  TimeRange({
    required this.after,
    this.before,
  });

  factory TimeRange.fromJson(Map<String, dynamic> json) {
    return TimeRange(
      after: json['After'] as int,
      before: json['Before'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final after = this.after;
    final before = this.before;
    return {
      'After': after,
      if (before != null) 'Before': before,
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

class UpdateAppMonitorResponse {
  UpdateAppMonitorResponse();

  factory UpdateAppMonitorResponse.fromJson(Map<String, dynamic> _) {
    return UpdateAppMonitorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure that contains information about the user session that this batch
/// of events was collected from.
class UserDetails {
  /// The session ID that the performance events are from.
  final String? sessionId;

  /// The ID of the user for this user session. This ID is generated by RUM and
  /// does not include any personally identifiable information about the user.
  final String? userId;

  UserDetails({
    this.sessionId,
    this.userId,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      sessionId: json['sessionId'] as String?,
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    final userId = this.userId;
    return {
      if (sessionId != null) 'sessionId': sessionId,
      if (userId != null) 'userId': userId,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};

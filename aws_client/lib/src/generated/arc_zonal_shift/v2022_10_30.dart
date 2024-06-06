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

/// Welcome to the Zonal Shift API Reference Guide for Amazon Route 53
/// Application Recovery Controller (Route 53 ARC).
///
/// You can start a zonal shift to move traffic for a load balancer resource
/// away from an Availability Zone to help your application recover quickly from
/// an impairment in an Availability Zone. For example, you can recover your
/// application from a developer's bad code deployment or from an Amazon Web
/// Services infrastructure failure in a single Availability Zone.
///
/// You can also configure zonal autoshift for a load balancer resource. Zonal
/// autoshift is a capability in Route 53 ARC where Amazon Web Services shifts
/// away application resource traffic from an Availability Zone, on your behalf,
/// to help reduce your time to recovery during events. Amazon Web Services
/// shifts away traffic for resources that are enabled for zonal autoshift
/// whenever Amazon Web Services determines that there's an issue in the
/// Availability Zone that could potentially affect customers.
///
/// To ensure that zonal autoshift is safe for your application, you must also
/// configure practice runs when you enable zonal autoshift for a resource.
/// Practice runs start weekly zonal shifts for a resource, to shift traffic for
/// the resource out of an Availability Zone. Practice runs make sure, on a
/// regular basis, that you have enough capacity in all the Availability Zones
/// in an Amazon Web Services Region for your application to continue to operate
/// normally when traffic for a resource is shifted away from one Availability
/// Zone.
/// <important>
/// You must prescale resource capacity in all Availability Zones in the Region
/// where your application is deployed, before you configure practice runs or
/// enable zonal autoshift for a resource. You should not rely on scaling on
/// demand when an autoshift or practice run starts.
/// </important>
/// For more information about using zonal shift and zonal autoshift, see the <a
/// href="https://docs.aws.amazon.com/r53recovery/latest/dg/what-is-route53-recovery.html">Amazon
/// Route 53 Application Recovery Controller Developer Guide</a>.
class ArcZonalShift {
  final _s.RestJsonProtocol _protocol;
  ArcZonalShift({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'arc-zonal-shift',
            signingName: 'arc-zonal-shift',
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

  /// Cancel a zonal shift in Amazon Route 53 Application Recovery Controller.
  /// To cancel the zonal shift, specify the zonal shift ID.
  ///
  /// A zonal shift can be one that you've started for a resource in your Amazon
  /// Web Services account in an Amazon Web Services Region, or it can be a
  /// zonal shift started by a practice run with zonal autoshift.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [zonalShiftId] :
  /// The internally-generated identifier of a zonal shift.
  Future<ZonalShift> cancelZonalShift({
    required String zonalShiftId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/zonalshifts/${Uri.encodeComponent(zonalShiftId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ZonalShift.fromJson(response);
  }

  /// A practice run configuration for zonal autoshift is required when you
  /// enable zonal autoshift. A practice run configuration includes
  /// specifications for blocked dates and blocked time windows, and for Amazon
  /// CloudWatch alarms that you create to use with practice runs. The alarms
  /// that you specify are an <i>outcome alarm</i>, to monitor application
  /// health during practice runs and, optionally, a <i>blocking alarm</i>, to
  /// block practice runs from starting.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/arc-zonal-autoshift.considerations.html">
  /// Considerations when you configure zonal autoshift</a> in the Amazon Route
  /// 53 Application Recovery Controller Developer Guide.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [outcomeAlarms] :
  /// The <i>outcome alarm</i> for practice runs is a required Amazon CloudWatch
  /// alarm that you specify that ends a practice run when the alarm is in an
  /// <code>ALARM</code> state.
  ///
  /// Configure the alarm to monitor the health of your application when traffic
  /// is shifted away from an Availability Zone during each weekly practice run.
  /// You should configure the alarm to go into an <code>ALARM</code> state if
  /// your application is impacted by the zonal shift, and you want to stop the
  /// zonal shift, to let traffic for the resource return to the Availability
  /// Zone.
  ///
  /// Parameter [resourceIdentifier] :
  /// The identifier of the resource to shift away traffic for when a practice
  /// run starts a zonal shift. The identifier is the Amazon Resource Name (ARN)
  /// for the resource.
  ///
  /// At this time, supported resources are Network Load Balancers and
  /// Application Load Balancers with cross-zone load balancing turned off.
  ///
  /// Parameter [blockedDates] :
  /// Optionally, you can block Route 53 ARC from starting practice runs for a
  /// resource on specific calendar dates.
  ///
  /// The format for blocked dates is: YYYY-MM-DD. Keep in mind, when you
  /// specify dates, that dates and times for practice runs are in UTC. Separate
  /// multiple blocked dates with spaces.
  ///
  /// For example, if you have an application update scheduled to launch on May
  /// 1, 2024, and you don't want practice runs to shift traffic away at that
  /// time, you could set a blocked date for <code>2024-05-01</code>.
  ///
  /// Parameter [blockedWindows] :
  /// Optionally, you can block Route 53 ARC from starting practice runs for
  /// specific windows of days and times.
  ///
  /// The format for blocked windows is: DAY:HH:SS-DAY:HH:SS. Keep in mind, when
  /// you specify dates, that dates and times for practice runs are in UTC.
  /// Also, be aware of potential time adjustments that might be required for
  /// daylight saving time differences. Separate multiple blocked windows with
  /// spaces.
  ///
  /// For example, say you run business report summaries three days a week. For
  /// this scenario, you might set the following recurring days and times as
  /// blocked windows, for example: <code>MON-20:30-21:30 WED-20:30-21:30
  /// FRI-20:30-21:30</code>.
  ///
  /// Parameter [blockingAlarms] :
  /// An Amazon CloudWatch alarm that you can specify for zonal autoshift
  /// practice runs. This alarm blocks Route 53 ARC from starting practice run
  /// zonal shifts, and ends a practice run that's in progress, when the alarm
  /// is in an <code>ALARM</code> state.
  Future<CreatePracticeRunConfigurationResponse>
      createPracticeRunConfiguration({
    required List<ControlCondition> outcomeAlarms,
    required String resourceIdentifier,
    List<String>? blockedDates,
    List<String>? blockedWindows,
    List<ControlCondition>? blockingAlarms,
  }) async {
    final $payload = <String, dynamic>{
      'outcomeAlarms': outcomeAlarms,
      'resourceIdentifier': resourceIdentifier,
      if (blockedDates != null) 'blockedDates': blockedDates,
      if (blockedWindows != null) 'blockedWindows': blockedWindows,
      if (blockingAlarms != null) 'blockingAlarms': blockingAlarms,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePracticeRunConfigurationResponse.fromJson(response);
  }

  /// Deletes the practice run configuration for a resource. Before you can
  /// delete a practice run configuration for a resource., you must disable
  /// zonal autoshift for the resource. Practice runs must be configured for
  /// zonal autoshift to be enabled.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The identifier for the resource that you want to delete the practice run
  /// configuration for. The identifier is the Amazon Resource Name (ARN) for
  /// the resource.
  Future<DeletePracticeRunConfigurationResponse>
      deletePracticeRunConfiguration({
    required String resourceIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/configuration/${Uri.encodeComponent(resourceIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePracticeRunConfigurationResponse.fromJson(response);
  }

  /// Get information about a resource that's been registered for zonal shifts
  /// with Amazon Route 53 Application Recovery Controller in this Amazon Web
  /// Services Region. Resources that are registered for zonal shifts are
  /// managed resources in Route 53 ARC. You can start zonal shifts and
  /// configure zonal autoshift for managed resources.
  ///
  /// At this time, you can only start a zonal shift or configure zonal
  /// autoshift for Network Load Balancers and Application Load Balancers with
  /// cross-zone load balancing turned off.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The identifier for the resource to shift away traffic for. The identifier
  /// is the Amazon Resource Name (ARN) for the resource.
  ///
  /// At this time, supported resources are Network Load Balancers and
  /// Application Load Balancers with cross-zone load balancing turned off.
  Future<GetManagedResourceResponse> getManagedResource({
    required String resourceIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/managedresources/${Uri.encodeComponent(resourceIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetManagedResourceResponse.fromJson(response);
  }

  /// Returns the active autoshifts for a specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [status] :
  /// The status of the autoshift.
  Future<ListAutoshiftsResponse> listAutoshifts({
    int? maxResults,
    String? nextToken,
    AutoshiftExecutionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/autoshifts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAutoshiftsResponse.fromJson(response);
  }

  /// Lists all the resources in your Amazon Web Services account in this Amazon
  /// Web Services Region that are managed for zonal shifts in Amazon Route 53
  /// Application Recovery Controller, and information about them. The
  /// information includes the zonal autoshift status for the resource, as well
  /// as the Amazon Resource Name (ARN), the Availability Zones that each
  /// resource is deployed in, and the resource name.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  Future<ListManagedResourcesResponse> listManagedResources({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/managedresources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedResourcesResponse.fromJson(response);
  }

  /// Lists all active and completed zonal shifts in Amazon Route 53 Application
  /// Recovery Controller in your Amazon Web Services account in this Amazon Web
  /// Services Region. <code>ListZonalShifts</code> returns customer-started
  /// zonal shifts, as well as practice run zonal shifts that Route 53 ARC
  /// started on your behalf for zonal autoshift.
  ///
  /// The <code>ListZonalShifts</code> operation does not list autoshifts. For
  /// more information about listing autoshifts, see <a
  /// href="https://docs.aws.amazon.com/arc-zonal-shift/latest/api/API_ListAutoshifts.html">"&gt;ListAutoshifts</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [resourceIdentifier] :
  /// The identifier for the resource that you want to list zonal shifts for.
  /// The identifier is the Amazon Resource Name (ARN) for the resource.
  ///
  /// Parameter [status] :
  /// A status for a zonal shift.
  ///
  /// The <code>Status</code> for a zonal shift can have one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <b>ACTIVE</b>: The zonal shift has been started and active.
  /// </li>
  /// <li>
  /// <b>EXPIRED</b>: The zonal shift has expired (the expiry time was
  /// exceeded).
  /// </li>
  /// <li>
  /// <b>CANCELED</b>: The zonal shift was canceled.
  /// </li>
  /// </ul>
  Future<ListZonalShiftsResponse> listZonalShifts({
    int? maxResults,
    String? nextToken,
    String? resourceIdentifier,
    ZonalShiftStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceIdentifier != null)
        'resourceIdentifier': [resourceIdentifier],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/zonalshifts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListZonalShiftsResponse.fromJson(response);
  }

  /// You start a zonal shift to temporarily move load balancer traffic away
  /// from an Availability Zone in an Amazon Web Services Region, to help your
  /// application recover immediately, for example, from a developer's bad code
  /// deployment or from an Amazon Web Services infrastructure failure in a
  /// single Availability Zone. You can start a zonal shift in Route 53 ARC only
  /// for managed resources in your Amazon Web Services account in an Amazon Web
  /// Services Region. Resources are automatically registered with Route 53 ARC
  /// by Amazon Web Services services.
  ///
  /// At this time, you can only start a zonal shift for Network Load Balancers
  /// and Application Load Balancers with cross-zone load balancing turned off.
  ///
  /// When you start a zonal shift, traffic for the resource is no longer routed
  /// to the Availability Zone. The zonal shift is created immediately in Route
  /// 53 ARC. However, it can take a short time, typically up to a few minutes,
  /// for existing, in-progress connections in the Availability Zone to
  /// complete.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/arc-zonal-shift.html">Zonal
  /// shift</a> in the Amazon Route 53 Application Recovery Controller Developer
  /// Guide.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [awayFrom] :
  /// The Availability Zone that traffic is moved away from for a resource when
  /// you start a zonal shift. Until the zonal shift expires or you cancel it,
  /// traffic for the resource is instead moved to other Availability Zones in
  /// the Amazon Web Services Region.
  ///
  /// Parameter [comment] :
  /// A comment that you enter about the zonal shift. Only the latest comment is
  /// retained; no comment history is maintained. A new comment overwrites any
  /// existing comment string.
  ///
  /// Parameter [expiresIn] :
  /// The length of time that you want a zonal shift to be active, which Route
  /// 53 ARC converts to an expiry time (expiration time). Zonal shifts are
  /// temporary. You can set a zonal shift to be active initially for up to
  /// three days (72 hours).
  ///
  /// If you want to still keep traffic away from an Availability Zone, you can
  /// update the zonal shift and set a new expiration. You can also cancel a
  /// zonal shift, before it expires, for example, if you're ready to restore
  /// traffic to the Availability Zone.
  ///
  /// To set a length of time for a zonal shift to be active, specify a whole
  /// number, and then one of the following, with no space:
  ///
  /// <ul>
  /// <li>
  /// <b>A lowercase letter m:</b> To specify that the value is in minutes.
  /// </li>
  /// <li>
  /// <b>A lowercase letter h:</b> To specify that the value is in hours.
  /// </li>
  /// </ul>
  /// For example: <code>20h</code> means the zonal shift expires in 20 hours.
  /// <code>120m</code> means the zonal shift expires in 120 minutes (2 hours).
  ///
  /// Parameter [resourceIdentifier] :
  /// The identifier for the resource to shift away traffic for. The identifier
  /// is the Amazon Resource Name (ARN) for the resource.
  ///
  /// At this time, supported resources are Network Load Balancers and
  /// Application Load Balancers with cross-zone load balancing turned off.
  Future<ZonalShift> startZonalShift({
    required String awayFrom,
    required String comment,
    required String expiresIn,
    required String resourceIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'awayFrom': awayFrom,
      'comment': comment,
      'expiresIn': expiresIn,
      'resourceIdentifier': resourceIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/zonalshifts',
      exceptionFnMap: _exceptionFns,
    );
    return ZonalShift.fromJson(response);
  }

  /// Update a practice run configuration to change one or more of the
  /// following: add, change, or remove the blocking alarm; change the outcome
  /// alarm; or add, change, or remove blocking dates or time windows.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The identifier for the resource that you want to update the practice run
  /// configuration for. The identifier is the Amazon Resource Name (ARN) for
  /// the resource.
  ///
  /// Parameter [blockedDates] :
  /// Add, change, or remove blocked dates for a practice run in zonal
  /// autoshift.
  ///
  /// Optionally, you can block practice runs for specific calendar dates. The
  /// format for blocked dates is: YYYY-MM-DD. Keep in mind, when you specify
  /// dates, that dates and times for practice runs are in UTC. Separate
  /// multiple blocked dates with spaces.
  ///
  /// For example, if you have an application update scheduled to launch on May
  /// 1, 2024, and you don't want practice runs to shift traffic away at that
  /// time, you could set a blocked date for <code>2024-05-01</code>.
  ///
  /// Parameter [blockedWindows] :
  /// Add, change, or remove windows of days and times for when you can,
  /// optionally, block Route 53 ARC from starting a practice run for a
  /// resource.
  ///
  /// The format for blocked windows is: DAY:HH:SS-DAY:HH:SS. Keep in mind, when
  /// you specify dates, that dates and times for practice runs are in UTC.
  /// Also, be aware of potential time adjustments that might be required for
  /// daylight saving time differences. Separate multiple blocked windows with
  /// spaces.
  ///
  /// For example, say you run business report summaries three days a week. For
  /// this scenario, you might set the following recurring days and times as
  /// blocked windows, for example: <code>MON-20:30-21:30 WED-20:30-21:30
  /// FRI-20:30-21:30</code>.
  ///
  /// Parameter [blockingAlarms] :
  /// Add, change, or remove the Amazon CloudWatch alarm that you optionally
  /// specify as the blocking alarm for practice runs.
  ///
  /// Parameter [outcomeAlarms] :
  /// Specify a new the Amazon CloudWatch alarm as the outcome alarm for
  /// practice runs.
  Future<UpdatePracticeRunConfigurationResponse>
      updatePracticeRunConfiguration({
    required String resourceIdentifier,
    List<String>? blockedDates,
    List<String>? blockedWindows,
    List<ControlCondition>? blockingAlarms,
    List<ControlCondition>? outcomeAlarms,
  }) async {
    final $payload = <String, dynamic>{
      if (blockedDates != null) 'blockedDates': blockedDates,
      if (blockedWindows != null) 'blockedWindows': blockedWindows,
      if (blockingAlarms != null) 'blockingAlarms': blockingAlarms,
      if (outcomeAlarms != null) 'outcomeAlarms': outcomeAlarms,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/configuration/${Uri.encodeComponent(resourceIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePracticeRunConfigurationResponse.fromJson(response);
  }

  /// You can update the zonal autoshift status for a resource, to enable or
  /// disable zonal autoshift. When zonal autoshift is <code>ENABLED</code>,
  /// Amazon Web Services shifts away resource traffic from an Availability
  /// Zone, on your behalf, when Amazon Web Services determines that there's an
  /// issue in the Availability Zone that could potentially affect customers.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The identifier for the resource that you want to update the zonal
  /// autoshift configuration for. The identifier is the Amazon Resource Name
  /// (ARN) for the resource.
  ///
  /// Parameter [zonalAutoshiftStatus] :
  /// The zonal autoshift status for the resource that you want to update the
  /// zonal autoshift configuration for.
  Future<UpdateZonalAutoshiftConfigurationResponse>
      updateZonalAutoshiftConfiguration({
    required String resourceIdentifier,
    required ZonalAutoshiftStatus zonalAutoshiftStatus,
  }) async {
    final $payload = <String, dynamic>{
      'zonalAutoshiftStatus': zonalAutoshiftStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/managedresources/${Uri.encodeComponent(resourceIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateZonalAutoshiftConfigurationResponse.fromJson(response);
  }

  /// Update an active zonal shift in Amazon Route 53 Application Recovery
  /// Controller in your Amazon Web Services account. You can update a zonal
  /// shift to set a new expiration, or edit or replace the comment for the
  /// zonal shift.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [zonalShiftId] :
  /// The identifier of a zonal shift.
  ///
  /// Parameter [comment] :
  /// A comment that you enter about the zonal shift. Only the latest comment is
  /// retained; no comment history is maintained. A new comment overwrites any
  /// existing comment string.
  ///
  /// Parameter [expiresIn] :
  /// The length of time that you want a zonal shift to be active, which Route
  /// 53 ARC converts to an expiry time (expiration time). Zonal shifts are
  /// temporary. You can set a zonal shift to be active initially for up to
  /// three days (72 hours).
  ///
  /// If you want to still keep traffic away from an Availability Zone, you can
  /// update the zonal shift and set a new expiration. You can also cancel a
  /// zonal shift, before it expires, for example, if you're ready to restore
  /// traffic to the Availability Zone.
  ///
  /// To set a length of time for a zonal shift to be active, specify a whole
  /// number, and then one of the following, with no space:
  ///
  /// <ul>
  /// <li>
  /// <b>A lowercase letter m:</b> To specify that the value is in minutes.
  /// </li>
  /// <li>
  /// <b>A lowercase letter h:</b> To specify that the value is in hours.
  /// </li>
  /// </ul>
  /// For example: <code>20h</code> means the zonal shift expires in 20 hours.
  /// <code>120m</code> means the zonal shift expires in 120 minutes (2 hours).
  Future<ZonalShift> updateZonalShift({
    required String zonalShiftId,
    String? comment,
    String? expiresIn,
  }) async {
    final $payload = <String, dynamic>{
      if (comment != null) 'comment': comment,
      if (expiresIn != null) 'expiresIn': expiresIn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/zonalshifts/${Uri.encodeComponent(zonalShiftId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ZonalShift.fromJson(response);
  }
}

enum AppliedStatus {
  applied,
  notApplied,
}

extension AppliedStatusValueExtension on AppliedStatus {
  String toValue() {
    switch (this) {
      case AppliedStatus.applied:
        return 'APPLIED';
      case AppliedStatus.notApplied:
        return 'NOT_APPLIED';
    }
  }
}

extension AppliedStatusFromString on String {
  AppliedStatus toAppliedStatus() {
    switch (this) {
      case 'APPLIED':
        return AppliedStatus.applied;
      case 'NOT_APPLIED':
        return AppliedStatus.notApplied;
    }
    throw Exception('$this is not known in enum AppliedStatus');
  }
}

enum AutoshiftAppliedStatus {
  applied,
  notApplied,
}

extension AutoshiftAppliedStatusValueExtension on AutoshiftAppliedStatus {
  String toValue() {
    switch (this) {
      case AutoshiftAppliedStatus.applied:
        return 'APPLIED';
      case AutoshiftAppliedStatus.notApplied:
        return 'NOT_APPLIED';
    }
  }
}

extension AutoshiftAppliedStatusFromString on String {
  AutoshiftAppliedStatus toAutoshiftAppliedStatus() {
    switch (this) {
      case 'APPLIED':
        return AutoshiftAppliedStatus.applied;
      case 'NOT_APPLIED':
        return AutoshiftAppliedStatus.notApplied;
    }
    throw Exception('$this is not known in enum AutoshiftAppliedStatus');
  }
}

enum AutoshiftExecutionStatus {
  active,
  completed,
}

extension AutoshiftExecutionStatusValueExtension on AutoshiftExecutionStatus {
  String toValue() {
    switch (this) {
      case AutoshiftExecutionStatus.active:
        return 'ACTIVE';
      case AutoshiftExecutionStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension AutoshiftExecutionStatusFromString on String {
  AutoshiftExecutionStatus toAutoshiftExecutionStatus() {
    switch (this) {
      case 'ACTIVE':
        return AutoshiftExecutionStatus.active;
      case 'COMPLETED':
        return AutoshiftExecutionStatus.completed;
    }
    throw Exception('$this is not known in enum AutoshiftExecutionStatus');
  }
}

/// A complex structure that lists an autoshift that is currently active for a
/// managed resource and information about the autoshift.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/r53recovery/latest/dg/arc-zonal-autoshift.how-it-works.html">How
/// zonal autoshift and practice runs work</a> in the Amazon Route 53
/// Application Recovery Controller Developer Guide.
class AutoshiftInResource {
  /// The <code>appliedStatus</code> field specifies which application traffic
  /// shift is in effect for a resource when there is more than one traffic shift
  /// active. There can be more than one application traffic shift in progress at
  /// the same time - that is, practice run zonal shifts, customer-started zonal
  /// shifts, or an autoshift. The <code>appliedStatus</code> field for an
  /// autoshift for a resource can have one of two values: <code>APPLIED</code> or
  /// <code>NOT_APPLIED</code>. The zonal shift or autoshift that is currently in
  /// effect for the resource has an applied status set to <code>APPLIED</code>.
  ///
  /// The overall principle for precedence is that zonal shifts that you start as
  /// a customer take precedence autoshifts, which take precedence over practice
  /// runs. That is, customer-started zonal shifts &gt; autoshifts &gt; practice
  /// run zonal shifts.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/arc-zonal-autoshift.how-it-works.html">How
  /// zonal autoshift and practice runs work</a> in the Amazon Route 53
  /// Application Recovery Controller Developer Guide.
  final AutoshiftAppliedStatus appliedStatus;

  /// The Availability Zone that traffic is shifted away from for a resource, when
  /// Amazon Web Services starts an autoshift. Until the autoshift ends, traffic
  /// for the resource is instead directed to other Availability Zones in the
  /// Amazon Web Services Region. An autoshift can end for a resource, for
  /// example, when Amazon Web Services ends the autoshift for the Availability
  /// Zone or when you disable zonal autoshift for the resource.
  final String awayFrom;

  /// The time (UTC) when the autoshift started.
  final DateTime startTime;

  AutoshiftInResource({
    required this.appliedStatus,
    required this.awayFrom,
    required this.startTime,
  });

  factory AutoshiftInResource.fromJson(Map<String, dynamic> json) {
    return AutoshiftInResource(
      appliedStatus:
          (json['appliedStatus'] as String).toAutoshiftAppliedStatus(),
      awayFrom: json['awayFrom'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final appliedStatus = this.appliedStatus;
    final awayFrom = this.awayFrom;
    final startTime = this.startTime;
    return {
      'appliedStatus': appliedStatus.toValue(),
      'awayFrom': awayFrom,
      'startTime': unixTimestampToJson(startTime),
    };
  }
}

/// Information about an autoshift. Amazon Web Services starts an autoshift to
/// temporarily move traffic for a resource away from an Availability Zone in an
/// Amazon Web Services Region when Amazon Web Services determines that there's
/// an issue in the Availability Zone that could potentially affect customers.
/// You can configure zonal autoshift in Route 53 ARC for managed resources in
/// your Amazon Web Services account in a Region. Supported Amazon Web Services
/// resources are automatically registered with Route 53 ARC.
///
/// Autoshifts are temporary. When the Availability Zone recovers, Amazon Web
/// Services ends the autoshift, and traffic for the resource is no longer
/// directed to the other Availability Zones in the Region.
///
/// You can stop an autoshift for a resource by disabling zonal autoshift.
class AutoshiftSummary {
  /// The Availability Zone that traffic is shifted away from for a resource when
  /// Amazon Web Services starts an autoshift. Until the autoshift ends, traffic
  /// for the resource is instead directed to other Availability Zones in the
  /// Amazon Web Services Region. An autoshift can end for a resource, for
  /// example, when Amazon Web Services ends the autoshift for the Availability
  /// Zone or when you disable zonal autoshift for the resource.
  final String awayFrom;

  /// The time (in UTC) when the autoshift ended.
  final DateTime endTime;

  /// The time (in UTC) when the autoshift started.
  final DateTime startTime;

  /// The status for an autoshift.
  final AutoshiftExecutionStatus status;

  AutoshiftSummary({
    required this.awayFrom,
    required this.endTime,
    required this.startTime,
    required this.status,
  });

  factory AutoshiftSummary.fromJson(Map<String, dynamic> json) {
    return AutoshiftSummary(
      awayFrom: json['awayFrom'] as String,
      endTime: nonNullableTimeStampFromJson(json['endTime'] as Object),
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      status: (json['status'] as String).toAutoshiftExecutionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final awayFrom = this.awayFrom;
    final endTime = this.endTime;
    final startTime = this.startTime;
    final status = this.status;
    return {
      'awayFrom': awayFrom,
      'endTime': unixTimestampToJson(endTime),
      'startTime': unixTimestampToJson(startTime),
      'status': status.toValue(),
    };
  }
}

/// A control condition is an alarm that you specify for a practice run. When
/// you configure practice runs with zonal autoshift for a resource, you specify
/// Amazon CloudWatch alarms, which you create in CloudWatch to use with the
/// practice run. The alarms that you specify are an <i>outcome alarm</i>, to
/// monitor application health during practice runs and, optionally, a
/// <i>blocking alarm</i>, to block practice runs from starting.
///
/// Control condition alarms do not apply for autoshifts.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/r53recovery/latest/dg/arc-zonal-autoshift.considerations.html">
/// Considerations when you configure zonal autoshift</a> in the Amazon Route 53
/// Application Recovery Controller Developer Guide.
class ControlCondition {
  /// The Amazon Resource Name (ARN) for the Amazon CloudWatch alarm that you
  /// specify as a control condition for a practice run.
  final String alarmIdentifier;

  /// The type of alarm specified for a practice run. The only valid value is
  /// <code>CLOUDWATCH</code>.
  final ControlConditionType type;

  ControlCondition({
    required this.alarmIdentifier,
    required this.type,
  });

  factory ControlCondition.fromJson(Map<String, dynamic> json) {
    return ControlCondition(
      alarmIdentifier: json['alarmIdentifier'] as String,
      type: (json['type'] as String).toControlConditionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final alarmIdentifier = this.alarmIdentifier;
    final type = this.type;
    return {
      'alarmIdentifier': alarmIdentifier,
      'type': type.toValue(),
    };
  }
}

enum ControlConditionType {
  cloudwatch,
}

extension ControlConditionTypeValueExtension on ControlConditionType {
  String toValue() {
    switch (this) {
      case ControlConditionType.cloudwatch:
        return 'CLOUDWATCH';
    }
  }
}

extension ControlConditionTypeFromString on String {
  ControlConditionType toControlConditionType() {
    switch (this) {
      case 'CLOUDWATCH':
        return ControlConditionType.cloudwatch;
    }
    throw Exception('$this is not known in enum ControlConditionType');
  }
}

class CreatePracticeRunConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the resource that you configured the
  /// practice run for.
  final String arn;

  /// The name of the resource that you configured the practice run for.
  final String name;

  /// A practice run configuration for a resource. Configurations include the
  /// outcome alarm that you specify for practice runs, and, optionally, a
  /// blocking alarm and blocking dates and windows.
  final PracticeRunConfiguration practiceRunConfiguration;

  /// The status for zonal autoshift for a resource. When you specify the
  /// autoshift status as <code>ENABLED</code>, Amazon Web Services shifts traffic
  /// away from shifts away application resource traffic from an Availability
  /// Zone, on your behalf, when Amazon Web Services determines that there's an
  /// issue in the Availability Zone that could potentially affect customers.
  ///
  /// When you enable zonal autoshift, you must also configure practice runs for
  /// the resource.
  final ZonalAutoshiftStatus zonalAutoshiftStatus;

  CreatePracticeRunConfigurationResponse({
    required this.arn,
    required this.name,
    required this.practiceRunConfiguration,
    required this.zonalAutoshiftStatus,
  });

  factory CreatePracticeRunConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreatePracticeRunConfigurationResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
      practiceRunConfiguration: PracticeRunConfiguration.fromJson(
          json['practiceRunConfiguration'] as Map<String, dynamic>),
      zonalAutoshiftStatus:
          (json['zonalAutoshiftStatus'] as String).toZonalAutoshiftStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final practiceRunConfiguration = this.practiceRunConfiguration;
    final zonalAutoshiftStatus = this.zonalAutoshiftStatus;
    return {
      'arn': arn,
      'name': name,
      'practiceRunConfiguration': practiceRunConfiguration,
      'zonalAutoshiftStatus': zonalAutoshiftStatus.toValue(),
    };
  }
}

class DeletePracticeRunConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the resource that you deleted the practice
  /// run for.
  final String arn;

  /// The name of the resource that you deleted the practice run for.
  final String name;

  /// The status of zonal autoshift for the resource.
  final ZonalAutoshiftStatus zonalAutoshiftStatus;

  DeletePracticeRunConfigurationResponse({
    required this.arn,
    required this.name,
    required this.zonalAutoshiftStatus,
  });

  factory DeletePracticeRunConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeletePracticeRunConfigurationResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
      zonalAutoshiftStatus:
          (json['zonalAutoshiftStatus'] as String).toZonalAutoshiftStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final zonalAutoshiftStatus = this.zonalAutoshiftStatus;
    return {
      'arn': arn,
      'name': name,
      'zonalAutoshiftStatus': zonalAutoshiftStatus.toValue(),
    };
  }
}

class GetManagedResourceResponse {
  /// A collection of key-value pairs that indicate whether resources are active
  /// in Availability Zones or not. The key name is the Availability Zone where
  /// the resource is deployed. The value is 1 or 0.
  final Map<String, double> appliedWeights;

  /// The zonal shifts that are currently active for a resource.
  final List<ZonalShiftInResource> zonalShifts;

  /// The Amazon Resource Name (ARN) for the resource.
  final String? arn;

  /// An array of the autoshifts that are active for the resource.
  final List<AutoshiftInResource>? autoshifts;

  /// The name of the resource.
  final String? name;

  /// The practice run configuration for zonal autoshift that's associated with
  /// the resource.
  final PracticeRunConfiguration? practiceRunConfiguration;

  /// The status for zonal autoshift for a resource. When the autoshift status is
  /// <code>ENABLED</code>, Amazon Web Services shifts traffic for a resource away
  /// from an Availability Zone, on your behalf, when Amazon Web Services
  /// determines that there's an issue in the Availability Zone that could
  /// potentially affect customers.
  final ZonalAutoshiftStatus? zonalAutoshiftStatus;

  GetManagedResourceResponse({
    required this.appliedWeights,
    required this.zonalShifts,
    this.arn,
    this.autoshifts,
    this.name,
    this.practiceRunConfiguration,
    this.zonalAutoshiftStatus,
  });

  factory GetManagedResourceResponse.fromJson(Map<String, dynamic> json) {
    return GetManagedResourceResponse(
      appliedWeights: (json['appliedWeights'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as double)),
      zonalShifts: (json['zonalShifts'] as List)
          .whereNotNull()
          .map((e) => ZonalShiftInResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      arn: json['arn'] as String?,
      autoshifts: (json['autoshifts'] as List?)
          ?.whereNotNull()
          .map((e) => AutoshiftInResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      practiceRunConfiguration: json['practiceRunConfiguration'] != null
          ? PracticeRunConfiguration.fromJson(
              json['practiceRunConfiguration'] as Map<String, dynamic>)
          : null,
      zonalAutoshiftStatus:
          (json['zonalAutoshiftStatus'] as String?)?.toZonalAutoshiftStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final appliedWeights = this.appliedWeights;
    final zonalShifts = this.zonalShifts;
    final arn = this.arn;
    final autoshifts = this.autoshifts;
    final name = this.name;
    final practiceRunConfiguration = this.practiceRunConfiguration;
    final zonalAutoshiftStatus = this.zonalAutoshiftStatus;
    return {
      'appliedWeights': appliedWeights,
      'zonalShifts': zonalShifts,
      if (arn != null) 'arn': arn,
      if (autoshifts != null) 'autoshifts': autoshifts,
      if (name != null) 'name': name,
      if (practiceRunConfiguration != null)
        'practiceRunConfiguration': practiceRunConfiguration,
      if (zonalAutoshiftStatus != null)
        'zonalAutoshiftStatus': zonalAutoshiftStatus.toValue(),
    };
  }
}

class ListAutoshiftsResponse {
  /// The items in the response list.
  final List<AutoshiftSummary>? items;

  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response to
  /// request the next page of results.
  final String? nextToken;

  ListAutoshiftsResponse({
    this.items,
    this.nextToken,
  });

  factory ListAutoshiftsResponse.fromJson(Map<String, dynamic> json) {
    return ListAutoshiftsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => AutoshiftSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListManagedResourcesResponse {
  /// The items in the response list.
  final List<ManagedResourceSummary> items;

  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response to
  /// request the next page of results.
  final String? nextToken;

  ListManagedResourcesResponse({
    required this.items,
    this.nextToken,
  });

  factory ListManagedResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListManagedResourcesResponse(
      items: (json['items'] as List)
          .whereNotNull()
          .map(
              (e) => ManagedResourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListZonalShiftsResponse {
  /// The items in the response list.
  final List<ZonalShiftSummary>? items;

  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>NextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>NextToken</code> response to
  /// request the next page of results.
  final String? nextToken;

  ListZonalShiftsResponse({
    this.items,
    this.nextToken,
  });

  factory ListZonalShiftsResponse.fromJson(Map<String, dynamic> json) {
    return ListZonalShiftsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => ZonalShiftSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// A complex structure for a managed resource in an Amazon Web Services account
/// with information about zonal shifts and autoshifts.
///
/// A managed resource is a load balancer that has been registered with Route 53
/// ARC by Elastic Load Balancing. You can start a zonal shift in Route 53 ARC
/// for a managed resource to temporarily move traffic for the resource away
/// from an Availability Zone in an Amazon Web Services Region. You can also
/// configure zonal autoshift for a managed resource.
/// <note>
/// At this time, managed resources are Network Load Balancers and Application
/// Load Balancers with cross-zone load balancing turned off.
/// </note>
class ManagedResourceSummary {
  /// The Availability Zones that a resource is deployed in.
  final List<String> availabilityZones;

  /// A collection of key-value pairs that indicate whether resources are active
  /// in Availability Zones or not. The key name is the Availability Zone where
  /// the resource is deployed. The value is 1 or 0.
  final Map<String, double>? appliedWeights;

  /// The Amazon Resource Name (ARN) for the managed resource.
  final String? arn;

  /// An array of the autoshifts that have been completed for a resource.
  final List<AutoshiftInResource>? autoshifts;

  /// The name of the managed resource.
  final String? name;

  /// This status tracks whether a practice run configuration exists for a
  /// resource. When you configure a practice run for a resource so that a
  /// practice run configuration exists, Route 53 ARC sets this value to
  /// <code>ENABLED</code>. If a you have not configured a practice run for the
  /// resource, or delete a practice run configuration, Route 53 ARC sets the
  /// value to <code>DISABLED</code>.
  ///
  /// Route 53 ARC updates this status; you can't set a practice run status to
  /// <code>ENABLED</code> or <code>DISABLED</code>.
  final ZonalAutoshiftStatus? practiceRunStatus;

  /// The status of autoshift for a resource. When you configure zonal autoshift
  /// for a resource, you can set the value of the status to <code>ENABLED</code>
  /// or <code>DISABLED</code>.
  final ZonalAutoshiftStatus? zonalAutoshiftStatus;

  /// An array of the zonal shifts for a resource.
  final List<ZonalShiftInResource>? zonalShifts;

  ManagedResourceSummary({
    required this.availabilityZones,
    this.appliedWeights,
    this.arn,
    this.autoshifts,
    this.name,
    this.practiceRunStatus,
    this.zonalAutoshiftStatus,
    this.zonalShifts,
  });

  factory ManagedResourceSummary.fromJson(Map<String, dynamic> json) {
    return ManagedResourceSummary(
      availabilityZones: (json['availabilityZones'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      appliedWeights: (json['appliedWeights'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as double)),
      arn: json['arn'] as String?,
      autoshifts: (json['autoshifts'] as List?)
          ?.whereNotNull()
          .map((e) => AutoshiftInResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      practiceRunStatus:
          (json['practiceRunStatus'] as String?)?.toZonalAutoshiftStatus(),
      zonalAutoshiftStatus:
          (json['zonalAutoshiftStatus'] as String?)?.toZonalAutoshiftStatus(),
      zonalShifts: (json['zonalShifts'] as List?)
          ?.whereNotNull()
          .map((e) => ZonalShiftInResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final appliedWeights = this.appliedWeights;
    final arn = this.arn;
    final autoshifts = this.autoshifts;
    final name = this.name;
    final practiceRunStatus = this.practiceRunStatus;
    final zonalAutoshiftStatus = this.zonalAutoshiftStatus;
    final zonalShifts = this.zonalShifts;
    return {
      'availabilityZones': availabilityZones,
      if (appliedWeights != null) 'appliedWeights': appliedWeights,
      if (arn != null) 'arn': arn,
      if (autoshifts != null) 'autoshifts': autoshifts,
      if (name != null) 'name': name,
      if (practiceRunStatus != null)
        'practiceRunStatus': practiceRunStatus.toValue(),
      if (zonalAutoshiftStatus != null)
        'zonalAutoshiftStatus': zonalAutoshiftStatus.toValue(),
      if (zonalShifts != null) 'zonalShifts': zonalShifts,
    };
  }
}

/// A practice run configuration for a resource includes the Amazon CloudWatch
/// alarms that you've specified for a practice run, as well as any blocked
/// dates or blocked windows for the practice run.
///
/// You can update or delete a practice run configuration. Before you delete a
/// practice run configuration, you must disable zonal autoshift for the
/// resource. A practice run configuration is required when zonal autoshift is
/// enabled.
class PracticeRunConfiguration {
  /// The <i>outcome alarm</i> for practice runs is an alarm that you specify that
  /// ends a practice run when the alarm is in an <code>ALARM</code> state.
  final List<ControlCondition> outcomeAlarms;

  /// An array of one or more dates that you can specify when Amazon Web Services
  /// does not start practice runs for a resource.
  ///
  /// Specify blocked dates, in UTC, in the format <code>YYYY-MM-DD</code>,
  /// separated by spaces.
  final List<String>? blockedDates;

  /// An array of one or more windows of days and times that you can block Route
  /// 53 ARC from starting practice runs for a resource.
  ///
  /// Specify the blocked windows in UTC, using the format
  /// <code>DAY:HH:MM-DAY:HH:MM</code>, separated by spaces. For example,
  /// <code>MON:18:30-MON:19:30 TUE:18:30-TUE:19:30</code>.
  final List<String>? blockedWindows;

  /// The <i>blocking alarm</i> for practice runs is an optional alarm that you
  /// can specify that blocks practice runs when the alarm is in an
  /// <code>ALARM</code> state.
  final List<ControlCondition>? blockingAlarms;

  PracticeRunConfiguration({
    required this.outcomeAlarms,
    this.blockedDates,
    this.blockedWindows,
    this.blockingAlarms,
  });

  factory PracticeRunConfiguration.fromJson(Map<String, dynamic> json) {
    return PracticeRunConfiguration(
      outcomeAlarms: (json['outcomeAlarms'] as List)
          .whereNotNull()
          .map((e) => ControlCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      blockedDates: (json['blockedDates'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      blockedWindows: (json['blockedWindows'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      blockingAlarms: (json['blockingAlarms'] as List?)
          ?.whereNotNull()
          .map((e) => ControlCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final outcomeAlarms = this.outcomeAlarms;
    final blockedDates = this.blockedDates;
    final blockedWindows = this.blockedWindows;
    final blockingAlarms = this.blockingAlarms;
    return {
      'outcomeAlarms': outcomeAlarms,
      if (blockedDates != null) 'blockedDates': blockedDates,
      if (blockedWindows != null) 'blockedWindows': blockedWindows,
      if (blockingAlarms != null) 'blockingAlarms': blockingAlarms,
    };
  }
}

enum PracticeRunOutcome {
  failed,
  interrupted,
  pending,
  succeeded,
}

extension PracticeRunOutcomeValueExtension on PracticeRunOutcome {
  String toValue() {
    switch (this) {
      case PracticeRunOutcome.failed:
        return 'FAILED';
      case PracticeRunOutcome.interrupted:
        return 'INTERRUPTED';
      case PracticeRunOutcome.pending:
        return 'PENDING';
      case PracticeRunOutcome.succeeded:
        return 'SUCCEEDED';
    }
  }
}

extension PracticeRunOutcomeFromString on String {
  PracticeRunOutcome toPracticeRunOutcome() {
    switch (this) {
      case 'FAILED':
        return PracticeRunOutcome.failed;
      case 'INTERRUPTED':
        return PracticeRunOutcome.interrupted;
      case 'PENDING':
        return PracticeRunOutcome.pending;
      case 'SUCCEEDED':
        return PracticeRunOutcome.succeeded;
    }
    throw Exception('$this is not known in enum PracticeRunOutcome');
  }
}

class UpdatePracticeRunConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the resource that you updated the practice
  /// run for.
  final String arn;

  /// The name of the resource that you updated the practice run for.
  final String name;

  /// The practice run configuration that was updated.
  final PracticeRunConfiguration practiceRunConfiguration;

  /// The zonal autoshift status for the resource that you updated the practice
  /// run for.
  final ZonalAutoshiftStatus zonalAutoshiftStatus;

  UpdatePracticeRunConfigurationResponse({
    required this.arn,
    required this.name,
    required this.practiceRunConfiguration,
    required this.zonalAutoshiftStatus,
  });

  factory UpdatePracticeRunConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdatePracticeRunConfigurationResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
      practiceRunConfiguration: PracticeRunConfiguration.fromJson(
          json['practiceRunConfiguration'] as Map<String, dynamic>),
      zonalAutoshiftStatus:
          (json['zonalAutoshiftStatus'] as String).toZonalAutoshiftStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final practiceRunConfiguration = this.practiceRunConfiguration;
    final zonalAutoshiftStatus = this.zonalAutoshiftStatus;
    return {
      'arn': arn,
      'name': name,
      'practiceRunConfiguration': practiceRunConfiguration,
      'zonalAutoshiftStatus': zonalAutoshiftStatus.toValue(),
    };
  }
}

class UpdateZonalAutoshiftConfigurationResponse {
  /// The identifier for the resource that you updated the zonal autoshift
  /// configuration for. The identifier is the Amazon Resource Name (ARN) for the
  /// resource.
  final String resourceIdentifier;

  /// The zonal autoshift status for the resource that you updated the zonal
  /// autoshift configuration for.
  final ZonalAutoshiftStatus zonalAutoshiftStatus;

  UpdateZonalAutoshiftConfigurationResponse({
    required this.resourceIdentifier,
    required this.zonalAutoshiftStatus,
  });

  factory UpdateZonalAutoshiftConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateZonalAutoshiftConfigurationResponse(
      resourceIdentifier: json['resourceIdentifier'] as String,
      zonalAutoshiftStatus:
          (json['zonalAutoshiftStatus'] as String).toZonalAutoshiftStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceIdentifier = this.resourceIdentifier;
    final zonalAutoshiftStatus = this.zonalAutoshiftStatus;
    return {
      'resourceIdentifier': resourceIdentifier,
      'zonalAutoshiftStatus': zonalAutoshiftStatus.toValue(),
    };
  }
}

enum ZonalAutoshiftStatus {
  enabled,
  disabled,
}

extension ZonalAutoshiftStatusValueExtension on ZonalAutoshiftStatus {
  String toValue() {
    switch (this) {
      case ZonalAutoshiftStatus.enabled:
        return 'ENABLED';
      case ZonalAutoshiftStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension ZonalAutoshiftStatusFromString on String {
  ZonalAutoshiftStatus toZonalAutoshiftStatus() {
    switch (this) {
      case 'ENABLED':
        return ZonalAutoshiftStatus.enabled;
      case 'DISABLED':
        return ZonalAutoshiftStatus.disabled;
    }
    throw Exception('$this is not known in enum ZonalAutoshiftStatus');
  }
}

class ZonalShift {
  /// The Availability Zone that traffic is moved away from for a resource when
  /// you start a zonal shift. Until the zonal shift expires or you cancel it,
  /// traffic for the resource is instead moved to other Availability Zones in the
  /// Amazon Web Services Region.
  final String awayFrom;

  /// A comment that you enter about the zonal shift. Only the latest comment is
  /// retained; no comment history is maintained. A new comment overwrites any
  /// existing comment string.
  final String comment;

  /// The expiry time (expiration time) for a customer-started zonal shift. A
  /// zonal shift is temporary and must be set to expire when you start the zonal
  /// shift. You can initially set a zonal shift to expire in a maximum of three
  /// days (72 hours). However, you can update a zonal shift to set a new
  /// expiration at any time.
  ///
  /// When you start a zonal shift, you specify how long you want it to be active,
  /// which Route 53 ARC converts to an expiry time (expiration time). You can
  /// cancel a zonal shift when you're ready to restore traffic to the
  /// Availability Zone, or just wait for it to expire. Or you can update the
  /// zonal shift to specify another length of time to expire in.
  final DateTime expiryTime;

  /// The identifier for the resource to shift away traffic for. The identifier is
  /// the Amazon Resource Name (ARN) for the resource.
  ///
  /// At this time, supported resources are Network Load Balancers and Application
  /// Load Balancers with cross-zone load balancing turned off.
  final String resourceIdentifier;

  /// The time (UTC) when the zonal shift starts.
  final DateTime startTime;

  /// A status for a zonal shift.
  ///
  /// The <code>Status</code> for a zonal shift can have one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <b>ACTIVE:</b> The zonal shift has been started and active.
  /// </li>
  /// <li>
  /// <b>EXPIRED:</b> The zonal shift has expired (the expiry time was exceeded).
  /// </li>
  /// <li>
  /// <b>CANCELED:</b> The zonal shift was canceled.
  /// </li>
  /// </ul>
  final ZonalShiftStatus status;

  /// The identifier of a zonal shift.
  final String zonalShiftId;

  ZonalShift({
    required this.awayFrom,
    required this.comment,
    required this.expiryTime,
    required this.resourceIdentifier,
    required this.startTime,
    required this.status,
    required this.zonalShiftId,
  });

  factory ZonalShift.fromJson(Map<String, dynamic> json) {
    return ZonalShift(
      awayFrom: json['awayFrom'] as String,
      comment: json['comment'] as String,
      expiryTime: nonNullableTimeStampFromJson(json['expiryTime'] as Object),
      resourceIdentifier: json['resourceIdentifier'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      status: (json['status'] as String).toZonalShiftStatus(),
      zonalShiftId: json['zonalShiftId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final awayFrom = this.awayFrom;
    final comment = this.comment;
    final expiryTime = this.expiryTime;
    final resourceIdentifier = this.resourceIdentifier;
    final startTime = this.startTime;
    final status = this.status;
    final zonalShiftId = this.zonalShiftId;
    return {
      'awayFrom': awayFrom,
      'comment': comment,
      'expiryTime': unixTimestampToJson(expiryTime),
      'resourceIdentifier': resourceIdentifier,
      'startTime': unixTimestampToJson(startTime),
      'status': status.toValue(),
      'zonalShiftId': zonalShiftId,
    };
  }
}

/// A complex structure that lists the zonal shifts for a managed resource and
/// their statuses for the resource.
class ZonalShiftInResource {
  /// The <code>appliedStatus</code> field specifies which application traffic
  /// shift is in effect for a resource when there is more than one traffic shift
  /// active. There can be more than one application traffic shift in progress at
  /// the same time - that is, practice run zonal shifts, customer-started zonal
  /// shifts, or an autoshift. The <code>appliedStatus</code> field for an
  /// autoshift for a resource can have one of two values: <code>APPLIED</code> or
  /// <code>NOT_APPLIED</code>. The zonal shift or autoshift that is currently in
  /// effect for the resource has an applied status set to <code>APPLIED</code>.
  ///
  /// The overall principle for precedence is that zonal shifts that you start as
  /// a customer take precedence autoshifts, which take precedence over practice
  /// runs. That is, customer-started zonal shifts &gt; autoshifts &gt; practice
  /// run zonal shifts.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/arc-zonal-autoshift.how-it-works.html">How
  /// zonal autoshift and practice runs work</a> in the Amazon Route 53
  /// Application Recovery Controller Developer Guide.
  final AppliedStatus appliedStatus;

  /// The Availability Zone that traffic is moved away from for a resource when
  /// you start a zonal shift. Until the zonal shift expires or you cancel it,
  /// traffic for the resource is instead moved to other Availability Zones in the
  /// Amazon Web Services Region.
  final String awayFrom;

  /// A comment that you enter about the zonal shift. Only the latest comment is
  /// retained; no comment history is maintained. That is, a new comment
  /// overwrites any existing comment string.
  final String comment;

  /// The expiry time (expiration time) for a customer-started zonal shift. A
  /// zonal shift is temporary and must be set to expire when you start the zonal
  /// shift. You can initially set a zonal shift to expire in a maximum of three
  /// days (72 hours). However, you can update a zonal shift to set a new
  /// expiration at any time.
  ///
  /// When you start a zonal shift, you specify how long you want it to be active,
  /// which Route 53 ARC converts to an expiry time (expiration time). You can
  /// cancel a zonal shift when you're ready to restore traffic to the
  /// Availability Zone, or just wait for it to expire. Or you can update the
  /// zonal shift to specify another length of time to expire in.
  final DateTime expiryTime;

  /// The identifier for the resource to include in a zonal shift. The identifier
  /// is the Amazon Resource Name (ARN) for the resource.
  ///
  /// At this time, you can only start a zonal shift for Network Load Balancers
  /// and Application Load Balancers with cross-zone load balancing turned off.
  final String resourceIdentifier;

  /// The time (UTC) when the zonal shift starts.
  final DateTime startTime;

  /// The identifier of a zonal shift.
  final String zonalShiftId;

  /// The outcome, or end state, returned for a practice run. The following values
  /// can be returned:
  ///
  /// <ul>
  /// <li>
  /// <b>PENDING:</b> Outcome value when a practice run is in progress.
  /// </li>
  /// <li>
  /// <b>SUCCEEDED:</b> Outcome value when the outcome alarm specified for the
  /// practice run configuration does not go into an <code>ALARM</code> state
  /// during the practice run, and the practice run was not interrupted before it
  /// completed the expected 30 minute zonal shift.
  /// </li>
  /// <li>
  /// <b>INTERRUPTED:</b> Outcome value when the practice run was stopped before
  /// the expected 30 minute zonal shift duration, or there was another problem
  /// with the practice run that created an inconclusive outcome.
  /// </li>
  /// <li>
  /// <b>FAILED:</b> Outcome value when the outcome alarm specified for the
  /// practice run configuration goes into an <code>ALARM</code> state during the
  /// practice run, and the practice run was not interrupted before it completed.
  /// </li>
  /// </ul>
  /// For more information about practice run outcomes, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/arc-zonal-autoshift.configure.html">
  /// Considerations when you configure zonal autoshift</a> in the Amazon Route 53
  /// Application Recovery Controller Developer Guide.
  final PracticeRunOutcome? practiceRunOutcome;

  ZonalShiftInResource({
    required this.appliedStatus,
    required this.awayFrom,
    required this.comment,
    required this.expiryTime,
    required this.resourceIdentifier,
    required this.startTime,
    required this.zonalShiftId,
    this.practiceRunOutcome,
  });

  factory ZonalShiftInResource.fromJson(Map<String, dynamic> json) {
    return ZonalShiftInResource(
      appliedStatus: (json['appliedStatus'] as String).toAppliedStatus(),
      awayFrom: json['awayFrom'] as String,
      comment: json['comment'] as String,
      expiryTime: nonNullableTimeStampFromJson(json['expiryTime'] as Object),
      resourceIdentifier: json['resourceIdentifier'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      zonalShiftId: json['zonalShiftId'] as String,
      practiceRunOutcome:
          (json['practiceRunOutcome'] as String?)?.toPracticeRunOutcome(),
    );
  }

  Map<String, dynamic> toJson() {
    final appliedStatus = this.appliedStatus;
    final awayFrom = this.awayFrom;
    final comment = this.comment;
    final expiryTime = this.expiryTime;
    final resourceIdentifier = this.resourceIdentifier;
    final startTime = this.startTime;
    final zonalShiftId = this.zonalShiftId;
    final practiceRunOutcome = this.practiceRunOutcome;
    return {
      'appliedStatus': appliedStatus.toValue(),
      'awayFrom': awayFrom,
      'comment': comment,
      'expiryTime': unixTimestampToJson(expiryTime),
      'resourceIdentifier': resourceIdentifier,
      'startTime': unixTimestampToJson(startTime),
      'zonalShiftId': zonalShiftId,
      if (practiceRunOutcome != null)
        'practiceRunOutcome': practiceRunOutcome.toValue(),
    };
  }
}

enum ZonalShiftStatus {
  active,
  expired,
  canceled,
}

extension ZonalShiftStatusValueExtension on ZonalShiftStatus {
  String toValue() {
    switch (this) {
      case ZonalShiftStatus.active:
        return 'ACTIVE';
      case ZonalShiftStatus.expired:
        return 'EXPIRED';
      case ZonalShiftStatus.canceled:
        return 'CANCELED';
    }
  }
}

extension ZonalShiftStatusFromString on String {
  ZonalShiftStatus toZonalShiftStatus() {
    switch (this) {
      case 'ACTIVE':
        return ZonalShiftStatus.active;
      case 'EXPIRED':
        return ZonalShiftStatus.expired;
      case 'CANCELED':
        return ZonalShiftStatus.canceled;
    }
    throw Exception('$this is not known in enum ZonalShiftStatus');
  }
}

/// Lists information about zonal shifts in Amazon Route 53 Application Recovery
/// Controller, including zonal shifts that you start yourself and zonal shifts
/// that Route 53 ARC starts on your behalf for practice runs with zonal
/// autoshift.
///
/// Zonal shifts are temporary, including customer-started zonal shifts and the
/// zonal autoshift practice run zonal shifts that Route 53 ARC starts weekly,
/// on your behalf. A zonal shift that a customer starts can be active for up to
/// three days (72 hours). A practice run zonal shift has a 30 minute duration.
class ZonalShiftSummary {
  /// The Availability Zone that traffic is moved away from for a resource when
  /// you start a zonal shift. Until the zonal shift expires or you cancel it,
  /// traffic for the resource is instead moved to other Availability Zones in the
  /// Amazon Web Services Region.
  final String awayFrom;

  /// A comment that you enter about the zonal shift. Only the latest comment is
  /// retained; no comment history is maintained. That is, a new comment
  /// overwrites any existing comment string.
  final String comment;

  /// The expiry time (expiration time) for a customer-started zonal shift. A
  /// zonal shift is temporary and must be set to expire when you start the zonal
  /// shift. You can initially set a zonal shift to expire in a maximum of three
  /// days (72 hours). However, you can update a zonal shift to set a new
  /// expiration at any time.
  ///
  /// When you start a zonal shift, you specify how long you want it to be active,
  /// which Route 53 ARC converts to an expiry time (expiration time). You can
  /// cancel a zonal shift when you're ready to restore traffic to the
  /// Availability Zone, or just wait for it to expire. Or you can update the
  /// zonal shift to specify another length of time to expire in.
  final DateTime expiryTime;

  /// The identifier for the resource to include in a zonal shift. The identifier
  /// is the Amazon Resource Name (ARN) for the resource.
  ///
  /// At this time, you can only start a zonal shift for Network Load Balancers
  /// and Application Load Balancers with cross-zone load balancing turned off.
  final String resourceIdentifier;

  /// The time (UTC) when the zonal shift starts.
  final DateTime startTime;

  /// A status for a zonal shift.
  ///
  /// The <code>Status</code> for a zonal shift can have one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <b>ACTIVE:</b> The zonal shift has been started and active.
  /// </li>
  /// <li>
  /// <b>EXPIRED:</b> The zonal shift has expired (the expiry time was exceeded).
  /// </li>
  /// <li>
  /// <b>CANCELED:</b> The zonal shift was canceled.
  /// </li>
  /// </ul>
  final ZonalShiftStatus status;

  /// The identifier of a zonal shift.
  final String zonalShiftId;

  /// The outcome, or end state, of a practice run. The following values can be
  /// returned:
  ///
  /// <ul>
  /// <li>
  /// <b>PENDING:</b> Outcome value when the practice run is in progress.
  /// </li>
  /// <li>
  /// <b>SUCCEEDED:</b> Outcome value when the outcome alarm specified for the
  /// practice run configuration does not go into an <code>ALARM</code> state
  /// during the practice run, and the practice run was not interrupted before it
  /// completed.
  /// </li>
  /// <li>
  /// <b>INTERRUPTED:</b> Outcome value when the practice run did not run for the
  /// expected 30 minutes or there was another problem with the practice run that
  /// created an inconclusive outcome.
  /// </li>
  /// <li>
  /// <b>FAILED:</b> Outcome value when the outcome alarm specified for the
  /// practice run configuration goes into an <code>ALARM</code> state during the
  /// practice run, and the practice run was not interrupted before it completed.
  /// </li>
  /// </ul>
  /// For more information about practice run outcomes, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/arc-zonal-autoshift.configure.html">
  /// Considerations when you configure zonal autoshift</a> in the Amazon Route 53
  /// Application Recovery Controller Developer Guide.
  final PracticeRunOutcome? practiceRunOutcome;

  ZonalShiftSummary({
    required this.awayFrom,
    required this.comment,
    required this.expiryTime,
    required this.resourceIdentifier,
    required this.startTime,
    required this.status,
    required this.zonalShiftId,
    this.practiceRunOutcome,
  });

  factory ZonalShiftSummary.fromJson(Map<String, dynamic> json) {
    return ZonalShiftSummary(
      awayFrom: json['awayFrom'] as String,
      comment: json['comment'] as String,
      expiryTime: nonNullableTimeStampFromJson(json['expiryTime'] as Object),
      resourceIdentifier: json['resourceIdentifier'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      status: (json['status'] as String).toZonalShiftStatus(),
      zonalShiftId: json['zonalShiftId'] as String,
      practiceRunOutcome:
          (json['practiceRunOutcome'] as String?)?.toPracticeRunOutcome(),
    );
  }

  Map<String, dynamic> toJson() {
    final awayFrom = this.awayFrom;
    final comment = this.comment;
    final expiryTime = this.expiryTime;
    final resourceIdentifier = this.resourceIdentifier;
    final startTime = this.startTime;
    final status = this.status;
    final zonalShiftId = this.zonalShiftId;
    final practiceRunOutcome = this.practiceRunOutcome;
    return {
      'awayFrom': awayFrom,
      'comment': comment,
      'expiryTime': unixTimestampToJson(expiryTime),
      'resourceIdentifier': resourceIdentifier,
      'startTime': unixTimestampToJson(startTime),
      'status': status.toValue(),
      'zonalShiftId': zonalShiftId,
      if (practiceRunOutcome != null)
        'practiceRunOutcome': practiceRunOutcome.toValue(),
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};

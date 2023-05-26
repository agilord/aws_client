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

/// This is the API Reference Guide for the zonal shift feature of Amazon Route
/// 53 Application Recovery Controller. This guide is for developers who need
/// detailed information about zonal shift API actions, data types, and errors.
///
/// Zonal shift is in preview release for Amazon Route 53 Application Recovery
/// Controller and is subject to change.
///
/// Zonal shift in Route 53 ARC enables you to move traffic for a load balancer
/// resource away from an Availability Zone. Starting a zonal shift helps your
/// application recover immediately, for example, from a developer's bad code
/// deployment or from an AWS infrastructure failure in a single Availability
/// Zone, reducing the impact and time lost from an issue in one zone.
///
/// Supported AWS resources are automatically registered with Route 53 ARC.
/// Resources that are registered for zonal shifts in Route 53 ARC are managed
/// resources in Route 53 ARC. You can start a zonal shift for any managed
/// resource in your account in a Region. At this time, you can only start a
/// zonal shift for Network Load Balancers and Application Load Balancers with
/// cross-zone load balancing turned off.
///
/// Zonal shifts are temporary. You must specify an expiration when you start a
/// zonal shift, of up to three days initially. If you want to still keep
/// traffic away from an Availability Zone, you can update the zonal shift and
/// set a new expiration. You can also cancel a zonal shift, before it expires,
/// for example, if you're ready to restore traffic to the Availability Zone.
///
/// For more information about using zonal shift, see the <a
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

  /// Cancel a zonal shift in Amazon Route 53 Application Recovery Controller
  /// that you've started for a resource in your AWS account in an AWS Region.
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

  /// Get information about a resource that's been registered for zonal shifts
  /// with Amazon Route 53 Application Recovery Controller in this AWS Region.
  /// Resources that are registered for zonal shifts are managed resources in
  /// Route 53 ARC.
  ///
  /// At this time, you can only start a zonal shift for Network Load Balancers
  /// and Application Load Balancers with cross-zone load balancing turned off.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The identifier for the resource to include in a zonal shift. The
  /// identifier is the Amazon Resource Name (ARN) for the resource.
  ///
  /// At this time, you can only start a zonal shift for Network Load Balancers
  /// and Application Load Balancers with cross-zone load balancing turned off.
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

  /// Lists all the resources in your AWS account in this AWS Region that are
  /// managed for zonal shifts in Amazon Route 53 Application Recovery
  /// Controller, and information about them. The information includes their
  /// Amazon Resource Names (ARNs), the Availability Zones the resources are
  /// deployed in, and the resource name.
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

  /// Lists all the active zonal shifts in Amazon Route 53 Application Recovery
  /// Controller in your AWS account in this AWS Region.
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
  /// A status for a zonal shift.
  ///
  /// The <code>Status</code> for a zonal shift can have one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <b>ACTIVE</b>: The zonal shift is started and active.
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
  /// from an Availability Zone in a AWS Region, to help your application
  /// recover immediately, for example, from a developer's bad code deployment
  /// or from an AWS infrastructure failure in a single Availability Zone. You
  /// can start a zonal shift in Route 53 ARC only for managed resources in your
  /// account in an AWS Region. Resources are automatically registered with
  /// Route 53 ARC by AWS services.
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
  /// the AWS Region.
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
  /// <pre><code> &lt;ul&gt; &lt;li&gt; &lt;p&gt; &lt;b&gt;A lowercase letter
  /// m:&lt;/b&gt; To specify that the value is in minutes.&lt;/p&gt;
  /// &lt;/li&gt; &lt;li&gt; &lt;p&gt; &lt;b&gt;A lowercase letter h:&lt;/b&gt;
  /// To specify that the value is in hours.&lt;/p&gt; &lt;/li&gt; &lt;/ul&gt;
  /// &lt;p&gt;For example: &lt;code&gt;20h&lt;/code&gt; means the zonal shift
  /// expires in 20 hours. &lt;code&gt;120m&lt;/code&gt; means the zonal shift
  /// expires in 120 minutes (2 hours).&lt;/p&gt; </code></pre>
  ///
  /// Parameter [resourceIdentifier] :
  /// The identifier for the resource to include in a zonal shift. The
  /// identifier is the Amazon Resource Name (ARN) for the resource.
  ///
  /// At this time, you can only start a zonal shift for Network Load Balancers
  /// and Application Load Balancers with cross-zone load balancing turned off.
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

  /// Update an active zonal shift in Amazon Route 53 Application Recovery
  /// Controller in your AWS account. You can update a zonal shift to set a new
  /// expiration, or edit or replace the comment for the zonal shift.
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

class GetManagedResourceResponse {
  /// A collection of key-value pairs that indicate whether resources are active
  /// in Availability Zones or not. The key name is the Availability Zone where
  /// the resource is deployed. The value is 1 or 0.
  final Map<String, double> appliedWeights;

  /// The zonal shifts that are currently active for a resource.
  final List<ZonalShiftInResource> zonalShifts;

  /// The Amazon Resource Name (ARN) for the resource.
  final String? arn;

  /// The name of the resource.
  final String? name;

  GetManagedResourceResponse({
    required this.appliedWeights,
    required this.zonalShifts,
    this.arn,
    this.name,
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
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appliedWeights = this.appliedWeights;
    final zonalShifts = this.zonalShifts;
    final arn = this.arn;
    final name = this.name;
    return {
      'appliedWeights': appliedWeights,
      'zonalShifts': zonalShifts,
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
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

/// A complex structure for a managed resource in an account.
///
/// A managed resource is a Network Load Balancer or Application Load Balancer
/// that has been registered with Route 53 ARC by Elastic Load Balancing. You
/// can start a zonal shift in Route 53 ARC for a managed resource to
/// temporarily move traffic for the resource away from an Availability Zone in
/// an AWS Region.
/// <note>
/// At this time, you can only start a zonal shift for Network Load Balancers
/// and Application Load Balancers with cross-zone load balancing turned off.
/// </note>
class ManagedResourceSummary {
  /// The Availability Zones that a resource is deployed in.
  final List<String> availabilityZones;

  /// The Amazon Resource Name (ARN) for the managed resource.
  final String? arn;

  /// The name of the managed resource.
  final String? name;

  ManagedResourceSummary({
    required this.availabilityZones,
    this.arn,
    this.name,
  });

  factory ManagedResourceSummary.fromJson(Map<String, dynamic> json) {
    return ManagedResourceSummary(
      availabilityZones: (json['availabilityZones'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      arn: json['arn'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final arn = this.arn;
    final name = this.name;
    return {
      'availabilityZones': availabilityZones,
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
    };
  }
}

class ZonalShift {
  /// The Availability Zone that traffic is moved away from for a resource when
  /// you start a zonal shift. Until the zonal shift expires or you cancel it,
  /// traffic for the resource is instead moved to other Availability Zones in the
  /// AWS Region.
  final String awayFrom;

  /// A comment that you enter about the zonal shift. Only the latest comment is
  /// retained; no comment history is maintained. A new comment overwrites any
  /// existing comment string.
  final String comment;

  /// The expiry time (expiration time) for the zonal shift. A zonal shift is
  /// temporary and must be set to expire when you start the zonal shift. You can
  /// initially set a zonal shift to expire in a maximum of three days (72 hours).
  /// However, you can update a zonal shift to set a new expiration at any time.
  ///
  /// When you start a zonal shift, you specify how long you want it to be active,
  /// which Route 53 ARC converts to an expiry time (expiration time). You can
  /// cancel a zonal shift, for example, if you're ready to restore traffic to the
  /// Availability Zone. Or you can update the zonal shift to specify another
  /// length of time to expire in.
  final DateTime expiryTime;

  /// The identifier for the resource to include in a zonal shift. The identifier
  /// is the Amazon Resource Name (ARN) for the resource.
  ///
  /// At this time, you can only start a zonal shift for Network Load Balancers
  /// and Application Load Balancers with cross-zone load balancing turned off.
  final String resourceIdentifier;

  /// The time (UTC) when the zonal shift is started.
  final DateTime startTime;

  /// A status for a zonal shift.
  ///
  /// The <code>Status</code> for a zonal shift can have one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <b>ACTIVE:</b> The zonal shift is started and active.
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
  /// An <code>appliedStatus</code> for a zonal shift for a resource can have one
  /// of two values: <code>APPLIED</code> or <code>NOT_APPLIED</code>.
  final AppliedStatus appliedStatus;

  /// The Availability Zone that traffic is moved away from for a resource when
  /// you start a zonal shift. Until the zonal shift expires or you cancel it,
  /// traffic for the resource is instead moved to other Availability Zones in the
  /// AWS Region.
  final String awayFrom;

  /// A comment that you enter about the zonal shift. Only the latest comment is
  /// retained; no comment history is maintained. That is, a new comment
  /// overwrites any existing comment string.
  final String comment;

  /// The expiry time (expiration time) for the zonal shift. A zonal shift is
  /// temporary and must be set to expire when you start the zonal shift. You can
  /// initially set a zonal shift to expire in a maximum of three days (72 hours).
  /// However, you can update a zonal shift to set a new expiration at any time.
  ///
  /// When you start a zonal shift, you specify how long you want it to be active,
  /// which Route 53 ARC converts to an expiry time (expiration time). You can
  /// cancel a zonal shift, for example, if you're ready to restore traffic to the
  /// Availability Zone. Or you can update the zonal shift to specify another
  /// length of time to expire in.
  final DateTime expiryTime;

  /// The identifier for the resource to include in a zonal shift. The identifier
  /// is the Amazon Resource Name (ARN) for the resource.
  ///
  /// At this time, you can only start a zonal shift for Network Load Balancers
  /// and Application Load Balancers with cross-zone load balancing turned off.
  final String resourceIdentifier;

  /// The time (UTC) when the zonal shift is started.
  final DateTime startTime;

  /// The identifier of a zonal shift.
  final String zonalShiftId;

  ZonalShiftInResource({
    required this.appliedStatus,
    required this.awayFrom,
    required this.comment,
    required this.expiryTime,
    required this.resourceIdentifier,
    required this.startTime,
    required this.zonalShiftId,
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
    return {
      'appliedStatus': appliedStatus.toValue(),
      'awayFrom': awayFrom,
      'comment': comment,
      'expiryTime': unixTimestampToJson(expiryTime),
      'resourceIdentifier': resourceIdentifier,
      'startTime': unixTimestampToJson(startTime),
      'zonalShiftId': zonalShiftId,
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

/// You start a zonal shift to temporarily move load balancer traffic away from
/// an Availability Zone in a AWS Region. A zonal shift helps your application
/// recover immediately, for example, from a developer's bad code deployment or
/// from an AWS infrastructure failure in a single Availability Zone. You can
/// start a zonal shift in Route 53 ARC only for managed resources in your
/// account in an AWS Region. Supported AWS resources are automatically
/// registered with Route 53 ARC.
///
/// Zonal shifts are temporary. A zonal shift can be active for up to three days
/// (72 hours).
///
/// When you start a zonal shift, you specify how long you want it to be active,
/// which Amazon Route 53 Application Recovery Controller converts to an expiry
/// time (expiration time). You can cancel a zonal shift, for example, if you're
/// ready to restore traffic to the Availability Zone. Or you can extend the
/// zonal shift by updating the expiration so the zonal shift is active longer.
class ZonalShiftSummary {
  /// The Availability Zone that traffic is moved away from for a resource when
  /// you start a zonal shift. Until the zonal shift expires or you cancel it,
  /// traffic for the resource is instead moved to other Availability Zones in the
  /// AWS Region.
  final String awayFrom;

  /// A comment that you enter about the zonal shift. Only the latest comment is
  /// retained; no comment history is maintained. That is, a new comment
  /// overwrites any existing comment string.
  final String comment;

  /// The expiry time (expiration time) for the zonal shift. A zonal shift is
  /// temporary and must be set to expire when you start the zonal shift. You can
  /// initially set a zonal shift to expire in a maximum of three days (72 hours).
  /// However, you can update a zonal shift to set a new expiration at any time.
  ///
  /// When you start a zonal shift, you specify how long you want it to be active,
  /// which Route 53 ARC converts to an expiry time (expiration time). You can
  /// cancel a zonal shift, for example, if you're ready to restore traffic to the
  /// Availability Zone. Or you can update the zonal shift to specify another
  /// length of time to expire in.
  final DateTime expiryTime;

  /// The identifier for the resource to include in a zonal shift. The identifier
  /// is the Amazon Resource Name (ARN) for the resource.
  ///
  /// At this time, you can only start a zonal shift for Network Load Balancers
  /// and Application Load Balancers with cross-zone load balancing turned off.
  final String resourceIdentifier;

  /// The time (UTC) when the zonal shift is started.
  final DateTime startTime;

  /// A status for a zonal shift.
  ///
  /// The <code>Status</code> for a zonal shift can have one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <b>ACTIVE:</b> The zonal shift is started and active.
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

  ZonalShiftSummary({
    required this.awayFrom,
    required this.comment,
    required this.expiryTime,
    required this.resourceIdentifier,
    required this.startTime,
    required this.status,
    required this.zonalShiftId,
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

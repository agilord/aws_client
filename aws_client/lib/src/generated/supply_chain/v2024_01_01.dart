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

/// AWS Supply Chain is a cloud-based application that works with your
/// enterprise resource planning (ERP) and supply chain management systems.
/// Using AWS Supply Chain, you can connect and extract your inventory, supply,
/// and demand related data from existing ERP or supply chain systems into a
/// single data model.
///
/// The AWS Supply Chain API supports configuration data import for Supply
/// Planning.
///
/// All AWS Supply chain API operations are Amazon-authenticated and
/// certificate-signed. They not only require the use of the AWS SDK, but also
/// allow for the exclusive use of AWS Identity and Access Management users and
/// roles to help facilitate access, trust, and permission policies.
class SupplyChain {
  final _s.RestJsonProtocol _protocol;
  SupplyChain({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'scn',
            signingName: 'scn',
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

  /// CreateBillOfMaterialsImportJob creates an import job for the Product Bill
  /// Of Materials (BOM) entity. For information on the product_bom entity, see
  /// the AWS Supply Chain User Guide.
  ///
  /// The CSV file must be located in an Amazon S3 location accessible to AWS
  /// Supply Chain. It is recommended to use the same Amazon S3 bucket created
  /// during your AWS Supply Chain instance creation.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier.
  ///
  /// Parameter [s3uri] :
  /// The S3 URI of the CSV file to be imported. The bucket must grant
  /// permissions for AWS Supply Chain to read the file.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token.
  Future<CreateBillOfMaterialsImportJobResponse>
      createBillOfMaterialsImportJob({
    required String instanceId,
    required String s3uri,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      's3uri': s3uri,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/api/configuration/instances/${Uri.encodeComponent(instanceId)}/bill-of-materials-import-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBillOfMaterialsImportJobResponse.fromJson(response);
  }

  /// Get status and details of a BillOfMaterialsImportJob.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier.
  ///
  /// Parameter [jobId] :
  /// The BillOfMaterialsImportJob identifier.
  Future<GetBillOfMaterialsImportJobResponse> getBillOfMaterialsImportJob({
    required String instanceId,
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/configuration/instances/${Uri.encodeComponent(instanceId)}/bill-of-materials-import-jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBillOfMaterialsImportJobResponse.fromJson(response);
  }

  /// Send transactional data events with real-time data for analysis or
  /// monitoring.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [data] :
  /// The data payload of the event.
  ///
  /// Parameter [eventGroupId] :
  /// Event identifier (for example, orderId for InboundOrder) used for data
  /// sharing or partitioning.
  ///
  /// Parameter [eventType] :
  /// The data event type.
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier.
  ///
  /// Parameter [clientToken] :
  /// The idempotent client token.
  ///
  /// Parameter [eventTimestamp] :
  /// The event timestamp (in epoch seconds).
  Future<SendDataIntegrationEventResponse> sendDataIntegrationEvent({
    required String data,
    required String eventGroupId,
    required DataIntegrationEventType eventType,
    required String instanceId,
    String? clientToken,
    DateTime? eventTimestamp,
  }) async {
    final $payload = <String, dynamic>{
      'data': data,
      'eventGroupId': eventGroupId,
      'eventType': eventType.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (eventTimestamp != null)
        'eventTimestamp': unixTimestampToJson(eventTimestamp),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/api-data/data-integration/instance/${Uri.encodeComponent(instanceId)}/data-integration-events',
      exceptionFnMap: _exceptionFns,
    );
    return SendDataIntegrationEventResponse.fromJson(response);
  }
}

/// The BillOfMaterialsImportJob details.
class BillOfMaterialsImportJob {
  /// The BillOfMaterialsImportJob instanceId.
  final String instanceId;

  /// The BillOfMaterialsImportJob jobId.
  final String jobId;

  /// The S3 URI from which the CSV is read.
  final String s3uri;

  /// The BillOfMaterialsImportJob ConfigurationJobStatus.
  final ConfigurationJobStatus status;

  /// When the BillOfMaterialsImportJob has reached a terminal state, there will
  /// be a message.
  final String? message;

  BillOfMaterialsImportJob({
    required this.instanceId,
    required this.jobId,
    required this.s3uri,
    required this.status,
    this.message,
  });

  factory BillOfMaterialsImportJob.fromJson(Map<String, dynamic> json) {
    return BillOfMaterialsImportJob(
      instanceId: json['instanceId'] as String,
      jobId: json['jobId'] as String,
      s3uri: json['s3uri'] as String,
      status: (json['status'] as String).toConfigurationJobStatus(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    final jobId = this.jobId;
    final s3uri = this.s3uri;
    final status = this.status;
    final message = this.message;
    return {
      'instanceId': instanceId,
      'jobId': jobId,
      's3uri': s3uri,
      'status': status.toValue(),
      if (message != null) 'message': message,
    };
  }
}

/// The status of the job.
enum ConfigurationJobStatus {
  $new,
  failed,
  inProgress,
  queued,
  success,
}

extension ConfigurationJobStatusValueExtension on ConfigurationJobStatus {
  String toValue() {
    switch (this) {
      case ConfigurationJobStatus.$new:
        return 'NEW';
      case ConfigurationJobStatus.failed:
        return 'FAILED';
      case ConfigurationJobStatus.inProgress:
        return 'IN_PROGRESS';
      case ConfigurationJobStatus.queued:
        return 'QUEUED';
      case ConfigurationJobStatus.success:
        return 'SUCCESS';
    }
  }
}

extension ConfigurationJobStatusFromString on String {
  ConfigurationJobStatus toConfigurationJobStatus() {
    switch (this) {
      case 'NEW':
        return ConfigurationJobStatus.$new;
      case 'FAILED':
        return ConfigurationJobStatus.failed;
      case 'IN_PROGRESS':
        return ConfigurationJobStatus.inProgress;
      case 'QUEUED':
        return ConfigurationJobStatus.queued;
      case 'SUCCESS':
        return ConfigurationJobStatus.success;
    }
    throw Exception('$this is not known in enum ConfigurationJobStatus');
  }
}

/// The response parameters of CreateBillOfMaterialsImportJob.
class CreateBillOfMaterialsImportJobResponse {
  /// The new BillOfMaterialsImportJob identifier.
  final String jobId;

  CreateBillOfMaterialsImportJobResponse({
    required this.jobId,
  });

  factory CreateBillOfMaterialsImportJobResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateBillOfMaterialsImportJobResponse(
      jobId: json['jobId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

enum DataIntegrationEventType {
  scnDataForecast,
  scnDataInventorylevel,
  scnDataInboundorder,
  scnDataInboundorderline,
  scnDataInboundorderlineschedule,
  scnDataOutboundorderline,
  scnDataOutboundshipment,
  scnDataProcessheader,
  scnDataProcessoperation,
  scnDataProcessproduct,
  scnDataReservation,
  scnDataShipment,
  scnDataShipmentstop,
  scnDataShipmentstoporder,
  scnDataSupplyplan,
}

extension DataIntegrationEventTypeValueExtension on DataIntegrationEventType {
  String toValue() {
    switch (this) {
      case DataIntegrationEventType.scnDataForecast:
        return 'scn.data.forecast';
      case DataIntegrationEventType.scnDataInventorylevel:
        return 'scn.data.inventorylevel';
      case DataIntegrationEventType.scnDataInboundorder:
        return 'scn.data.inboundorder';
      case DataIntegrationEventType.scnDataInboundorderline:
        return 'scn.data.inboundorderline';
      case DataIntegrationEventType.scnDataInboundorderlineschedule:
        return 'scn.data.inboundorderlineschedule';
      case DataIntegrationEventType.scnDataOutboundorderline:
        return 'scn.data.outboundorderline';
      case DataIntegrationEventType.scnDataOutboundshipment:
        return 'scn.data.outboundshipment';
      case DataIntegrationEventType.scnDataProcessheader:
        return 'scn.data.processheader';
      case DataIntegrationEventType.scnDataProcessoperation:
        return 'scn.data.processoperation';
      case DataIntegrationEventType.scnDataProcessproduct:
        return 'scn.data.processproduct';
      case DataIntegrationEventType.scnDataReservation:
        return 'scn.data.reservation';
      case DataIntegrationEventType.scnDataShipment:
        return 'scn.data.shipment';
      case DataIntegrationEventType.scnDataShipmentstop:
        return 'scn.data.shipmentstop';
      case DataIntegrationEventType.scnDataShipmentstoporder:
        return 'scn.data.shipmentstoporder';
      case DataIntegrationEventType.scnDataSupplyplan:
        return 'scn.data.supplyplan';
    }
  }
}

extension DataIntegrationEventTypeFromString on String {
  DataIntegrationEventType toDataIntegrationEventType() {
    switch (this) {
      case 'scn.data.forecast':
        return DataIntegrationEventType.scnDataForecast;
      case 'scn.data.inventorylevel':
        return DataIntegrationEventType.scnDataInventorylevel;
      case 'scn.data.inboundorder':
        return DataIntegrationEventType.scnDataInboundorder;
      case 'scn.data.inboundorderline':
        return DataIntegrationEventType.scnDataInboundorderline;
      case 'scn.data.inboundorderlineschedule':
        return DataIntegrationEventType.scnDataInboundorderlineschedule;
      case 'scn.data.outboundorderline':
        return DataIntegrationEventType.scnDataOutboundorderline;
      case 'scn.data.outboundshipment':
        return DataIntegrationEventType.scnDataOutboundshipment;
      case 'scn.data.processheader':
        return DataIntegrationEventType.scnDataProcessheader;
      case 'scn.data.processoperation':
        return DataIntegrationEventType.scnDataProcessoperation;
      case 'scn.data.processproduct':
        return DataIntegrationEventType.scnDataProcessproduct;
      case 'scn.data.reservation':
        return DataIntegrationEventType.scnDataReservation;
      case 'scn.data.shipment':
        return DataIntegrationEventType.scnDataShipment;
      case 'scn.data.shipmentstop':
        return DataIntegrationEventType.scnDataShipmentstop;
      case 'scn.data.shipmentstoporder':
        return DataIntegrationEventType.scnDataShipmentstoporder;
      case 'scn.data.supplyplan':
        return DataIntegrationEventType.scnDataSupplyplan;
    }
    throw Exception('$this is not known in enum DataIntegrationEventType');
  }
}

/// The response parameters for GetBillOfMaterialsImportJob.
class GetBillOfMaterialsImportJobResponse {
  /// The BillOfMaterialsImportJob.
  final BillOfMaterialsImportJob job;

  GetBillOfMaterialsImportJobResponse({
    required this.job,
  });

  factory GetBillOfMaterialsImportJobResponse.fromJson(
      Map<String, dynamic> json) {
    return GetBillOfMaterialsImportJobResponse(
      job: BillOfMaterialsImportJob.fromJson(
          json['job'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      'job': job,
    };
  }
}

/// The response parameters for SendDataIntegrationEvent.
class SendDataIntegrationEventResponse {
  /// The unique event identifier.
  final String eventId;

  SendDataIntegrationEventResponse({
    required this.eventId,
  });

  factory SendDataIntegrationEventResponse.fromJson(Map<String, dynamic> json) {
    return SendDataIntegrationEventResponse(
      eventId: json['eventId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    return {
      'eventId': eventId,
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

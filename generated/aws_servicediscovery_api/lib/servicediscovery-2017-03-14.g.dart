// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicediscovery-2017-03-14.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateHttpNamespaceRequestToJson(
    CreateHttpNamespaceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('CreatorRequestId', instance.creatorRequestId);
  writeNotNull('Description', instance.description);
  return val;
}

CreateHttpNamespaceResponse _$CreateHttpNamespaceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateHttpNamespaceResponse(
    operationId: json['OperationId'] as String,
  );
}

Map<String, dynamic> _$CreatePrivateDnsNamespaceRequestToJson(
    CreatePrivateDnsNamespaceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Vpc', instance.vpc);
  writeNotNull('CreatorRequestId', instance.creatorRequestId);
  writeNotNull('Description', instance.description);
  return val;
}

CreatePrivateDnsNamespaceResponse _$CreatePrivateDnsNamespaceResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePrivateDnsNamespaceResponse(
    operationId: json['OperationId'] as String,
  );
}

Map<String, dynamic> _$CreatePublicDnsNamespaceRequestToJson(
    CreatePublicDnsNamespaceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('CreatorRequestId', instance.creatorRequestId);
  writeNotNull('Description', instance.description);
  return val;
}

CreatePublicDnsNamespaceResponse _$CreatePublicDnsNamespaceResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePublicDnsNamespaceResponse(
    operationId: json['OperationId'] as String,
  );
}

Map<String, dynamic> _$CreateServiceRequestToJson(
    CreateServiceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('CreatorRequestId', instance.creatorRequestId);
  writeNotNull('Description', instance.description);
  writeNotNull('DnsConfig', instance.dnsConfig?.toJson());
  writeNotNull('HealthCheckConfig', instance.healthCheckConfig?.toJson());
  writeNotNull(
      'HealthCheckCustomConfig', instance.healthCheckCustomConfig?.toJson());
  writeNotNull('NamespaceId', instance.namespaceId);
  return val;
}

CreateServiceResponse _$CreateServiceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateServiceResponse(
    service: json['Service'] == null
        ? null
        : Service.fromJson(json['Service'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteNamespaceRequestToJson(
    DeleteNamespaceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  return val;
}

DeleteNamespaceResponse _$DeleteNamespaceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteNamespaceResponse(
    operationId: json['OperationId'] as String,
  );
}

Map<String, dynamic> _$DeleteServiceRequestToJson(
    DeleteServiceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  return val;
}

DeleteServiceResponse _$DeleteServiceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteServiceResponse();
}

Map<String, dynamic> _$DeregisterInstanceRequestToJson(
    DeregisterInstanceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceId', instance.instanceId);
  writeNotNull('ServiceId', instance.serviceId);
  return val;
}

DeregisterInstanceResponse _$DeregisterInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return DeregisterInstanceResponse(
    operationId: json['OperationId'] as String,
  );
}

Map<String, dynamic> _$DiscoverInstancesRequestToJson(
    DiscoverInstancesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NamespaceName', instance.namespaceName);
  writeNotNull('ServiceName', instance.serviceName);
  writeNotNull(
      'HealthStatus', _$HealthStatusFilterEnumMap[instance.healthStatus]);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('QueryParameters', instance.queryParameters);
  return val;
}

const _$HealthStatusFilterEnumMap = {
  HealthStatusFilter.healthy: 'HEALTHY',
  HealthStatusFilter.unhealthy: 'UNHEALTHY',
  HealthStatusFilter.all: 'ALL',
};

DiscoverInstancesResponse _$DiscoverInstancesResponseFromJson(
    Map<String, dynamic> json) {
  return DiscoverInstancesResponse(
    instances: (json['Instances'] as List)
        ?.map((e) => e == null
            ? null
            : HttpInstanceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DnsConfig _$DnsConfigFromJson(Map<String, dynamic> json) {
  return DnsConfig(
    dnsRecords: (json['DnsRecords'] as List)
        ?.map((e) =>
            e == null ? null : DnsRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    namespaceId: json['NamespaceId'] as String,
    routingPolicy:
        _$enumDecodeNullable(_$RoutingPolicyEnumMap, json['RoutingPolicy']),
  );
}

Map<String, dynamic> _$DnsConfigToJson(DnsConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DnsRecords', instance.dnsRecords?.map((e) => e?.toJson())?.toList());
  writeNotNull('NamespaceId', instance.namespaceId);
  writeNotNull('RoutingPolicy', _$RoutingPolicyEnumMap[instance.routingPolicy]);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$RoutingPolicyEnumMap = {
  RoutingPolicy.multivalue: 'MULTIVALUE',
  RoutingPolicy.weighted: 'WEIGHTED',
};

Map<String, dynamic> _$DnsConfigChangeToJson(DnsConfigChange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DnsRecords', instance.dnsRecords?.map((e) => e?.toJson())?.toList());
  return val;
}

DnsProperties _$DnsPropertiesFromJson(Map<String, dynamic> json) {
  return DnsProperties(
    hostedZoneId: json['HostedZoneId'] as String,
  );
}

DnsRecord _$DnsRecordFromJson(Map<String, dynamic> json) {
  return DnsRecord(
    ttl: json['TTL'] as int,
    type: _$enumDecodeNullable(_$RecordTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$DnsRecordToJson(DnsRecord instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TTL', instance.ttl);
  writeNotNull('Type', _$RecordTypeEnumMap[instance.type]);
  return val;
}

const _$RecordTypeEnumMap = {
  RecordType.srv: 'SRV',
  RecordType.a: 'A',
  RecordType.aaaa: 'AAAA',
  RecordType.cname: 'CNAME',
};

Map<String, dynamic> _$GetInstanceRequestToJson(GetInstanceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceId', instance.instanceId);
  writeNotNull('ServiceId', instance.serviceId);
  return val;
}

GetInstanceResponse _$GetInstanceResponseFromJson(Map<String, dynamic> json) {
  return GetInstanceResponse(
    instance: json['Instance'] == null
        ? null
        : Instance.fromJson(json['Instance'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetInstancesHealthStatusRequestToJson(
    GetInstancesHealthStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServiceId', instance.serviceId);
  writeNotNull('Instances', instance.instances);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

GetInstancesHealthStatusResponse _$GetInstancesHealthStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetInstancesHealthStatusResponse(
    nextToken: json['NextToken'] as String,
    status: (json['Status'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$GetNamespaceRequestToJson(GetNamespaceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  return val;
}

GetNamespaceResponse _$GetNamespaceResponseFromJson(Map<String, dynamic> json) {
  return GetNamespaceResponse(
    namespace: json['Namespace'] == null
        ? null
        : Namespace.fromJson(json['Namespace'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetOperationRequestToJson(GetOperationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OperationId', instance.operationId);
  return val;
}

GetOperationResponse _$GetOperationResponseFromJson(Map<String, dynamic> json) {
  return GetOperationResponse(
    operation: json['Operation'] == null
        ? null
        : Operation.fromJson(json['Operation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetServiceRequestToJson(GetServiceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  return val;
}

GetServiceResponse _$GetServiceResponseFromJson(Map<String, dynamic> json) {
  return GetServiceResponse(
    service: json['Service'] == null
        ? null
        : Service.fromJson(json['Service'] as Map<String, dynamic>),
  );
}

HealthCheckConfig _$HealthCheckConfigFromJson(Map<String, dynamic> json) {
  return HealthCheckConfig(
    type: _$enumDecodeNullable(_$HealthCheckTypeEnumMap, json['Type']),
    failureThreshold: json['FailureThreshold'] as int,
    resourcePath: json['ResourcePath'] as String,
  );
}

Map<String, dynamic> _$HealthCheckConfigToJson(HealthCheckConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$HealthCheckTypeEnumMap[instance.type]);
  writeNotNull('FailureThreshold', instance.failureThreshold);
  writeNotNull('ResourcePath', instance.resourcePath);
  return val;
}

const _$HealthCheckTypeEnumMap = {
  HealthCheckType.http: 'HTTP',
  HealthCheckType.https: 'HTTPS',
  HealthCheckType.tcp: 'TCP',
};

HealthCheckCustomConfig _$HealthCheckCustomConfigFromJson(
    Map<String, dynamic> json) {
  return HealthCheckCustomConfig(
    failureThreshold: json['FailureThreshold'] as int,
  );
}

Map<String, dynamic> _$HealthCheckCustomConfigToJson(
    HealthCheckCustomConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FailureThreshold', instance.failureThreshold);
  return val;
}

HttpInstanceSummary _$HttpInstanceSummaryFromJson(Map<String, dynamic> json) {
  return HttpInstanceSummary(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    healthStatus:
        _$enumDecodeNullable(_$HealthStatusEnumMap, json['HealthStatus']),
    instanceId: json['InstanceId'] as String,
    namespaceName: json['NamespaceName'] as String,
    serviceName: json['ServiceName'] as String,
  );
}

const _$HealthStatusEnumMap = {
  HealthStatus.healthy: 'HEALTHY',
  HealthStatus.unhealthy: 'UNHEALTHY',
  HealthStatus.unknown: 'UNKNOWN',
};

HttpProperties _$HttpPropertiesFromJson(Map<String, dynamic> json) {
  return HttpProperties(
    httpName: json['HttpName'] as String,
  );
}

Instance _$InstanceFromJson(Map<String, dynamic> json) {
  return Instance(
    id: json['Id'] as String,
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    creatorRequestId: json['CreatorRequestId'] as String,
  );
}

InstanceSummary _$InstanceSummaryFromJson(Map<String, dynamic> json) {
  return InstanceSummary(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    id: json['Id'] as String,
  );
}

Map<String, dynamic> _$ListInstancesRequestToJson(
    ListInstancesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServiceId', instance.serviceId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListInstancesResponse _$ListInstancesResponseFromJson(
    Map<String, dynamic> json) {
  return ListInstancesResponse(
    instances: (json['Instances'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListNamespacesRequestToJson(
    ListNamespacesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListNamespacesResponse _$ListNamespacesResponseFromJson(
    Map<String, dynamic> json) {
  return ListNamespacesResponse(
    namespaces: (json['Namespaces'] as List)
        ?.map((e) => e == null
            ? null
            : NamespaceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListOperationsRequestToJson(
    ListOperationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListOperationsResponse _$ListOperationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListOperationsResponse(
    nextToken: json['NextToken'] as String,
    operations: (json['Operations'] as List)
        ?.map((e) => e == null
            ? null
            : OperationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListServicesRequestToJson(ListServicesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListServicesResponse _$ListServicesResponseFromJson(Map<String, dynamic> json) {
  return ListServicesResponse(
    nextToken: json['NextToken'] as String,
    services: (json['Services'] as List)
        ?.map((e) => e == null
            ? null
            : ServiceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Namespace _$NamespaceFromJson(Map<String, dynamic> json) {
  return Namespace(
    arn: json['Arn'] as String,
    createDate: unixTimestampFromJson(json['CreateDate']),
    creatorRequestId: json['CreatorRequestId'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    properties: json['Properties'] == null
        ? null
        : NamespaceProperties.fromJson(
            json['Properties'] as Map<String, dynamic>),
    serviceCount: json['ServiceCount'] as int,
    type: _$enumDecodeNullable(_$NamespaceTypeEnumMap, json['Type']),
  );
}

const _$NamespaceTypeEnumMap = {
  NamespaceType.dnsPublic: 'DNS_PUBLIC',
  NamespaceType.dnsPrivate: 'DNS_PRIVATE',
  NamespaceType.http: 'HTTP',
};

Map<String, dynamic> _$NamespaceFilterToJson(NamespaceFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$NamespaceFilterNameEnumMap[instance.name]);
  writeNotNull('Values', instance.values);
  writeNotNull('Condition', _$FilterConditionEnumMap[instance.condition]);
  return val;
}

const _$NamespaceFilterNameEnumMap = {
  NamespaceFilterName.type: 'TYPE',
};

const _$FilterConditionEnumMap = {
  FilterCondition.eq: 'EQ',
  FilterCondition.$in: 'IN',
  FilterCondition.between: 'BETWEEN',
};

NamespaceProperties _$NamespacePropertiesFromJson(Map<String, dynamic> json) {
  return NamespaceProperties(
    dnsProperties: json['DnsProperties'] == null
        ? null
        : DnsProperties.fromJson(json['DnsProperties'] as Map<String, dynamic>),
    httpProperties: json['HttpProperties'] == null
        ? null
        : HttpProperties.fromJson(
            json['HttpProperties'] as Map<String, dynamic>),
  );
}

NamespaceSummary _$NamespaceSummaryFromJson(Map<String, dynamic> json) {
  return NamespaceSummary(
    arn: json['Arn'] as String,
    createDate: unixTimestampFromJson(json['CreateDate']),
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    properties: json['Properties'] == null
        ? null
        : NamespaceProperties.fromJson(
            json['Properties'] as Map<String, dynamic>),
    serviceCount: json['ServiceCount'] as int,
    type: _$enumDecodeNullable(_$NamespaceTypeEnumMap, json['Type']),
  );
}

Operation _$OperationFromJson(Map<String, dynamic> json) {
  return Operation(
    createDate: unixTimestampFromJson(json['CreateDate']),
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    id: json['Id'] as String,
    status: _$enumDecodeNullable(_$OperationStatusEnumMap, json['Status']),
    targets: (json['Targets'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecodeNullable(_$OperationTypeEnumMap, json['Type']),
    updateDate: unixTimestampFromJson(json['UpdateDate']),
  );
}

const _$OperationStatusEnumMap = {
  OperationStatus.submitted: 'SUBMITTED',
  OperationStatus.pending: 'PENDING',
  OperationStatus.success: 'SUCCESS',
  OperationStatus.fail: 'FAIL',
};

const _$OperationTypeEnumMap = {
  OperationType.createNamespace: 'CREATE_NAMESPACE',
  OperationType.deleteNamespace: 'DELETE_NAMESPACE',
  OperationType.updateService: 'UPDATE_SERVICE',
  OperationType.registerInstance: 'REGISTER_INSTANCE',
  OperationType.deregisterInstance: 'DEREGISTER_INSTANCE',
};

Map<String, dynamic> _$OperationFilterToJson(OperationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$OperationFilterNameEnumMap[instance.name]);
  writeNotNull('Values', instance.values);
  writeNotNull('Condition', _$FilterConditionEnumMap[instance.condition]);
  return val;
}

const _$OperationFilterNameEnumMap = {
  OperationFilterName.namespaceId: 'NAMESPACE_ID',
  OperationFilterName.serviceId: 'SERVICE_ID',
  OperationFilterName.status: 'STATUS',
  OperationFilterName.type: 'TYPE',
  OperationFilterName.updateDate: 'UPDATE_DATE',
};

OperationSummary _$OperationSummaryFromJson(Map<String, dynamic> json) {
  return OperationSummary(
    id: json['Id'] as String,
    status: _$enumDecodeNullable(_$OperationStatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$RegisterInstanceRequestToJson(
    RegisterInstanceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Attributes', instance.attributes);
  writeNotNull('InstanceId', instance.instanceId);
  writeNotNull('ServiceId', instance.serviceId);
  writeNotNull('CreatorRequestId', instance.creatorRequestId);
  return val;
}

RegisterInstanceResponse _$RegisterInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterInstanceResponse(
    operationId: json['OperationId'] as String,
  );
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    arn: json['Arn'] as String,
    createDate: unixTimestampFromJson(json['CreateDate']),
    creatorRequestId: json['CreatorRequestId'] as String,
    description: json['Description'] as String,
    dnsConfig: json['DnsConfig'] == null
        ? null
        : DnsConfig.fromJson(json['DnsConfig'] as Map<String, dynamic>),
    healthCheckConfig: json['HealthCheckConfig'] == null
        ? null
        : HealthCheckConfig.fromJson(
            json['HealthCheckConfig'] as Map<String, dynamic>),
    healthCheckCustomConfig: json['HealthCheckCustomConfig'] == null
        ? null
        : HealthCheckCustomConfig.fromJson(
            json['HealthCheckCustomConfig'] as Map<String, dynamic>),
    id: json['Id'] as String,
    instanceCount: json['InstanceCount'] as int,
    name: json['Name'] as String,
    namespaceId: json['NamespaceId'] as String,
  );
}

Map<String, dynamic> _$ServiceChangeToJson(ServiceChange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DnsConfig', instance.dnsConfig?.toJson());
  writeNotNull('Description', instance.description);
  writeNotNull('HealthCheckConfig', instance.healthCheckConfig?.toJson());
  return val;
}

Map<String, dynamic> _$ServiceFilterToJson(ServiceFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$ServiceFilterNameEnumMap[instance.name]);
  writeNotNull('Values', instance.values);
  writeNotNull('Condition', _$FilterConditionEnumMap[instance.condition]);
  return val;
}

const _$ServiceFilterNameEnumMap = {
  ServiceFilterName.namespaceId: 'NAMESPACE_ID',
};

ServiceSummary _$ServiceSummaryFromJson(Map<String, dynamic> json) {
  return ServiceSummary(
    arn: json['Arn'] as String,
    createDate: unixTimestampFromJson(json['CreateDate']),
    description: json['Description'] as String,
    dnsConfig: json['DnsConfig'] == null
        ? null
        : DnsConfig.fromJson(json['DnsConfig'] as Map<String, dynamic>),
    healthCheckConfig: json['HealthCheckConfig'] == null
        ? null
        : HealthCheckConfig.fromJson(
            json['HealthCheckConfig'] as Map<String, dynamic>),
    healthCheckCustomConfig: json['HealthCheckCustomConfig'] == null
        ? null
        : HealthCheckCustomConfig.fromJson(
            json['HealthCheckCustomConfig'] as Map<String, dynamic>),
    id: json['Id'] as String,
    instanceCount: json['InstanceCount'] as int,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$UpdateInstanceCustomHealthStatusRequestToJson(
    UpdateInstanceCustomHealthStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceId', instance.instanceId);
  writeNotNull('ServiceId', instance.serviceId);
  writeNotNull('Status', _$CustomHealthStatusEnumMap[instance.status]);
  return val;
}

const _$CustomHealthStatusEnumMap = {
  CustomHealthStatus.healthy: 'HEALTHY',
  CustomHealthStatus.unhealthy: 'UNHEALTHY',
};

Map<String, dynamic> _$UpdateServiceRequestToJson(
    UpdateServiceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Service', instance.service?.toJson());
  return val;
}

UpdateServiceResponse _$UpdateServiceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateServiceResponse(
    operationId: json['OperationId'] as String,
  );
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appmesh-2019-01-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessLog _$AccessLogFromJson(Map<String, dynamic> json) {
  return AccessLog(
    file: json['file'] == null
        ? null
        : FileAccessLog.fromJson(json['file'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccessLogToJson(AccessLog instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file', instance.file?.toJson());
  return val;
}

AwsCloudMapInstanceAttribute _$AwsCloudMapInstanceAttributeFromJson(
    Map<String, dynamic> json) {
  return AwsCloudMapInstanceAttribute(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$AwsCloudMapInstanceAttributeToJson(
        AwsCloudMapInstanceAttribute instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

AwsCloudMapServiceDiscovery _$AwsCloudMapServiceDiscoveryFromJson(
    Map<String, dynamic> json) {
  return AwsCloudMapServiceDiscovery(
    namespaceName: json['namespaceName'] as String,
    serviceName: json['serviceName'] as String,
    attributes: (json['attributes'] as List<dynamic>?)
        ?.map((e) =>
            AwsCloudMapInstanceAttribute.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AwsCloudMapServiceDiscoveryToJson(
    AwsCloudMapServiceDiscovery instance) {
  final val = <String, dynamic>{
    'namespaceName': instance.namespaceName,
    'serviceName': instance.serviceName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'attributes', instance.attributes?.map((e) => e.toJson()).toList());
  return val;
}

Backend _$BackendFromJson(Map<String, dynamic> json) {
  return Backend(
    virtualService: json['virtualService'] == null
        ? null
        : VirtualServiceBackend.fromJson(
            json['virtualService'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BackendToJson(Backend instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('virtualService', instance.virtualService?.toJson());
  return val;
}

BackendDefaults _$BackendDefaultsFromJson(Map<String, dynamic> json) {
  return BackendDefaults(
    clientPolicy: json['clientPolicy'] == null
        ? null
        : ClientPolicy.fromJson(json['clientPolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BackendDefaultsToJson(BackendDefaults instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientPolicy', instance.clientPolicy?.toJson());
  return val;
}

ClientPolicy _$ClientPolicyFromJson(Map<String, dynamic> json) {
  return ClientPolicy(
    tls: json['tls'] == null
        ? null
        : ClientPolicyTls.fromJson(json['tls'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ClientPolicyToJson(ClientPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tls', instance.tls?.toJson());
  return val;
}

ClientPolicyTls _$ClientPolicyTlsFromJson(Map<String, dynamic> json) {
  return ClientPolicyTls(
    validation: TlsValidationContext.fromJson(
        json['validation'] as Map<String, dynamic>),
    enforce: json['enforce'] as bool?,
    ports: (json['ports'] as List<dynamic>?)?.map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$ClientPolicyTlsToJson(ClientPolicyTls instance) {
  final val = <String, dynamic>{
    'validation': instance.validation.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enforce', instance.enforce);
  writeNotNull('ports', instance.ports);
  return val;
}

CreateGatewayRouteOutput _$CreateGatewayRouteOutputFromJson(
    Map<String, dynamic> json) {
  return CreateGatewayRouteOutput(
    gatewayRoute:
        GatewayRouteData.fromJson(json['gatewayRoute'] as Map<String, dynamic>),
  );
}

CreateMeshOutput _$CreateMeshOutputFromJson(Map<String, dynamic> json) {
  return CreateMeshOutput(
    mesh: MeshData.fromJson(json['mesh'] as Map<String, dynamic>),
  );
}

CreateRouteOutput _$CreateRouteOutputFromJson(Map<String, dynamic> json) {
  return CreateRouteOutput(
    route: RouteData.fromJson(json['route'] as Map<String, dynamic>),
  );
}

CreateVirtualGatewayOutput _$CreateVirtualGatewayOutputFromJson(
    Map<String, dynamic> json) {
  return CreateVirtualGatewayOutput(
    virtualGateway: VirtualGatewayData.fromJson(
        json['virtualGateway'] as Map<String, dynamic>),
  );
}

CreateVirtualNodeOutput _$CreateVirtualNodeOutputFromJson(
    Map<String, dynamic> json) {
  return CreateVirtualNodeOutput(
    virtualNode:
        VirtualNodeData.fromJson(json['virtualNode'] as Map<String, dynamic>),
  );
}

CreateVirtualRouterOutput _$CreateVirtualRouterOutputFromJson(
    Map<String, dynamic> json) {
  return CreateVirtualRouterOutput(
    virtualRouter: VirtualRouterData.fromJson(
        json['virtualRouter'] as Map<String, dynamic>),
  );
}

CreateVirtualServiceOutput _$CreateVirtualServiceOutputFromJson(
    Map<String, dynamic> json) {
  return CreateVirtualServiceOutput(
    virtualService: VirtualServiceData.fromJson(
        json['virtualService'] as Map<String, dynamic>),
  );
}

DeleteGatewayRouteOutput _$DeleteGatewayRouteOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteGatewayRouteOutput(
    gatewayRoute:
        GatewayRouteData.fromJson(json['gatewayRoute'] as Map<String, dynamic>),
  );
}

DeleteMeshOutput _$DeleteMeshOutputFromJson(Map<String, dynamic> json) {
  return DeleteMeshOutput(
    mesh: MeshData.fromJson(json['mesh'] as Map<String, dynamic>),
  );
}

DeleteRouteOutput _$DeleteRouteOutputFromJson(Map<String, dynamic> json) {
  return DeleteRouteOutput(
    route: RouteData.fromJson(json['route'] as Map<String, dynamic>),
  );
}

DeleteVirtualGatewayOutput _$DeleteVirtualGatewayOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteVirtualGatewayOutput(
    virtualGateway: VirtualGatewayData.fromJson(
        json['virtualGateway'] as Map<String, dynamic>),
  );
}

DeleteVirtualNodeOutput _$DeleteVirtualNodeOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteVirtualNodeOutput(
    virtualNode:
        VirtualNodeData.fromJson(json['virtualNode'] as Map<String, dynamic>),
  );
}

DeleteVirtualRouterOutput _$DeleteVirtualRouterOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteVirtualRouterOutput(
    virtualRouter: VirtualRouterData.fromJson(
        json['virtualRouter'] as Map<String, dynamic>),
  );
}

DeleteVirtualServiceOutput _$DeleteVirtualServiceOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteVirtualServiceOutput(
    virtualService: VirtualServiceData.fromJson(
        json['virtualService'] as Map<String, dynamic>),
  );
}

DescribeGatewayRouteOutput _$DescribeGatewayRouteOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeGatewayRouteOutput(
    gatewayRoute:
        GatewayRouteData.fromJson(json['gatewayRoute'] as Map<String, dynamic>),
  );
}

DescribeMeshOutput _$DescribeMeshOutputFromJson(Map<String, dynamic> json) {
  return DescribeMeshOutput(
    mesh: MeshData.fromJson(json['mesh'] as Map<String, dynamic>),
  );
}

DescribeRouteOutput _$DescribeRouteOutputFromJson(Map<String, dynamic> json) {
  return DescribeRouteOutput(
    route: RouteData.fromJson(json['route'] as Map<String, dynamic>),
  );
}

DescribeVirtualGatewayOutput _$DescribeVirtualGatewayOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeVirtualGatewayOutput(
    virtualGateway: VirtualGatewayData.fromJson(
        json['virtualGateway'] as Map<String, dynamic>),
  );
}

DescribeVirtualNodeOutput _$DescribeVirtualNodeOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeVirtualNodeOutput(
    virtualNode:
        VirtualNodeData.fromJson(json['virtualNode'] as Map<String, dynamic>),
  );
}

DescribeVirtualRouterOutput _$DescribeVirtualRouterOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeVirtualRouterOutput(
    virtualRouter: VirtualRouterData.fromJson(
        json['virtualRouter'] as Map<String, dynamic>),
  );
}

DescribeVirtualServiceOutput _$DescribeVirtualServiceOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeVirtualServiceOutput(
    virtualService: VirtualServiceData.fromJson(
        json['virtualService'] as Map<String, dynamic>),
  );
}

DnsServiceDiscovery _$DnsServiceDiscoveryFromJson(Map<String, dynamic> json) {
  return DnsServiceDiscovery(
    hostname: json['hostname'] as String,
  );
}

Map<String, dynamic> _$DnsServiceDiscoveryToJson(
        DnsServiceDiscovery instance) =>
    <String, dynamic>{
      'hostname': instance.hostname,
    };

Duration _$DurationFromJson(Map<String, dynamic> json) {
  return Duration(
    unit: _$enumDecodeNullable(_$DurationUnitEnumMap, json['unit']),
    value: json['value'] as int?,
  );
}

Map<String, dynamic> _$DurationToJson(Duration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', _$DurationUnitEnumMap[instance.unit]);
  writeNotNull('value', instance.value);
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$DurationUnitEnumMap = {
  DurationUnit.s: 's',
  DurationUnit.ms: 'ms',
};

EgressFilter _$EgressFilterFromJson(Map<String, dynamic> json) {
  return EgressFilter(
    type: _$enumDecode(_$EgressFilterTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$EgressFilterToJson(EgressFilter instance) =>
    <String, dynamic>{
      'type': _$EgressFilterTypeEnumMap[instance.type],
    };

const _$EgressFilterTypeEnumMap = {
  EgressFilterType.allowAll: 'ALLOW_ALL',
  EgressFilterType.dropAll: 'DROP_ALL',
};

FileAccessLog _$FileAccessLogFromJson(Map<String, dynamic> json) {
  return FileAccessLog(
    path: json['path'] as String,
  );
}

Map<String, dynamic> _$FileAccessLogToJson(FileAccessLog instance) =>
    <String, dynamic>{
      'path': instance.path,
    };

GatewayRouteData _$GatewayRouteDataFromJson(Map<String, dynamic> json) {
  return GatewayRouteData(
    gatewayRouteName: json['gatewayRouteName'] as String,
    meshName: json['meshName'] as String,
    metadata:
        ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: GatewayRouteSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status: GatewayRouteStatus.fromJson(json['status'] as Map<String, dynamic>),
    virtualGatewayName: json['virtualGatewayName'] as String,
  );
}

GatewayRouteRef _$GatewayRouteRefFromJson(Map<String, dynamic> json) {
  return GatewayRouteRef(
    arn: json['arn'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    gatewayRouteName: json['gatewayRouteName'] as String,
    lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
    meshName: json['meshName'] as String,
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    version: json['version'] as int,
    virtualGatewayName: json['virtualGatewayName'] as String,
  );
}

GatewayRouteSpec _$GatewayRouteSpecFromJson(Map<String, dynamic> json) {
  return GatewayRouteSpec(
    grpcRoute: json['grpcRoute'] == null
        ? null
        : GrpcGatewayRoute.fromJson(json['grpcRoute'] as Map<String, dynamic>),
    http2Route: json['http2Route'] == null
        ? null
        : HttpGatewayRoute.fromJson(json['http2Route'] as Map<String, dynamic>),
    httpRoute: json['httpRoute'] == null
        ? null
        : HttpGatewayRoute.fromJson(json['httpRoute'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GatewayRouteSpecToJson(GatewayRouteSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grpcRoute', instance.grpcRoute?.toJson());
  writeNotNull('http2Route', instance.http2Route?.toJson());
  writeNotNull('httpRoute', instance.httpRoute?.toJson());
  return val;
}

GatewayRouteStatus _$GatewayRouteStatusFromJson(Map<String, dynamic> json) {
  return GatewayRouteStatus(
    status: _$enumDecode(_$GatewayRouteStatusCodeEnumMap, json['status']),
  );
}

const _$GatewayRouteStatusCodeEnumMap = {
  GatewayRouteStatusCode.active: 'ACTIVE',
  GatewayRouteStatusCode.inactive: 'INACTIVE',
  GatewayRouteStatusCode.deleted: 'DELETED',
};

GatewayRouteTarget _$GatewayRouteTargetFromJson(Map<String, dynamic> json) {
  return GatewayRouteTarget(
    virtualService: GatewayRouteVirtualService.fromJson(
        json['virtualService'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GatewayRouteTargetToJson(GatewayRouteTarget instance) =>
    <String, dynamic>{
      'virtualService': instance.virtualService.toJson(),
    };

GatewayRouteVirtualService _$GatewayRouteVirtualServiceFromJson(
    Map<String, dynamic> json) {
  return GatewayRouteVirtualService(
    virtualServiceName: json['virtualServiceName'] as String,
  );
}

Map<String, dynamic> _$GatewayRouteVirtualServiceToJson(
        GatewayRouteVirtualService instance) =>
    <String, dynamic>{
      'virtualServiceName': instance.virtualServiceName,
    };

GrpcGatewayRoute _$GrpcGatewayRouteFromJson(Map<String, dynamic> json) {
  return GrpcGatewayRoute(
    action:
        GrpcGatewayRouteAction.fromJson(json['action'] as Map<String, dynamic>),
    match:
        GrpcGatewayRouteMatch.fromJson(json['match'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GrpcGatewayRouteToJson(GrpcGatewayRoute instance) =>
    <String, dynamic>{
      'action': instance.action.toJson(),
      'match': instance.match.toJson(),
    };

GrpcGatewayRouteAction _$GrpcGatewayRouteActionFromJson(
    Map<String, dynamic> json) {
  return GrpcGatewayRouteAction(
    target: GatewayRouteTarget.fromJson(json['target'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GrpcGatewayRouteActionToJson(
        GrpcGatewayRouteAction instance) =>
    <String, dynamic>{
      'target': instance.target.toJson(),
    };

GrpcGatewayRouteMatch _$GrpcGatewayRouteMatchFromJson(
    Map<String, dynamic> json) {
  return GrpcGatewayRouteMatch(
    serviceName: json['serviceName'] as String?,
  );
}

Map<String, dynamic> _$GrpcGatewayRouteMatchToJson(
    GrpcGatewayRouteMatch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('serviceName', instance.serviceName);
  return val;
}

GrpcRetryPolicy _$GrpcRetryPolicyFromJson(Map<String, dynamic> json) {
  return GrpcRetryPolicy(
    maxRetries: json['maxRetries'] as int,
    perRetryTimeout:
        Duration.fromJson(json['perRetryTimeout'] as Map<String, dynamic>),
    grpcRetryEvents: (json['grpcRetryEvents'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$GrpcRetryPolicyEventEnumMap, e))
        .toList(),
    httpRetryEvents: (json['httpRetryEvents'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    tcpRetryEvents: (json['tcpRetryEvents'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$TcpRetryPolicyEventEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$GrpcRetryPolicyToJson(GrpcRetryPolicy instance) {
  final val = <String, dynamic>{
    'maxRetries': instance.maxRetries,
    'perRetryTimeout': instance.perRetryTimeout.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'grpcRetryEvents',
      instance.grpcRetryEvents
          ?.map((e) => _$GrpcRetryPolicyEventEnumMap[e])
          .toList());
  writeNotNull('httpRetryEvents', instance.httpRetryEvents);
  writeNotNull(
      'tcpRetryEvents',
      instance.tcpRetryEvents
          ?.map((e) => _$TcpRetryPolicyEventEnumMap[e])
          .toList());
  return val;
}

const _$GrpcRetryPolicyEventEnumMap = {
  GrpcRetryPolicyEvent.cancelled: 'cancelled',
  GrpcRetryPolicyEvent.deadlineExceeded: 'deadline-exceeded',
  GrpcRetryPolicyEvent.internal: 'internal',
  GrpcRetryPolicyEvent.resourceExhausted: 'resource-exhausted',
  GrpcRetryPolicyEvent.unavailable: 'unavailable',
};

const _$TcpRetryPolicyEventEnumMap = {
  TcpRetryPolicyEvent.connectionError: 'connection-error',
};

GrpcRoute _$GrpcRouteFromJson(Map<String, dynamic> json) {
  return GrpcRoute(
    action: GrpcRouteAction.fromJson(json['action'] as Map<String, dynamic>),
    match: GrpcRouteMatch.fromJson(json['match'] as Map<String, dynamic>),
    retryPolicy: json['retryPolicy'] == null
        ? null
        : GrpcRetryPolicy.fromJson(json['retryPolicy'] as Map<String, dynamic>),
    timeout: json['timeout'] == null
        ? null
        : GrpcTimeout.fromJson(json['timeout'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GrpcRouteToJson(GrpcRoute instance) {
  final val = <String, dynamic>{
    'action': instance.action.toJson(),
    'match': instance.match.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('retryPolicy', instance.retryPolicy?.toJson());
  writeNotNull('timeout', instance.timeout?.toJson());
  return val;
}

GrpcRouteAction _$GrpcRouteActionFromJson(Map<String, dynamic> json) {
  return GrpcRouteAction(
    weightedTargets: (json['weightedTargets'] as List<dynamic>)
        .map((e) => WeightedTarget.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GrpcRouteActionToJson(GrpcRouteAction instance) =>
    <String, dynamic>{
      'weightedTargets':
          instance.weightedTargets.map((e) => e.toJson()).toList(),
    };

GrpcRouteMatch _$GrpcRouteMatchFromJson(Map<String, dynamic> json) {
  return GrpcRouteMatch(
    metadata: (json['metadata'] as List<dynamic>?)
        ?.map((e) => GrpcRouteMetadata.fromJson(e as Map<String, dynamic>))
        .toList(),
    methodName: json['methodName'] as String?,
    serviceName: json['serviceName'] as String?,
  );
}

Map<String, dynamic> _$GrpcRouteMatchToJson(GrpcRouteMatch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata?.map((e) => e.toJson()).toList());
  writeNotNull('methodName', instance.methodName);
  writeNotNull('serviceName', instance.serviceName);
  return val;
}

GrpcRouteMetadata _$GrpcRouteMetadataFromJson(Map<String, dynamic> json) {
  return GrpcRouteMetadata(
    name: json['name'] as String,
    invert: json['invert'] as bool?,
    match: json['match'] == null
        ? null
        : GrpcRouteMetadataMatchMethod.fromJson(
            json['match'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GrpcRouteMetadataToJson(GrpcRouteMetadata instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('invert', instance.invert);
  writeNotNull('match', instance.match?.toJson());
  return val;
}

GrpcRouteMetadataMatchMethod _$GrpcRouteMetadataMatchMethodFromJson(
    Map<String, dynamic> json) {
  return GrpcRouteMetadataMatchMethod(
    exact: json['exact'] as String?,
    prefix: json['prefix'] as String?,
    range: json['range'] == null
        ? null
        : MatchRange.fromJson(json['range'] as Map<String, dynamic>),
    regex: json['regex'] as String?,
    suffix: json['suffix'] as String?,
  );
}

Map<String, dynamic> _$GrpcRouteMetadataMatchMethodToJson(
    GrpcRouteMetadataMatchMethod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('exact', instance.exact);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('range', instance.range?.toJson());
  writeNotNull('regex', instance.regex);
  writeNotNull('suffix', instance.suffix);
  return val;
}

GrpcTimeout _$GrpcTimeoutFromJson(Map<String, dynamic> json) {
  return GrpcTimeout(
    idle: json['idle'] == null
        ? null
        : Duration.fromJson(json['idle'] as Map<String, dynamic>),
    perRequest: json['perRequest'] == null
        ? null
        : Duration.fromJson(json['perRequest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GrpcTimeoutToJson(GrpcTimeout instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('idle', instance.idle?.toJson());
  writeNotNull('perRequest', instance.perRequest?.toJson());
  return val;
}

HeaderMatchMethod _$HeaderMatchMethodFromJson(Map<String, dynamic> json) {
  return HeaderMatchMethod(
    exact: json['exact'] as String?,
    prefix: json['prefix'] as String?,
    range: json['range'] == null
        ? null
        : MatchRange.fromJson(json['range'] as Map<String, dynamic>),
    regex: json['regex'] as String?,
    suffix: json['suffix'] as String?,
  );
}

Map<String, dynamic> _$HeaderMatchMethodToJson(HeaderMatchMethod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('exact', instance.exact);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('range', instance.range?.toJson());
  writeNotNull('regex', instance.regex);
  writeNotNull('suffix', instance.suffix);
  return val;
}

HealthCheckPolicy _$HealthCheckPolicyFromJson(Map<String, dynamic> json) {
  return HealthCheckPolicy(
    healthyThreshold: json['healthyThreshold'] as int,
    intervalMillis: json['intervalMillis'] as int,
    protocol: _$enumDecode(_$PortProtocolEnumMap, json['protocol']),
    timeoutMillis: json['timeoutMillis'] as int,
    unhealthyThreshold: json['unhealthyThreshold'] as int,
    path: json['path'] as String?,
    port: json['port'] as int?,
  );
}

Map<String, dynamic> _$HealthCheckPolicyToJson(HealthCheckPolicy instance) {
  final val = <String, dynamic>{
    'healthyThreshold': instance.healthyThreshold,
    'intervalMillis': instance.intervalMillis,
    'protocol': _$PortProtocolEnumMap[instance.protocol],
    'timeoutMillis': instance.timeoutMillis,
    'unhealthyThreshold': instance.unhealthyThreshold,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('path', instance.path);
  writeNotNull('port', instance.port);
  return val;
}

const _$PortProtocolEnumMap = {
  PortProtocol.http: 'http',
  PortProtocol.tcp: 'tcp',
  PortProtocol.http2: 'http2',
  PortProtocol.grpc: 'grpc',
};

HttpGatewayRoute _$HttpGatewayRouteFromJson(Map<String, dynamic> json) {
  return HttpGatewayRoute(
    action:
        HttpGatewayRouteAction.fromJson(json['action'] as Map<String, dynamic>),
    match:
        HttpGatewayRouteMatch.fromJson(json['match'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HttpGatewayRouteToJson(HttpGatewayRoute instance) =>
    <String, dynamic>{
      'action': instance.action.toJson(),
      'match': instance.match.toJson(),
    };

HttpGatewayRouteAction _$HttpGatewayRouteActionFromJson(
    Map<String, dynamic> json) {
  return HttpGatewayRouteAction(
    target: GatewayRouteTarget.fromJson(json['target'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HttpGatewayRouteActionToJson(
        HttpGatewayRouteAction instance) =>
    <String, dynamic>{
      'target': instance.target.toJson(),
    };

HttpGatewayRouteMatch _$HttpGatewayRouteMatchFromJson(
    Map<String, dynamic> json) {
  return HttpGatewayRouteMatch(
    prefix: json['prefix'] as String,
  );
}

Map<String, dynamic> _$HttpGatewayRouteMatchToJson(
        HttpGatewayRouteMatch instance) =>
    <String, dynamic>{
      'prefix': instance.prefix,
    };

HttpRetryPolicy _$HttpRetryPolicyFromJson(Map<String, dynamic> json) {
  return HttpRetryPolicy(
    maxRetries: json['maxRetries'] as int,
    perRetryTimeout:
        Duration.fromJson(json['perRetryTimeout'] as Map<String, dynamic>),
    httpRetryEvents: (json['httpRetryEvents'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    tcpRetryEvents: (json['tcpRetryEvents'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$TcpRetryPolicyEventEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$HttpRetryPolicyToJson(HttpRetryPolicy instance) {
  final val = <String, dynamic>{
    'maxRetries': instance.maxRetries,
    'perRetryTimeout': instance.perRetryTimeout.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('httpRetryEvents', instance.httpRetryEvents);
  writeNotNull(
      'tcpRetryEvents',
      instance.tcpRetryEvents
          ?.map((e) => _$TcpRetryPolicyEventEnumMap[e])
          .toList());
  return val;
}

HttpRoute _$HttpRouteFromJson(Map<String, dynamic> json) {
  return HttpRoute(
    action: HttpRouteAction.fromJson(json['action'] as Map<String, dynamic>),
    match: HttpRouteMatch.fromJson(json['match'] as Map<String, dynamic>),
    retryPolicy: json['retryPolicy'] == null
        ? null
        : HttpRetryPolicy.fromJson(json['retryPolicy'] as Map<String, dynamic>),
    timeout: json['timeout'] == null
        ? null
        : HttpTimeout.fromJson(json['timeout'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HttpRouteToJson(HttpRoute instance) {
  final val = <String, dynamic>{
    'action': instance.action.toJson(),
    'match': instance.match.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('retryPolicy', instance.retryPolicy?.toJson());
  writeNotNull('timeout', instance.timeout?.toJson());
  return val;
}

HttpRouteAction _$HttpRouteActionFromJson(Map<String, dynamic> json) {
  return HttpRouteAction(
    weightedTargets: (json['weightedTargets'] as List<dynamic>)
        .map((e) => WeightedTarget.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HttpRouteActionToJson(HttpRouteAction instance) =>
    <String, dynamic>{
      'weightedTargets':
          instance.weightedTargets.map((e) => e.toJson()).toList(),
    };

HttpRouteHeader _$HttpRouteHeaderFromJson(Map<String, dynamic> json) {
  return HttpRouteHeader(
    name: json['name'] as String,
    invert: json['invert'] as bool?,
    match: json['match'] == null
        ? null
        : HeaderMatchMethod.fromJson(json['match'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HttpRouteHeaderToJson(HttpRouteHeader instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('invert', instance.invert);
  writeNotNull('match', instance.match?.toJson());
  return val;
}

HttpRouteMatch _$HttpRouteMatchFromJson(Map<String, dynamic> json) {
  return HttpRouteMatch(
    prefix: json['prefix'] as String,
    headers: (json['headers'] as List<dynamic>?)
        ?.map((e) => HttpRouteHeader.fromJson(e as Map<String, dynamic>))
        .toList(),
    method: _$enumDecodeNullable(_$HttpMethodEnumMap, json['method']),
    scheme: _$enumDecodeNullable(_$HttpSchemeEnumMap, json['scheme']),
  );
}

Map<String, dynamic> _$HttpRouteMatchToJson(HttpRouteMatch instance) {
  final val = <String, dynamic>{
    'prefix': instance.prefix,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('headers', instance.headers?.map((e) => e.toJson()).toList());
  writeNotNull('method', _$HttpMethodEnumMap[instance.method]);
  writeNotNull('scheme', _$HttpSchemeEnumMap[instance.scheme]);
  return val;
}

const _$HttpMethodEnumMap = {
  HttpMethod.get: 'GET',
  HttpMethod.head: 'HEAD',
  HttpMethod.post: 'POST',
  HttpMethod.put: 'PUT',
  HttpMethod.delete: 'DELETE',
  HttpMethod.connect: 'CONNECT',
  HttpMethod.options: 'OPTIONS',
  HttpMethod.trace: 'TRACE',
  HttpMethod.patch: 'PATCH',
};

const _$HttpSchemeEnumMap = {
  HttpScheme.http: 'http',
  HttpScheme.https: 'https',
};

HttpTimeout _$HttpTimeoutFromJson(Map<String, dynamic> json) {
  return HttpTimeout(
    idle: json['idle'] == null
        ? null
        : Duration.fromJson(json['idle'] as Map<String, dynamic>),
    perRequest: json['perRequest'] == null
        ? null
        : Duration.fromJson(json['perRequest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HttpTimeoutToJson(HttpTimeout instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('idle', instance.idle?.toJson());
  writeNotNull('perRequest', instance.perRequest?.toJson());
  return val;
}

ListGatewayRoutesOutput _$ListGatewayRoutesOutputFromJson(
    Map<String, dynamic> json) {
  return ListGatewayRoutesOutput(
    gatewayRoutes: (json['gatewayRoutes'] as List<dynamic>)
        .map((e) => GatewayRouteRef.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListMeshesOutput _$ListMeshesOutputFromJson(Map<String, dynamic> json) {
  return ListMeshesOutput(
    meshes: (json['meshes'] as List<dynamic>)
        .map((e) => MeshRef.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListRoutesOutput _$ListRoutesOutputFromJson(Map<String, dynamic> json) {
  return ListRoutesOutput(
    routes: (json['routes'] as List<dynamic>)
        .map((e) => RouteRef.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    tags: (json['tags'] as List<dynamic>)
        .map((e) => TagRef.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListVirtualGatewaysOutput _$ListVirtualGatewaysOutputFromJson(
    Map<String, dynamic> json) {
  return ListVirtualGatewaysOutput(
    virtualGateways: (json['virtualGateways'] as List<dynamic>)
        .map((e) => VirtualGatewayRef.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListVirtualNodesOutput _$ListVirtualNodesOutputFromJson(
    Map<String, dynamic> json) {
  return ListVirtualNodesOutput(
    virtualNodes: (json['virtualNodes'] as List<dynamic>)
        .map((e) => VirtualNodeRef.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListVirtualRoutersOutput _$ListVirtualRoutersOutputFromJson(
    Map<String, dynamic> json) {
  return ListVirtualRoutersOutput(
    virtualRouters: (json['virtualRouters'] as List<dynamic>)
        .map((e) => VirtualRouterRef.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListVirtualServicesOutput _$ListVirtualServicesOutputFromJson(
    Map<String, dynamic> json) {
  return ListVirtualServicesOutput(
    virtualServices: (json['virtualServices'] as List<dynamic>)
        .map((e) => VirtualServiceRef.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

Listener _$ListenerFromJson(Map<String, dynamic> json) {
  return Listener(
    portMapping:
        PortMapping.fromJson(json['portMapping'] as Map<String, dynamic>),
    connectionPool: json['connectionPool'] == null
        ? null
        : VirtualNodeConnectionPool.fromJson(
            json['connectionPool'] as Map<String, dynamic>),
    healthCheck: json['healthCheck'] == null
        ? null
        : HealthCheckPolicy.fromJson(
            json['healthCheck'] as Map<String, dynamic>),
    outlierDetection: json['outlierDetection'] == null
        ? null
        : OutlierDetection.fromJson(
            json['outlierDetection'] as Map<String, dynamic>),
    timeout: json['timeout'] == null
        ? null
        : ListenerTimeout.fromJson(json['timeout'] as Map<String, dynamic>),
    tls: json['tls'] == null
        ? null
        : ListenerTls.fromJson(json['tls'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListenerToJson(Listener instance) {
  final val = <String, dynamic>{
    'portMapping': instance.portMapping.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('connectionPool', instance.connectionPool?.toJson());
  writeNotNull('healthCheck', instance.healthCheck?.toJson());
  writeNotNull('outlierDetection', instance.outlierDetection?.toJson());
  writeNotNull('timeout', instance.timeout?.toJson());
  writeNotNull('tls', instance.tls?.toJson());
  return val;
}

ListenerTimeout _$ListenerTimeoutFromJson(Map<String, dynamic> json) {
  return ListenerTimeout(
    grpc: json['grpc'] == null
        ? null
        : GrpcTimeout.fromJson(json['grpc'] as Map<String, dynamic>),
    http: json['http'] == null
        ? null
        : HttpTimeout.fromJson(json['http'] as Map<String, dynamic>),
    http2: json['http2'] == null
        ? null
        : HttpTimeout.fromJson(json['http2'] as Map<String, dynamic>),
    tcp: json['tcp'] == null
        ? null
        : TcpTimeout.fromJson(json['tcp'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListenerTimeoutToJson(ListenerTimeout instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grpc', instance.grpc?.toJson());
  writeNotNull('http', instance.http?.toJson());
  writeNotNull('http2', instance.http2?.toJson());
  writeNotNull('tcp', instance.tcp?.toJson());
  return val;
}

ListenerTls _$ListenerTlsFromJson(Map<String, dynamic> json) {
  return ListenerTls(
    certificate: ListenerTlsCertificate.fromJson(
        json['certificate'] as Map<String, dynamic>),
    mode: _$enumDecode(_$ListenerTlsModeEnumMap, json['mode']),
  );
}

Map<String, dynamic> _$ListenerTlsToJson(ListenerTls instance) =>
    <String, dynamic>{
      'certificate': instance.certificate.toJson(),
      'mode': _$ListenerTlsModeEnumMap[instance.mode],
    };

const _$ListenerTlsModeEnumMap = {
  ListenerTlsMode.strict: 'STRICT',
  ListenerTlsMode.permissive: 'PERMISSIVE',
  ListenerTlsMode.disabled: 'DISABLED',
};

ListenerTlsAcmCertificate _$ListenerTlsAcmCertificateFromJson(
    Map<String, dynamic> json) {
  return ListenerTlsAcmCertificate(
    certificateArn: json['certificateArn'] as String,
  );
}

Map<String, dynamic> _$ListenerTlsAcmCertificateToJson(
        ListenerTlsAcmCertificate instance) =>
    <String, dynamic>{
      'certificateArn': instance.certificateArn,
    };

ListenerTlsCertificate _$ListenerTlsCertificateFromJson(
    Map<String, dynamic> json) {
  return ListenerTlsCertificate(
    acm: json['acm'] == null
        ? null
        : ListenerTlsAcmCertificate.fromJson(
            json['acm'] as Map<String, dynamic>),
    file: json['file'] == null
        ? null
        : ListenerTlsFileCertificate.fromJson(
            json['file'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListenerTlsCertificateToJson(
    ListenerTlsCertificate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('acm', instance.acm?.toJson());
  writeNotNull('file', instance.file?.toJson());
  return val;
}

ListenerTlsFileCertificate _$ListenerTlsFileCertificateFromJson(
    Map<String, dynamic> json) {
  return ListenerTlsFileCertificate(
    certificateChain: json['certificateChain'] as String,
    privateKey: json['privateKey'] as String,
  );
}

Map<String, dynamic> _$ListenerTlsFileCertificateToJson(
        ListenerTlsFileCertificate instance) =>
    <String, dynamic>{
      'certificateChain': instance.certificateChain,
      'privateKey': instance.privateKey,
    };

Logging _$LoggingFromJson(Map<String, dynamic> json) {
  return Logging(
    accessLog: json['accessLog'] == null
        ? null
        : AccessLog.fromJson(json['accessLog'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoggingToJson(Logging instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessLog', instance.accessLog?.toJson());
  return val;
}

MatchRange _$MatchRangeFromJson(Map<String, dynamic> json) {
  return MatchRange(
    end: json['end'] as int,
    start: json['start'] as int,
  );
}

Map<String, dynamic> _$MatchRangeToJson(MatchRange instance) =>
    <String, dynamic>{
      'end': instance.end,
      'start': instance.start,
    };

MeshData _$MeshDataFromJson(Map<String, dynamic> json) {
  return MeshData(
    meshName: json['meshName'] as String,
    metadata:
        ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: MeshSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status: MeshStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

MeshRef _$MeshRefFromJson(Map<String, dynamic> json) {
  return MeshRef(
    arn: json['arn'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
    meshName: json['meshName'] as String,
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    version: json['version'] as int,
  );
}

MeshSpec _$MeshSpecFromJson(Map<String, dynamic> json) {
  return MeshSpec(
    egressFilter: json['egressFilter'] == null
        ? null
        : EgressFilter.fromJson(json['egressFilter'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MeshSpecToJson(MeshSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('egressFilter', instance.egressFilter?.toJson());
  return val;
}

MeshStatus _$MeshStatusFromJson(Map<String, dynamic> json) {
  return MeshStatus(
    status: _$enumDecodeNullable(_$MeshStatusCodeEnumMap, json['status']),
  );
}

const _$MeshStatusCodeEnumMap = {
  MeshStatusCode.active: 'ACTIVE',
  MeshStatusCode.inactive: 'INACTIVE',
  MeshStatusCode.deleted: 'DELETED',
};

OutlierDetection _$OutlierDetectionFromJson(Map<String, dynamic> json) {
  return OutlierDetection(
    baseEjectionDuration:
        Duration.fromJson(json['baseEjectionDuration'] as Map<String, dynamic>),
    interval: Duration.fromJson(json['interval'] as Map<String, dynamic>),
    maxEjectionPercent: json['maxEjectionPercent'] as int,
    maxServerErrors: json['maxServerErrors'] as int,
  );
}

Map<String, dynamic> _$OutlierDetectionToJson(OutlierDetection instance) =>
    <String, dynamic>{
      'baseEjectionDuration': instance.baseEjectionDuration.toJson(),
      'interval': instance.interval.toJson(),
      'maxEjectionPercent': instance.maxEjectionPercent,
      'maxServerErrors': instance.maxServerErrors,
    };

PortMapping _$PortMappingFromJson(Map<String, dynamic> json) {
  return PortMapping(
    port: json['port'] as int,
    protocol: _$enumDecode(_$PortProtocolEnumMap, json['protocol']),
  );
}

Map<String, dynamic> _$PortMappingToJson(PortMapping instance) =>
    <String, dynamic>{
      'port': instance.port,
      'protocol': _$PortProtocolEnumMap[instance.protocol],
    };

ResourceMetadata _$ResourceMetadataFromJson(Map<String, dynamic> json) {
  return ResourceMetadata(
    arn: json['arn'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    uid: json['uid'] as String,
    version: json['version'] as int,
  );
}

RouteData _$RouteDataFromJson(Map<String, dynamic> json) {
  return RouteData(
    meshName: json['meshName'] as String,
    metadata:
        ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    routeName: json['routeName'] as String,
    spec: RouteSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status: RouteStatus.fromJson(json['status'] as Map<String, dynamic>),
    virtualRouterName: json['virtualRouterName'] as String,
  );
}

RouteRef _$RouteRefFromJson(Map<String, dynamic> json) {
  return RouteRef(
    arn: json['arn'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
    meshName: json['meshName'] as String,
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    routeName: json['routeName'] as String,
    version: json['version'] as int,
    virtualRouterName: json['virtualRouterName'] as String,
  );
}

RouteSpec _$RouteSpecFromJson(Map<String, dynamic> json) {
  return RouteSpec(
    grpcRoute: json['grpcRoute'] == null
        ? null
        : GrpcRoute.fromJson(json['grpcRoute'] as Map<String, dynamic>),
    http2Route: json['http2Route'] == null
        ? null
        : HttpRoute.fromJson(json['http2Route'] as Map<String, dynamic>),
    httpRoute: json['httpRoute'] == null
        ? null
        : HttpRoute.fromJson(json['httpRoute'] as Map<String, dynamic>),
    priority: json['priority'] as int?,
    tcpRoute: json['tcpRoute'] == null
        ? null
        : TcpRoute.fromJson(json['tcpRoute'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RouteSpecToJson(RouteSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grpcRoute', instance.grpcRoute?.toJson());
  writeNotNull('http2Route', instance.http2Route?.toJson());
  writeNotNull('httpRoute', instance.httpRoute?.toJson());
  writeNotNull('priority', instance.priority);
  writeNotNull('tcpRoute', instance.tcpRoute?.toJson());
  return val;
}

RouteStatus _$RouteStatusFromJson(Map<String, dynamic> json) {
  return RouteStatus(
    status: _$enumDecode(_$RouteStatusCodeEnumMap, json['status']),
  );
}

const _$RouteStatusCodeEnumMap = {
  RouteStatusCode.active: 'ACTIVE',
  RouteStatusCode.inactive: 'INACTIVE',
  RouteStatusCode.deleted: 'DELETED',
};

ServiceDiscovery _$ServiceDiscoveryFromJson(Map<String, dynamic> json) {
  return ServiceDiscovery(
    awsCloudMap: json['awsCloudMap'] == null
        ? null
        : AwsCloudMapServiceDiscovery.fromJson(
            json['awsCloudMap'] as Map<String, dynamic>),
    dns: json['dns'] == null
        ? null
        : DnsServiceDiscovery.fromJson(json['dns'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ServiceDiscoveryToJson(ServiceDiscovery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('awsCloudMap', instance.awsCloudMap?.toJson());
  writeNotNull('dns', instance.dns?.toJson());
  return val;
}

TagRef _$TagRefFromJson(Map<String, dynamic> json) {
  return TagRef(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagRefToJson(TagRef instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

TagResourceOutput _$TagResourceOutputFromJson(Map<String, dynamic> json) {
  return TagResourceOutput();
}

TcpRoute _$TcpRouteFromJson(Map<String, dynamic> json) {
  return TcpRoute(
    action: TcpRouteAction.fromJson(json['action'] as Map<String, dynamic>),
    timeout: json['timeout'] == null
        ? null
        : TcpTimeout.fromJson(json['timeout'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TcpRouteToJson(TcpRoute instance) {
  final val = <String, dynamic>{
    'action': instance.action.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timeout', instance.timeout?.toJson());
  return val;
}

TcpRouteAction _$TcpRouteActionFromJson(Map<String, dynamic> json) {
  return TcpRouteAction(
    weightedTargets: (json['weightedTargets'] as List<dynamic>)
        .map((e) => WeightedTarget.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TcpRouteActionToJson(TcpRouteAction instance) =>
    <String, dynamic>{
      'weightedTargets':
          instance.weightedTargets.map((e) => e.toJson()).toList(),
    };

TcpTimeout _$TcpTimeoutFromJson(Map<String, dynamic> json) {
  return TcpTimeout(
    idle: json['idle'] == null
        ? null
        : Duration.fromJson(json['idle'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TcpTimeoutToJson(TcpTimeout instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('idle', instance.idle?.toJson());
  return val;
}

TlsValidationContext _$TlsValidationContextFromJson(Map<String, dynamic> json) {
  return TlsValidationContext(
    trust: TlsValidationContextTrust.fromJson(
        json['trust'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TlsValidationContextToJson(
        TlsValidationContext instance) =>
    <String, dynamic>{
      'trust': instance.trust.toJson(),
    };

TlsValidationContextAcmTrust _$TlsValidationContextAcmTrustFromJson(
    Map<String, dynamic> json) {
  return TlsValidationContextAcmTrust(
    certificateAuthorityArns:
        (json['certificateAuthorityArns'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
  );
}

Map<String, dynamic> _$TlsValidationContextAcmTrustToJson(
        TlsValidationContextAcmTrust instance) =>
    <String, dynamic>{
      'certificateAuthorityArns': instance.certificateAuthorityArns,
    };

TlsValidationContextFileTrust _$TlsValidationContextFileTrustFromJson(
    Map<String, dynamic> json) {
  return TlsValidationContextFileTrust(
    certificateChain: json['certificateChain'] as String,
  );
}

Map<String, dynamic> _$TlsValidationContextFileTrustToJson(
        TlsValidationContextFileTrust instance) =>
    <String, dynamic>{
      'certificateChain': instance.certificateChain,
    };

TlsValidationContextTrust _$TlsValidationContextTrustFromJson(
    Map<String, dynamic> json) {
  return TlsValidationContextTrust(
    acm: json['acm'] == null
        ? null
        : TlsValidationContextAcmTrust.fromJson(
            json['acm'] as Map<String, dynamic>),
    file: json['file'] == null
        ? null
        : TlsValidationContextFileTrust.fromJson(
            json['file'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TlsValidationContextTrustToJson(
    TlsValidationContextTrust instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('acm', instance.acm?.toJson());
  writeNotNull('file', instance.file?.toJson());
  return val;
}

UntagResourceOutput _$UntagResourceOutputFromJson(Map<String, dynamic> json) {
  return UntagResourceOutput();
}

UpdateGatewayRouteOutput _$UpdateGatewayRouteOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGatewayRouteOutput(
    gatewayRoute:
        GatewayRouteData.fromJson(json['gatewayRoute'] as Map<String, dynamic>),
  );
}

UpdateMeshOutput _$UpdateMeshOutputFromJson(Map<String, dynamic> json) {
  return UpdateMeshOutput(
    mesh: MeshData.fromJson(json['mesh'] as Map<String, dynamic>),
  );
}

UpdateRouteOutput _$UpdateRouteOutputFromJson(Map<String, dynamic> json) {
  return UpdateRouteOutput(
    route: RouteData.fromJson(json['route'] as Map<String, dynamic>),
  );
}

UpdateVirtualGatewayOutput _$UpdateVirtualGatewayOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateVirtualGatewayOutput(
    virtualGateway: VirtualGatewayData.fromJson(
        json['virtualGateway'] as Map<String, dynamic>),
  );
}

UpdateVirtualNodeOutput _$UpdateVirtualNodeOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateVirtualNodeOutput(
    virtualNode:
        VirtualNodeData.fromJson(json['virtualNode'] as Map<String, dynamic>),
  );
}

UpdateVirtualRouterOutput _$UpdateVirtualRouterOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateVirtualRouterOutput(
    virtualRouter: VirtualRouterData.fromJson(
        json['virtualRouter'] as Map<String, dynamic>),
  );
}

UpdateVirtualServiceOutput _$UpdateVirtualServiceOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateVirtualServiceOutput(
    virtualService: VirtualServiceData.fromJson(
        json['virtualService'] as Map<String, dynamic>),
  );
}

VirtualGatewayAccessLog _$VirtualGatewayAccessLogFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayAccessLog(
    file: json['file'] == null
        ? null
        : VirtualGatewayFileAccessLog.fromJson(
            json['file'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualGatewayAccessLogToJson(
    VirtualGatewayAccessLog instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file', instance.file?.toJson());
  return val;
}

VirtualGatewayBackendDefaults _$VirtualGatewayBackendDefaultsFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayBackendDefaults(
    clientPolicy: json['clientPolicy'] == null
        ? null
        : VirtualGatewayClientPolicy.fromJson(
            json['clientPolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualGatewayBackendDefaultsToJson(
    VirtualGatewayBackendDefaults instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientPolicy', instance.clientPolicy?.toJson());
  return val;
}

VirtualGatewayClientPolicy _$VirtualGatewayClientPolicyFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayClientPolicy(
    tls: json['tls'] == null
        ? null
        : VirtualGatewayClientPolicyTls.fromJson(
            json['tls'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualGatewayClientPolicyToJson(
    VirtualGatewayClientPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tls', instance.tls?.toJson());
  return val;
}

VirtualGatewayClientPolicyTls _$VirtualGatewayClientPolicyTlsFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayClientPolicyTls(
    validation: VirtualGatewayTlsValidationContext.fromJson(
        json['validation'] as Map<String, dynamic>),
    enforce: json['enforce'] as bool?,
    ports: (json['ports'] as List<dynamic>?)?.map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$VirtualGatewayClientPolicyTlsToJson(
    VirtualGatewayClientPolicyTls instance) {
  final val = <String, dynamic>{
    'validation': instance.validation.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enforce', instance.enforce);
  writeNotNull('ports', instance.ports);
  return val;
}

VirtualGatewayConnectionPool _$VirtualGatewayConnectionPoolFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayConnectionPool(
    grpc: json['grpc'] == null
        ? null
        : VirtualGatewayGrpcConnectionPool.fromJson(
            json['grpc'] as Map<String, dynamic>),
    http: json['http'] == null
        ? null
        : VirtualGatewayHttpConnectionPool.fromJson(
            json['http'] as Map<String, dynamic>),
    http2: json['http2'] == null
        ? null
        : VirtualGatewayHttp2ConnectionPool.fromJson(
            json['http2'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualGatewayConnectionPoolToJson(
    VirtualGatewayConnectionPool instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grpc', instance.grpc?.toJson());
  writeNotNull('http', instance.http?.toJson());
  writeNotNull('http2', instance.http2?.toJson());
  return val;
}

VirtualGatewayData _$VirtualGatewayDataFromJson(Map<String, dynamic> json) {
  return VirtualGatewayData(
    meshName: json['meshName'] as String,
    metadata:
        ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: VirtualGatewaySpec.fromJson(json['spec'] as Map<String, dynamic>),
    status:
        VirtualGatewayStatus.fromJson(json['status'] as Map<String, dynamic>),
    virtualGatewayName: json['virtualGatewayName'] as String,
  );
}

VirtualGatewayFileAccessLog _$VirtualGatewayFileAccessLogFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayFileAccessLog(
    path: json['path'] as String,
  );
}

Map<String, dynamic> _$VirtualGatewayFileAccessLogToJson(
        VirtualGatewayFileAccessLog instance) =>
    <String, dynamic>{
      'path': instance.path,
    };

VirtualGatewayGrpcConnectionPool _$VirtualGatewayGrpcConnectionPoolFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayGrpcConnectionPool(
    maxRequests: json['maxRequests'] as int,
  );
}

Map<String, dynamic> _$VirtualGatewayGrpcConnectionPoolToJson(
        VirtualGatewayGrpcConnectionPool instance) =>
    <String, dynamic>{
      'maxRequests': instance.maxRequests,
    };

VirtualGatewayHealthCheckPolicy _$VirtualGatewayHealthCheckPolicyFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayHealthCheckPolicy(
    healthyThreshold: json['healthyThreshold'] as int,
    intervalMillis: json['intervalMillis'] as int,
    protocol:
        _$enumDecode(_$VirtualGatewayPortProtocolEnumMap, json['protocol']),
    timeoutMillis: json['timeoutMillis'] as int,
    unhealthyThreshold: json['unhealthyThreshold'] as int,
    path: json['path'] as String?,
    port: json['port'] as int?,
  );
}

Map<String, dynamic> _$VirtualGatewayHealthCheckPolicyToJson(
    VirtualGatewayHealthCheckPolicy instance) {
  final val = <String, dynamic>{
    'healthyThreshold': instance.healthyThreshold,
    'intervalMillis': instance.intervalMillis,
    'protocol': _$VirtualGatewayPortProtocolEnumMap[instance.protocol],
    'timeoutMillis': instance.timeoutMillis,
    'unhealthyThreshold': instance.unhealthyThreshold,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('path', instance.path);
  writeNotNull('port', instance.port);
  return val;
}

const _$VirtualGatewayPortProtocolEnumMap = {
  VirtualGatewayPortProtocol.http: 'http',
  VirtualGatewayPortProtocol.http2: 'http2',
  VirtualGatewayPortProtocol.grpc: 'grpc',
};

VirtualGatewayHttp2ConnectionPool _$VirtualGatewayHttp2ConnectionPoolFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayHttp2ConnectionPool(
    maxRequests: json['maxRequests'] as int,
  );
}

Map<String, dynamic> _$VirtualGatewayHttp2ConnectionPoolToJson(
        VirtualGatewayHttp2ConnectionPool instance) =>
    <String, dynamic>{
      'maxRequests': instance.maxRequests,
    };

VirtualGatewayHttpConnectionPool _$VirtualGatewayHttpConnectionPoolFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayHttpConnectionPool(
    maxConnections: json['maxConnections'] as int,
    maxPendingRequests: json['maxPendingRequests'] as int?,
  );
}

Map<String, dynamic> _$VirtualGatewayHttpConnectionPoolToJson(
    VirtualGatewayHttpConnectionPool instance) {
  final val = <String, dynamic>{
    'maxConnections': instance.maxConnections,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxPendingRequests', instance.maxPendingRequests);
  return val;
}

VirtualGatewayListener _$VirtualGatewayListenerFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayListener(
    portMapping: VirtualGatewayPortMapping.fromJson(
        json['portMapping'] as Map<String, dynamic>),
    connectionPool: json['connectionPool'] == null
        ? null
        : VirtualGatewayConnectionPool.fromJson(
            json['connectionPool'] as Map<String, dynamic>),
    healthCheck: json['healthCheck'] == null
        ? null
        : VirtualGatewayHealthCheckPolicy.fromJson(
            json['healthCheck'] as Map<String, dynamic>),
    tls: json['tls'] == null
        ? null
        : VirtualGatewayListenerTls.fromJson(
            json['tls'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualGatewayListenerToJson(
    VirtualGatewayListener instance) {
  final val = <String, dynamic>{
    'portMapping': instance.portMapping.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('connectionPool', instance.connectionPool?.toJson());
  writeNotNull('healthCheck', instance.healthCheck?.toJson());
  writeNotNull('tls', instance.tls?.toJson());
  return val;
}

VirtualGatewayListenerTls _$VirtualGatewayListenerTlsFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayListenerTls(
    certificate: VirtualGatewayListenerTlsCertificate.fromJson(
        json['certificate'] as Map<String, dynamic>),
    mode: _$enumDecode(_$VirtualGatewayListenerTlsModeEnumMap, json['mode']),
  );
}

Map<String, dynamic> _$VirtualGatewayListenerTlsToJson(
        VirtualGatewayListenerTls instance) =>
    <String, dynamic>{
      'certificate': instance.certificate.toJson(),
      'mode': _$VirtualGatewayListenerTlsModeEnumMap[instance.mode],
    };

const _$VirtualGatewayListenerTlsModeEnumMap = {
  VirtualGatewayListenerTlsMode.strict: 'STRICT',
  VirtualGatewayListenerTlsMode.permissive: 'PERMISSIVE',
  VirtualGatewayListenerTlsMode.disabled: 'DISABLED',
};

VirtualGatewayListenerTlsAcmCertificate
    _$VirtualGatewayListenerTlsAcmCertificateFromJson(
        Map<String, dynamic> json) {
  return VirtualGatewayListenerTlsAcmCertificate(
    certificateArn: json['certificateArn'] as String,
  );
}

Map<String, dynamic> _$VirtualGatewayListenerTlsAcmCertificateToJson(
        VirtualGatewayListenerTlsAcmCertificate instance) =>
    <String, dynamic>{
      'certificateArn': instance.certificateArn,
    };

VirtualGatewayListenerTlsCertificate
    _$VirtualGatewayListenerTlsCertificateFromJson(Map<String, dynamic> json) {
  return VirtualGatewayListenerTlsCertificate(
    acm: json['acm'] == null
        ? null
        : VirtualGatewayListenerTlsAcmCertificate.fromJson(
            json['acm'] as Map<String, dynamic>),
    file: json['file'] == null
        ? null
        : VirtualGatewayListenerTlsFileCertificate.fromJson(
            json['file'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualGatewayListenerTlsCertificateToJson(
    VirtualGatewayListenerTlsCertificate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('acm', instance.acm?.toJson());
  writeNotNull('file', instance.file?.toJson());
  return val;
}

VirtualGatewayListenerTlsFileCertificate
    _$VirtualGatewayListenerTlsFileCertificateFromJson(
        Map<String, dynamic> json) {
  return VirtualGatewayListenerTlsFileCertificate(
    certificateChain: json['certificateChain'] as String,
    privateKey: json['privateKey'] as String,
  );
}

Map<String, dynamic> _$VirtualGatewayListenerTlsFileCertificateToJson(
        VirtualGatewayListenerTlsFileCertificate instance) =>
    <String, dynamic>{
      'certificateChain': instance.certificateChain,
      'privateKey': instance.privateKey,
    };

VirtualGatewayLogging _$VirtualGatewayLoggingFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayLogging(
    accessLog: json['accessLog'] == null
        ? null
        : VirtualGatewayAccessLog.fromJson(
            json['accessLog'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualGatewayLoggingToJson(
    VirtualGatewayLogging instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessLog', instance.accessLog?.toJson());
  return val;
}

VirtualGatewayPortMapping _$VirtualGatewayPortMappingFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayPortMapping(
    port: json['port'] as int,
    protocol:
        _$enumDecode(_$VirtualGatewayPortProtocolEnumMap, json['protocol']),
  );
}

Map<String, dynamic> _$VirtualGatewayPortMappingToJson(
        VirtualGatewayPortMapping instance) =>
    <String, dynamic>{
      'port': instance.port,
      'protocol': _$VirtualGatewayPortProtocolEnumMap[instance.protocol],
    };

VirtualGatewayRef _$VirtualGatewayRefFromJson(Map<String, dynamic> json) {
  return VirtualGatewayRef(
    arn: json['arn'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
    meshName: json['meshName'] as String,
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    version: json['version'] as int,
    virtualGatewayName: json['virtualGatewayName'] as String,
  );
}

VirtualGatewaySpec _$VirtualGatewaySpecFromJson(Map<String, dynamic> json) {
  return VirtualGatewaySpec(
    listeners: (json['listeners'] as List<dynamic>)
        .map((e) => VirtualGatewayListener.fromJson(e as Map<String, dynamic>))
        .toList(),
    backendDefaults: json['backendDefaults'] == null
        ? null
        : VirtualGatewayBackendDefaults.fromJson(
            json['backendDefaults'] as Map<String, dynamic>),
    logging: json['logging'] == null
        ? null
        : VirtualGatewayLogging.fromJson(
            json['logging'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualGatewaySpecToJson(VirtualGatewaySpec instance) {
  final val = <String, dynamic>{
    'listeners': instance.listeners.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('backendDefaults', instance.backendDefaults?.toJson());
  writeNotNull('logging', instance.logging?.toJson());
  return val;
}

VirtualGatewayStatus _$VirtualGatewayStatusFromJson(Map<String, dynamic> json) {
  return VirtualGatewayStatus(
    status: _$enumDecode(_$VirtualGatewayStatusCodeEnumMap, json['status']),
  );
}

const _$VirtualGatewayStatusCodeEnumMap = {
  VirtualGatewayStatusCode.active: 'ACTIVE',
  VirtualGatewayStatusCode.inactive: 'INACTIVE',
  VirtualGatewayStatusCode.deleted: 'DELETED',
};

VirtualGatewayTlsValidationContext _$VirtualGatewayTlsValidationContextFromJson(
    Map<String, dynamic> json) {
  return VirtualGatewayTlsValidationContext(
    trust: VirtualGatewayTlsValidationContextTrust.fromJson(
        json['trust'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualGatewayTlsValidationContextToJson(
        VirtualGatewayTlsValidationContext instance) =>
    <String, dynamic>{
      'trust': instance.trust.toJson(),
    };

VirtualGatewayTlsValidationContextAcmTrust
    _$VirtualGatewayTlsValidationContextAcmTrustFromJson(
        Map<String, dynamic> json) {
  return VirtualGatewayTlsValidationContextAcmTrust(
    certificateAuthorityArns:
        (json['certificateAuthorityArns'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
  );
}

Map<String, dynamic> _$VirtualGatewayTlsValidationContextAcmTrustToJson(
        VirtualGatewayTlsValidationContextAcmTrust instance) =>
    <String, dynamic>{
      'certificateAuthorityArns': instance.certificateAuthorityArns,
    };

VirtualGatewayTlsValidationContextFileTrust
    _$VirtualGatewayTlsValidationContextFileTrustFromJson(
        Map<String, dynamic> json) {
  return VirtualGatewayTlsValidationContextFileTrust(
    certificateChain: json['certificateChain'] as String,
  );
}

Map<String, dynamic> _$VirtualGatewayTlsValidationContextFileTrustToJson(
        VirtualGatewayTlsValidationContextFileTrust instance) =>
    <String, dynamic>{
      'certificateChain': instance.certificateChain,
    };

VirtualGatewayTlsValidationContextTrust
    _$VirtualGatewayTlsValidationContextTrustFromJson(
        Map<String, dynamic> json) {
  return VirtualGatewayTlsValidationContextTrust(
    acm: json['acm'] == null
        ? null
        : VirtualGatewayTlsValidationContextAcmTrust.fromJson(
            json['acm'] as Map<String, dynamic>),
    file: json['file'] == null
        ? null
        : VirtualGatewayTlsValidationContextFileTrust.fromJson(
            json['file'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualGatewayTlsValidationContextTrustToJson(
    VirtualGatewayTlsValidationContextTrust instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('acm', instance.acm?.toJson());
  writeNotNull('file', instance.file?.toJson());
  return val;
}

VirtualNodeConnectionPool _$VirtualNodeConnectionPoolFromJson(
    Map<String, dynamic> json) {
  return VirtualNodeConnectionPool(
    grpc: json['grpc'] == null
        ? null
        : VirtualNodeGrpcConnectionPool.fromJson(
            json['grpc'] as Map<String, dynamic>),
    http: json['http'] == null
        ? null
        : VirtualNodeHttpConnectionPool.fromJson(
            json['http'] as Map<String, dynamic>),
    http2: json['http2'] == null
        ? null
        : VirtualNodeHttp2ConnectionPool.fromJson(
            json['http2'] as Map<String, dynamic>),
    tcp: json['tcp'] == null
        ? null
        : VirtualNodeTcpConnectionPool.fromJson(
            json['tcp'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualNodeConnectionPoolToJson(
    VirtualNodeConnectionPool instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grpc', instance.grpc?.toJson());
  writeNotNull('http', instance.http?.toJson());
  writeNotNull('http2', instance.http2?.toJson());
  writeNotNull('tcp', instance.tcp?.toJson());
  return val;
}

VirtualNodeData _$VirtualNodeDataFromJson(Map<String, dynamic> json) {
  return VirtualNodeData(
    meshName: json['meshName'] as String,
    metadata:
        ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: VirtualNodeSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status: VirtualNodeStatus.fromJson(json['status'] as Map<String, dynamic>),
    virtualNodeName: json['virtualNodeName'] as String,
  );
}

VirtualNodeGrpcConnectionPool _$VirtualNodeGrpcConnectionPoolFromJson(
    Map<String, dynamic> json) {
  return VirtualNodeGrpcConnectionPool(
    maxRequests: json['maxRequests'] as int,
  );
}

Map<String, dynamic> _$VirtualNodeGrpcConnectionPoolToJson(
        VirtualNodeGrpcConnectionPool instance) =>
    <String, dynamic>{
      'maxRequests': instance.maxRequests,
    };

VirtualNodeHttp2ConnectionPool _$VirtualNodeHttp2ConnectionPoolFromJson(
    Map<String, dynamic> json) {
  return VirtualNodeHttp2ConnectionPool(
    maxRequests: json['maxRequests'] as int,
  );
}

Map<String, dynamic> _$VirtualNodeHttp2ConnectionPoolToJson(
        VirtualNodeHttp2ConnectionPool instance) =>
    <String, dynamic>{
      'maxRequests': instance.maxRequests,
    };

VirtualNodeHttpConnectionPool _$VirtualNodeHttpConnectionPoolFromJson(
    Map<String, dynamic> json) {
  return VirtualNodeHttpConnectionPool(
    maxConnections: json['maxConnections'] as int,
    maxPendingRequests: json['maxPendingRequests'] as int?,
  );
}

Map<String, dynamic> _$VirtualNodeHttpConnectionPoolToJson(
    VirtualNodeHttpConnectionPool instance) {
  final val = <String, dynamic>{
    'maxConnections': instance.maxConnections,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxPendingRequests', instance.maxPendingRequests);
  return val;
}

VirtualNodeRef _$VirtualNodeRefFromJson(Map<String, dynamic> json) {
  return VirtualNodeRef(
    arn: json['arn'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
    meshName: json['meshName'] as String,
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    version: json['version'] as int,
    virtualNodeName: json['virtualNodeName'] as String,
  );
}

VirtualNodeServiceProvider _$VirtualNodeServiceProviderFromJson(
    Map<String, dynamic> json) {
  return VirtualNodeServiceProvider(
    virtualNodeName: json['virtualNodeName'] as String,
  );
}

Map<String, dynamic> _$VirtualNodeServiceProviderToJson(
        VirtualNodeServiceProvider instance) =>
    <String, dynamic>{
      'virtualNodeName': instance.virtualNodeName,
    };

VirtualNodeSpec _$VirtualNodeSpecFromJson(Map<String, dynamic> json) {
  return VirtualNodeSpec(
    backendDefaults: json['backendDefaults'] == null
        ? null
        : BackendDefaults.fromJson(
            json['backendDefaults'] as Map<String, dynamic>),
    backends: (json['backends'] as List<dynamic>?)
        ?.map((e) => Backend.fromJson(e as Map<String, dynamic>))
        .toList(),
    listeners: (json['listeners'] as List<dynamic>?)
        ?.map((e) => Listener.fromJson(e as Map<String, dynamic>))
        .toList(),
    logging: json['logging'] == null
        ? null
        : Logging.fromJson(json['logging'] as Map<String, dynamic>),
    serviceDiscovery: json['serviceDiscovery'] == null
        ? null
        : ServiceDiscovery.fromJson(
            json['serviceDiscovery'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualNodeSpecToJson(VirtualNodeSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('backendDefaults', instance.backendDefaults?.toJson());
  writeNotNull('backends', instance.backends?.map((e) => e.toJson()).toList());
  writeNotNull(
      'listeners', instance.listeners?.map((e) => e.toJson()).toList());
  writeNotNull('logging', instance.logging?.toJson());
  writeNotNull('serviceDiscovery', instance.serviceDiscovery?.toJson());
  return val;
}

VirtualNodeStatus _$VirtualNodeStatusFromJson(Map<String, dynamic> json) {
  return VirtualNodeStatus(
    status: _$enumDecode(_$VirtualNodeStatusCodeEnumMap, json['status']),
  );
}

const _$VirtualNodeStatusCodeEnumMap = {
  VirtualNodeStatusCode.active: 'ACTIVE',
  VirtualNodeStatusCode.inactive: 'INACTIVE',
  VirtualNodeStatusCode.deleted: 'DELETED',
};

VirtualNodeTcpConnectionPool _$VirtualNodeTcpConnectionPoolFromJson(
    Map<String, dynamic> json) {
  return VirtualNodeTcpConnectionPool(
    maxConnections: json['maxConnections'] as int,
  );
}

Map<String, dynamic> _$VirtualNodeTcpConnectionPoolToJson(
        VirtualNodeTcpConnectionPool instance) =>
    <String, dynamic>{
      'maxConnections': instance.maxConnections,
    };

VirtualRouterData _$VirtualRouterDataFromJson(Map<String, dynamic> json) {
  return VirtualRouterData(
    meshName: json['meshName'] as String,
    metadata:
        ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: VirtualRouterSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status:
        VirtualRouterStatus.fromJson(json['status'] as Map<String, dynamic>),
    virtualRouterName: json['virtualRouterName'] as String,
  );
}

VirtualRouterListener _$VirtualRouterListenerFromJson(
    Map<String, dynamic> json) {
  return VirtualRouterListener(
    portMapping:
        PortMapping.fromJson(json['portMapping'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualRouterListenerToJson(
        VirtualRouterListener instance) =>
    <String, dynamic>{
      'portMapping': instance.portMapping.toJson(),
    };

VirtualRouterRef _$VirtualRouterRefFromJson(Map<String, dynamic> json) {
  return VirtualRouterRef(
    arn: json['arn'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
    meshName: json['meshName'] as String,
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    version: json['version'] as int,
    virtualRouterName: json['virtualRouterName'] as String,
  );
}

VirtualRouterServiceProvider _$VirtualRouterServiceProviderFromJson(
    Map<String, dynamic> json) {
  return VirtualRouterServiceProvider(
    virtualRouterName: json['virtualRouterName'] as String,
  );
}

Map<String, dynamic> _$VirtualRouterServiceProviderToJson(
        VirtualRouterServiceProvider instance) =>
    <String, dynamic>{
      'virtualRouterName': instance.virtualRouterName,
    };

VirtualRouterSpec _$VirtualRouterSpecFromJson(Map<String, dynamic> json) {
  return VirtualRouterSpec(
    listeners: (json['listeners'] as List<dynamic>?)
        ?.map((e) => VirtualRouterListener.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$VirtualRouterSpecToJson(VirtualRouterSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'listeners', instance.listeners?.map((e) => e.toJson()).toList());
  return val;
}

VirtualRouterStatus _$VirtualRouterStatusFromJson(Map<String, dynamic> json) {
  return VirtualRouterStatus(
    status: _$enumDecode(_$VirtualRouterStatusCodeEnumMap, json['status']),
  );
}

const _$VirtualRouterStatusCodeEnumMap = {
  VirtualRouterStatusCode.active: 'ACTIVE',
  VirtualRouterStatusCode.inactive: 'INACTIVE',
  VirtualRouterStatusCode.deleted: 'DELETED',
};

VirtualServiceBackend _$VirtualServiceBackendFromJson(
    Map<String, dynamic> json) {
  return VirtualServiceBackend(
    virtualServiceName: json['virtualServiceName'] as String,
    clientPolicy: json['clientPolicy'] == null
        ? null
        : ClientPolicy.fromJson(json['clientPolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualServiceBackendToJson(
    VirtualServiceBackend instance) {
  final val = <String, dynamic>{
    'virtualServiceName': instance.virtualServiceName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientPolicy', instance.clientPolicy?.toJson());
  return val;
}

VirtualServiceData _$VirtualServiceDataFromJson(Map<String, dynamic> json) {
  return VirtualServiceData(
    meshName: json['meshName'] as String,
    metadata:
        ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: VirtualServiceSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status:
        VirtualServiceStatus.fromJson(json['status'] as Map<String, dynamic>),
    virtualServiceName: json['virtualServiceName'] as String,
  );
}

VirtualServiceProvider _$VirtualServiceProviderFromJson(
    Map<String, dynamic> json) {
  return VirtualServiceProvider(
    virtualNode: json['virtualNode'] == null
        ? null
        : VirtualNodeServiceProvider.fromJson(
            json['virtualNode'] as Map<String, dynamic>),
    virtualRouter: json['virtualRouter'] == null
        ? null
        : VirtualRouterServiceProvider.fromJson(
            json['virtualRouter'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualServiceProviderToJson(
    VirtualServiceProvider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('virtualNode', instance.virtualNode?.toJson());
  writeNotNull('virtualRouter', instance.virtualRouter?.toJson());
  return val;
}

VirtualServiceRef _$VirtualServiceRefFromJson(Map<String, dynamic> json) {
  return VirtualServiceRef(
    arn: json['arn'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
    meshName: json['meshName'] as String,
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    version: json['version'] as int,
    virtualServiceName: json['virtualServiceName'] as String,
  );
}

VirtualServiceSpec _$VirtualServiceSpecFromJson(Map<String, dynamic> json) {
  return VirtualServiceSpec(
    provider: json['provider'] == null
        ? null
        : VirtualServiceProvider.fromJson(
            json['provider'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualServiceSpecToJson(VirtualServiceSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('provider', instance.provider?.toJson());
  return val;
}

VirtualServiceStatus _$VirtualServiceStatusFromJson(Map<String, dynamic> json) {
  return VirtualServiceStatus(
    status: _$enumDecode(_$VirtualServiceStatusCodeEnumMap, json['status']),
  );
}

const _$VirtualServiceStatusCodeEnumMap = {
  VirtualServiceStatusCode.active: 'ACTIVE',
  VirtualServiceStatusCode.inactive: 'INACTIVE',
  VirtualServiceStatusCode.deleted: 'DELETED',
};

WeightedTarget _$WeightedTargetFromJson(Map<String, dynamic> json) {
  return WeightedTarget(
    virtualNode: json['virtualNode'] as String,
    weight: json['weight'] as int,
  );
}

Map<String, dynamic> _$WeightedTargetToJson(WeightedTarget instance) =>
    <String, dynamic>{
      'virtualNode': instance.virtualNode,
      'weight': instance.weight,
    };

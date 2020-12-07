// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appmesh-2019-01-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VirtualRouterListener _$VirtualRouterListenerFromJson(
    Map<String, dynamic> json) {
  return VirtualRouterListener(
    portMapping: json['portMapping'] == null
        ? null
        : PortMapping.fromJson(json['portMapping'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VirtualRouterListenerToJson(
    VirtualRouterListener instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('portMapping', instance.portMapping?.toJson());
  return val;
}

GrpcRetryPolicy _$GrpcRetryPolicyFromJson(Map<String, dynamic> json) {
  return GrpcRetryPolicy(
    maxRetries: json['maxRetries'] as int,
    perRetryTimeout: json['perRetryTimeout'] == null
        ? null
        : Duration.fromJson(json['perRetryTimeout'] as Map<String, dynamic>),
    grpcRetryEvents: (json['grpcRetryEvents'] as List)
        ?.map((e) => _$enumDecodeNullable(_$GrpcRetryPolicyEventEnumMap, e))
        ?.toList(),
    httpRetryEvents:
        (json['httpRetryEvents'] as List)?.map((e) => e as String)?.toList(),
    tcpRetryEvents: (json['tcpRetryEvents'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TcpRetryPolicyEventEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$GrpcRetryPolicyToJson(GrpcRetryPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxRetries', instance.maxRetries);
  writeNotNull('perRetryTimeout', instance.perRetryTimeout?.toJson());
  writeNotNull(
      'grpcRetryEvents',
      instance.grpcRetryEvents
          ?.map((e) => _$GrpcRetryPolicyEventEnumMap[e])
          ?.toList());
  writeNotNull('httpRetryEvents', instance.httpRetryEvents);
  writeNotNull(
      'tcpRetryEvents',
      instance.tcpRetryEvents
          ?.map((e) => _$TcpRetryPolicyEventEnumMap[e])
          ?.toList());
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

CreateVirtualNodeOutput _$CreateVirtualNodeOutputFromJson(
    Map<String, dynamic> json) {
  return CreateVirtualNodeOutput(
    virtualNode: json['virtualNode'] == null
        ? null
        : VirtualNodeData.fromJson(json['virtualNode'] as Map<String, dynamic>),
  );
}

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

UpdateVirtualRouterOutput _$UpdateVirtualRouterOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateVirtualRouterOutput(
    virtualRouter: json['virtualRouter'] == null
        ? null
        : VirtualRouterData.fromJson(
            json['virtualRouter'] as Map<String, dynamic>),
  );
}

ListVirtualRoutersOutput _$ListVirtualRoutersOutputFromJson(
    Map<String, dynamic> json) {
  return ListVirtualRoutersOutput(
    virtualRouters: (json['virtualRouters'] as List)
        ?.map((e) => e == null
            ? null
            : VirtualRouterRef.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ResourceMetadata _$ResourceMetadataFromJson(Map<String, dynamic> json) {
  return ResourceMetadata(
    arn: json['arn'] as String,
    createdAt: timeStampFromJson(json['createdAt']),
    lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    uid: json['uid'] as String,
    version: json['version'] as int,
  );
}

UpdateVirtualNodeOutput _$UpdateVirtualNodeOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateVirtualNodeOutput(
    virtualNode: json['virtualNode'] == null
        ? null
        : VirtualNodeData.fromJson(json['virtualNode'] as Map<String, dynamic>),
  );
}

ListRoutesOutput _$ListRoutesOutputFromJson(Map<String, dynamic> json) {
  return ListRoutesOutput(
    routes: (json['routes'] as List)
        ?.map((e) =>
            e == null ? null : RouteRef.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('virtualServiceName', instance.virtualServiceName);
  writeNotNull('clientPolicy', instance.clientPolicy?.toJson());
  return val;
}

HealthCheckPolicy _$HealthCheckPolicyFromJson(Map<String, dynamic> json) {
  return HealthCheckPolicy(
    healthyThreshold: json['healthyThreshold'] as int,
    intervalMillis: json['intervalMillis'] as int,
    protocol: _$enumDecodeNullable(_$PortProtocolEnumMap, json['protocol']),
    timeoutMillis: json['timeoutMillis'] as int,
    unhealthyThreshold: json['unhealthyThreshold'] as int,
    path: json['path'] as String,
    port: json['port'] as int,
  );
}

Map<String, dynamic> _$HealthCheckPolicyToJson(HealthCheckPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('healthyThreshold', instance.healthyThreshold);
  writeNotNull('intervalMillis', instance.intervalMillis);
  writeNotNull('protocol', _$PortProtocolEnumMap[instance.protocol]);
  writeNotNull('timeoutMillis', instance.timeoutMillis);
  writeNotNull('unhealthyThreshold', instance.unhealthyThreshold);
  writeNotNull('path', instance.path);
  writeNotNull('port', instance.port);
  return val;
}

const _$PortProtocolEnumMap = {
  PortProtocol.grpc: 'grpc',
  PortProtocol.http: 'http',
  PortProtocol.http2: 'http2',
  PortProtocol.tcp: 'tcp',
};

EgressFilter _$EgressFilterFromJson(Map<String, dynamic> json) {
  return EgressFilter(
    type: _$enumDecodeNullable(_$EgressFilterTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$EgressFilterToJson(EgressFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$EgressFilterTypeEnumMap[instance.type]);
  return val;
}

const _$EgressFilterTypeEnumMap = {
  EgressFilterType.allowAll: 'ALLOW_ALL',
  EgressFilterType.dropAll: 'DROP_ALL',
};

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

DescribeVirtualServiceOutput _$DescribeVirtualServiceOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeVirtualServiceOutput(
    virtualService: json['virtualService'] == null
        ? null
        : VirtualServiceData.fromJson(
            json['virtualService'] as Map<String, dynamic>),
  );
}

DescribeVirtualNodeOutput _$DescribeVirtualNodeOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeVirtualNodeOutput(
    virtualNode: json['virtualNode'] == null
        ? null
        : VirtualNodeData.fromJson(json['virtualNode'] as Map<String, dynamic>),
  );
}

CreateRouteOutput _$CreateRouteOutputFromJson(Map<String, dynamic> json) {
  return CreateRouteOutput(
    route: json['route'] == null
        ? null
        : RouteData.fromJson(json['route'] as Map<String, dynamic>),
  );
}

DnsServiceDiscovery _$DnsServiceDiscoveryFromJson(Map<String, dynamic> json) {
  return DnsServiceDiscovery(
    hostname: json['hostname'] as String,
  );
}

Map<String, dynamic> _$DnsServiceDiscoveryToJson(DnsServiceDiscovery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hostname', instance.hostname);
  return val;
}

VirtualNodeData _$VirtualNodeDataFromJson(Map<String, dynamic> json) {
  return VirtualNodeData(
    meshName: json['meshName'] as String,
    metadata: json['metadata'] == null
        ? null
        : ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: json['spec'] == null
        ? null
        : VirtualNodeSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : VirtualNodeStatus.fromJson(json['status'] as Map<String, dynamic>),
    virtualNodeName: json['virtualNodeName'] as String,
  );
}

UntagResourceOutput _$UntagResourceOutputFromJson(Map<String, dynamic> json) {
  return UntagResourceOutput();
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

VirtualRouterData _$VirtualRouterDataFromJson(Map<String, dynamic> json) {
  return VirtualRouterData(
    meshName: json['meshName'] as String,
    metadata: json['metadata'] == null
        ? null
        : ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: json['spec'] == null
        ? null
        : VirtualRouterSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : VirtualRouterStatus.fromJson(json['status'] as Map<String, dynamic>),
    virtualRouterName: json['virtualRouterName'] as String,
  );
}

DescribeVirtualRouterOutput _$DescribeVirtualRouterOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeVirtualRouterOutput(
    virtualRouter: json['virtualRouter'] == null
        ? null
        : VirtualRouterData.fromJson(
            json['virtualRouter'] as Map<String, dynamic>),
  );
}

CreateMeshOutput _$CreateMeshOutputFromJson(Map<String, dynamic> json) {
  return CreateMeshOutput(
    mesh: json['mesh'] == null
        ? null
        : MeshData.fromJson(json['mesh'] as Map<String, dynamic>),
  );
}

CreateVirtualRouterOutput _$CreateVirtualRouterOutputFromJson(
    Map<String, dynamic> json) {
  return CreateVirtualRouterOutput(
    virtualRouter: json['virtualRouter'] == null
        ? null
        : VirtualRouterData.fromJson(
            json['virtualRouter'] as Map<String, dynamic>),
  );
}

VirtualServiceStatus _$VirtualServiceStatusFromJson(Map<String, dynamic> json) {
  return VirtualServiceStatus(
    status:
        _$enumDecodeNullable(_$VirtualServiceStatusCodeEnumMap, json['status']),
  );
}

const _$VirtualServiceStatusCodeEnumMap = {
  VirtualServiceStatusCode.active: 'ACTIVE',
  VirtualServiceStatusCode.deleted: 'DELETED',
  VirtualServiceStatusCode.inactive: 'INACTIVE',
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

VirtualRouterSpec _$VirtualRouterSpecFromJson(Map<String, dynamic> json) {
  return VirtualRouterSpec(
    listeners: (json['listeners'] as List)
        ?.map((e) => e == null
            ? null
            : VirtualRouterListener.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
      'listeners', instance.listeners?.map((e) => e?.toJson())?.toList());
  return val;
}

VirtualNodeSpec _$VirtualNodeSpecFromJson(Map<String, dynamic> json) {
  return VirtualNodeSpec(
    backendDefaults: json['backendDefaults'] == null
        ? null
        : BackendDefaults.fromJson(
            json['backendDefaults'] as Map<String, dynamic>),
    backends: (json['backends'] as List)
        ?.map((e) =>
            e == null ? null : Backend.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    listeners: (json['listeners'] as List)
        ?.map((e) =>
            e == null ? null : Listener.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
  writeNotNull(
      'backends', instance.backends?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'listeners', instance.listeners?.map((e) => e?.toJson())?.toList());
  writeNotNull('logging', instance.logging?.toJson());
  writeNotNull('serviceDiscovery', instance.serviceDiscovery?.toJson());
  return val;
}

ListMeshesOutput _$ListMeshesOutputFromJson(Map<String, dynamic> json) {
  return ListMeshesOutput(
    meshes: (json['meshes'] as List)
        ?.map((e) =>
            e == null ? null : MeshRef.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

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

PortMapping _$PortMappingFromJson(Map<String, dynamic> json) {
  return PortMapping(
    port: json['port'] as int,
    protocol: _$enumDecodeNullable(_$PortProtocolEnumMap, json['protocol']),
  );
}

Map<String, dynamic> _$PortMappingToJson(PortMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('port', instance.port);
  writeNotNull('protocol', _$PortProtocolEnumMap[instance.protocol]);
  return val;
}

ListVirtualServicesOutput _$ListVirtualServicesOutputFromJson(
    Map<String, dynamic> json) {
  return ListVirtualServicesOutput(
    virtualServices: (json['virtualServices'] as List)
        ?.map((e) => e == null
            ? null
            : VirtualServiceRef.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

WeightedTarget _$WeightedTargetFromJson(Map<String, dynamic> json) {
  return WeightedTarget(
    virtualNode: json['virtualNode'] as String,
    weight: json['weight'] as int,
  );
}

Map<String, dynamic> _$WeightedTargetToJson(WeightedTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('virtualNode', instance.virtualNode);
  writeNotNull('weight', instance.weight);
  return val;
}

RouteRef _$RouteRefFromJson(Map<String, dynamic> json) {
  return RouteRef(
    arn: json['arn'] as String,
    meshName: json['meshName'] as String,
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    routeName: json['routeName'] as String,
    virtualRouterName: json['virtualRouterName'] as String,
  );
}

RouteData _$RouteDataFromJson(Map<String, dynamic> json) {
  return RouteData(
    meshName: json['meshName'] as String,
    metadata: json['metadata'] == null
        ? null
        : ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    routeName: json['routeName'] as String,
    spec: json['spec'] == null
        ? null
        : RouteSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : RouteStatus.fromJson(json['status'] as Map<String, dynamic>),
    virtualRouterName: json['virtualRouterName'] as String,
  );
}

TlsValidationContextAcmTrust _$TlsValidationContextAcmTrustFromJson(
    Map<String, dynamic> json) {
  return TlsValidationContextAcmTrust(
    certificateAuthorityArns: (json['certificateAuthorityArns'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$TlsValidationContextAcmTrustToJson(
    TlsValidationContextAcmTrust instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificateAuthorityArns', instance.certificateAuthorityArns);
  return val;
}

HeaderMatchMethod _$HeaderMatchMethodFromJson(Map<String, dynamic> json) {
  return HeaderMatchMethod(
    exact: json['exact'] as String,
    prefix: json['prefix'] as String,
    range: json['range'] == null
        ? null
        : MatchRange.fromJson(json['range'] as Map<String, dynamic>),
    regex: json['regex'] as String,
    suffix: json['suffix'] as String,
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

DeleteMeshOutput _$DeleteMeshOutputFromJson(Map<String, dynamic> json) {
  return DeleteMeshOutput(
    mesh: json['mesh'] == null
        ? null
        : MeshData.fromJson(json['mesh'] as Map<String, dynamic>),
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

GrpcRouteMatch _$GrpcRouteMatchFromJson(Map<String, dynamic> json) {
  return GrpcRouteMatch(
    metadata: (json['metadata'] as List)
        ?.map((e) => e == null
            ? null
            : GrpcRouteMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    methodName: json['methodName'] as String,
    serviceName: json['serviceName'] as String,
  );
}

Map<String, dynamic> _$GrpcRouteMatchToJson(GrpcRouteMatch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'metadata', instance.metadata?.map((e) => e?.toJson())?.toList());
  writeNotNull('methodName', instance.methodName);
  writeNotNull('serviceName', instance.serviceName);
  return val;
}

AwsCloudMapServiceDiscovery _$AwsCloudMapServiceDiscoveryFromJson(
    Map<String, dynamic> json) {
  return AwsCloudMapServiceDiscovery(
    namespaceName: json['namespaceName'] as String,
    serviceName: json['serviceName'] as String,
    attributes: (json['attributes'] as List)
        ?.map((e) => e == null
            ? null
            : AwsCloudMapInstanceAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsCloudMapServiceDiscoveryToJson(
    AwsCloudMapServiceDiscovery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('namespaceName', instance.namespaceName);
  writeNotNull('serviceName', instance.serviceName);
  writeNotNull(
      'attributes', instance.attributes?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateVirtualServiceOutput _$UpdateVirtualServiceOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateVirtualServiceOutput(
    virtualService: json['virtualService'] == null
        ? null
        : VirtualServiceData.fromJson(
            json['virtualService'] as Map<String, dynamic>),
  );
}

MeshStatus _$MeshStatusFromJson(Map<String, dynamic> json) {
  return MeshStatus(
    status: _$enumDecodeNullable(_$MeshStatusCodeEnumMap, json['status']),
  );
}

const _$MeshStatusCodeEnumMap = {
  MeshStatusCode.active: 'ACTIVE',
  MeshStatusCode.deleted: 'DELETED',
  MeshStatusCode.inactive: 'INACTIVE',
};

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
    priority: json['priority'] as int,
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

CreateVirtualServiceOutput _$CreateVirtualServiceOutputFromJson(
    Map<String, dynamic> json) {
  return CreateVirtualServiceOutput(
    virtualService: json['virtualService'] == null
        ? null
        : VirtualServiceData.fromJson(
            json['virtualService'] as Map<String, dynamic>),
  );
}

FileAccessLog _$FileAccessLogFromJson(Map<String, dynamic> json) {
  return FileAccessLog(
    path: json['path'] as String,
  );
}

Map<String, dynamic> _$FileAccessLogToJson(FileAccessLog instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('path', instance.path);
  return val;
}

VirtualRouterServiceProvider _$VirtualRouterServiceProviderFromJson(
    Map<String, dynamic> json) {
  return VirtualRouterServiceProvider(
    virtualRouterName: json['virtualRouterName'] as String,
  );
}

Map<String, dynamic> _$VirtualRouterServiceProviderToJson(
    VirtualRouterServiceProvider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('virtualRouterName', instance.virtualRouterName);
  return val;
}

TlsValidationContext _$TlsValidationContextFromJson(Map<String, dynamic> json) {
  return TlsValidationContext(
    trust: json['trust'] == null
        ? null
        : TlsValidationContextTrust.fromJson(
            json['trust'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TlsValidationContextToJson(
    TlsValidationContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('trust', instance.trust?.toJson());
  return val;
}

DeleteVirtualRouterOutput _$DeleteVirtualRouterOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteVirtualRouterOutput(
    virtualRouter: json['virtualRouter'] == null
        ? null
        : VirtualRouterData.fromJson(
            json['virtualRouter'] as Map<String, dynamic>),
  );
}

DeleteVirtualNodeOutput _$DeleteVirtualNodeOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteVirtualNodeOutput(
    virtualNode: json['virtualNode'] == null
        ? null
        : VirtualNodeData.fromJson(json['virtualNode'] as Map<String, dynamic>),
  );
}

ListenerTls _$ListenerTlsFromJson(Map<String, dynamic> json) {
  return ListenerTls(
    certificate: json['certificate'] == null
        ? null
        : ListenerTlsCertificate.fromJson(
            json['certificate'] as Map<String, dynamic>),
    mode: _$enumDecodeNullable(_$ListenerTlsModeEnumMap, json['mode']),
  );
}

Map<String, dynamic> _$ListenerTlsToJson(ListenerTls instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificate', instance.certificate?.toJson());
  writeNotNull('mode', _$ListenerTlsModeEnumMap[instance.mode]);
  return val;
}

const _$ListenerTlsModeEnumMap = {
  ListenerTlsMode.disabled: 'DISABLED',
  ListenerTlsMode.permissive: 'PERMISSIVE',
  ListenerTlsMode.strict: 'STRICT',
};

DescribeMeshOutput _$DescribeMeshOutputFromJson(Map<String, dynamic> json) {
  return DescribeMeshOutput(
    mesh: json['mesh'] == null
        ? null
        : MeshData.fromJson(json['mesh'] as Map<String, dynamic>),
  );
}

DeleteRouteOutput _$DeleteRouteOutputFromJson(Map<String, dynamic> json) {
  return DeleteRouteOutput(
    route: json['route'] == null
        ? null
        : RouteData.fromJson(json['route'] as Map<String, dynamic>),
  );
}

UpdateRouteOutput _$UpdateRouteOutputFromJson(Map<String, dynamic> json) {
  return UpdateRouteOutput(
    route: json['route'] == null
        ? null
        : RouteData.fromJson(json['route'] as Map<String, dynamic>),
  );
}

HttpRouteAction _$HttpRouteActionFromJson(Map<String, dynamic> json) {
  return HttpRouteAction(
    weightedTargets: (json['weightedTargets'] as List)
        ?.map((e) => e == null
            ? null
            : WeightedTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HttpRouteActionToJson(HttpRouteAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('weightedTargets',
      instance.weightedTargets?.map((e) => e?.toJson())?.toList());
  return val;
}

VirtualServiceRef _$VirtualServiceRefFromJson(Map<String, dynamic> json) {
  return VirtualServiceRef(
    arn: json['arn'] as String,
    meshName: json['meshName'] as String,
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    virtualServiceName: json['virtualServiceName'] as String,
  );
}

VirtualNodeStatus _$VirtualNodeStatusFromJson(Map<String, dynamic> json) {
  return VirtualNodeStatus(
    status:
        _$enumDecodeNullable(_$VirtualNodeStatusCodeEnumMap, json['status']),
  );
}

const _$VirtualNodeStatusCodeEnumMap = {
  VirtualNodeStatusCode.active: 'ACTIVE',
  VirtualNodeStatusCode.deleted: 'DELETED',
  VirtualNodeStatusCode.inactive: 'INACTIVE',
};

VirtualRouterRef _$VirtualRouterRefFromJson(Map<String, dynamic> json) {
  return VirtualRouterRef(
    arn: json['arn'] as String,
    meshName: json['meshName'] as String,
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    virtualRouterName: json['virtualRouterName'] as String,
  );
}

VirtualServiceData _$VirtualServiceDataFromJson(Map<String, dynamic> json) {
  return VirtualServiceData(
    meshName: json['meshName'] as String,
    metadata: json['metadata'] == null
        ? null
        : ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: json['spec'] == null
        ? null
        : VirtualServiceSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : VirtualServiceStatus.fromJson(json['status'] as Map<String, dynamic>),
    virtualServiceName: json['virtualServiceName'] as String,
  );
}

HttpRouteHeader _$HttpRouteHeaderFromJson(Map<String, dynamic> json) {
  return HttpRouteHeader(
    name: json['name'] as String,
    invert: json['invert'] as bool,
    match: json['match'] == null
        ? null
        : HeaderMatchMethod.fromJson(json['match'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HttpRouteHeaderToJson(HttpRouteHeader instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('invert', instance.invert);
  writeNotNull('match', instance.match?.toJson());
  return val;
}

VirtualNodeRef _$VirtualNodeRefFromJson(Map<String, dynamic> json) {
  return VirtualNodeRef(
    arn: json['arn'] as String,
    meshName: json['meshName'] as String,
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
    virtualNodeName: json['virtualNodeName'] as String,
  );
}

GrpcRouteAction _$GrpcRouteActionFromJson(Map<String, dynamic> json) {
  return GrpcRouteAction(
    weightedTargets: (json['weightedTargets'] as List)
        ?.map((e) => e == null
            ? null
            : WeightedTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GrpcRouteActionToJson(GrpcRouteAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('weightedTargets',
      instance.weightedTargets?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateMeshOutput _$UpdateMeshOutputFromJson(Map<String, dynamic> json) {
  return UpdateMeshOutput(
    mesh: json['mesh'] == null
        ? null
        : MeshData.fromJson(json['mesh'] as Map<String, dynamic>),
  );
}

GrpcRouteMetadataMatchMethod _$GrpcRouteMetadataMatchMethodFromJson(
    Map<String, dynamic> json) {
  return GrpcRouteMetadataMatchMethod(
    exact: json['exact'] as String,
    prefix: json['prefix'] as String,
    range: json['range'] == null
        ? null
        : MatchRange.fromJson(json['range'] as Map<String, dynamic>),
    regex: json['regex'] as String,
    suffix: json['suffix'] as String,
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

AwsCloudMapInstanceAttribute _$AwsCloudMapInstanceAttributeFromJson(
    Map<String, dynamic> json) {
  return AwsCloudMapInstanceAttribute(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$AwsCloudMapInstanceAttributeToJson(
    AwsCloudMapInstanceAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
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

MatchRange _$MatchRangeFromJson(Map<String, dynamic> json) {
  return MatchRange(
    end: json['end'] as int,
    start: json['start'] as int,
  );
}

Map<String, dynamic> _$MatchRangeToJson(MatchRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('end', instance.end);
  writeNotNull('start', instance.start);
  return val;
}

TcpRoute _$TcpRouteFromJson(Map<String, dynamic> json) {
  return TcpRoute(
    action: json['action'] == null
        ? null
        : TcpRouteAction.fromJson(json['action'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TcpRouteToJson(TcpRoute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('action', instance.action?.toJson());
  return val;
}

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

Duration _$DurationFromJson(Map<String, dynamic> json) {
  return Duration(
    unit: _$enumDecodeNullable(_$DurationUnitEnumMap, json['unit']),
    value: json['value'] as int,
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

const _$DurationUnitEnumMap = {
  DurationUnit.ms: 'ms',
  DurationUnit.s: 's',
};

DescribeRouteOutput _$DescribeRouteOutputFromJson(Map<String, dynamic> json) {
  return DescribeRouteOutput(
    route: json['route'] == null
        ? null
        : RouteData.fromJson(json['route'] as Map<String, dynamic>),
  );
}

HttpRouteMatch _$HttpRouteMatchFromJson(Map<String, dynamic> json) {
  return HttpRouteMatch(
    prefix: json['prefix'] as String,
    headers: (json['headers'] as List)
        ?.map((e) => e == null
            ? null
            : HttpRouteHeader.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    method: _$enumDecodeNullable(_$HttpMethodEnumMap, json['method']),
    scheme: _$enumDecodeNullable(_$HttpSchemeEnumMap, json['scheme']),
  );
}

Map<String, dynamic> _$HttpRouteMatchToJson(HttpRouteMatch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prefix', instance.prefix);
  writeNotNull('headers', instance.headers?.map((e) => e?.toJson())?.toList());
  writeNotNull('method', _$HttpMethodEnumMap[instance.method]);
  writeNotNull('scheme', _$HttpSchemeEnumMap[instance.scheme]);
  return val;
}

const _$HttpMethodEnumMap = {
  HttpMethod.connect: 'CONNECT',
  HttpMethod.delete: 'DELETE',
  HttpMethod.get: 'GET',
  HttpMethod.head: 'HEAD',
  HttpMethod.options: 'OPTIONS',
  HttpMethod.patch: 'PATCH',
  HttpMethod.post: 'POST',
  HttpMethod.put: 'PUT',
  HttpMethod.trace: 'TRACE',
};

const _$HttpSchemeEnumMap = {
  HttpScheme.http: 'http',
  HttpScheme.https: 'https',
};

TagRef _$TagRefFromJson(Map<String, dynamic> json) {
  return TagRef(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagRefToJson(TagRef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

MeshRef _$MeshRefFromJson(Map<String, dynamic> json) {
  return MeshRef(
    arn: json['arn'] as String,
    meshName: json['meshName'] as String,
    meshOwner: json['meshOwner'] as String,
    resourceOwner: json['resourceOwner'] as String,
  );
}

MeshData _$MeshDataFromJson(Map<String, dynamic> json) {
  return MeshData(
    meshName: json['meshName'] as String,
    metadata: json['metadata'] == null
        ? null
        : ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: json['spec'] == null
        ? null
        : MeshSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : MeshStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

VirtualRouterStatus _$VirtualRouterStatusFromJson(Map<String, dynamic> json) {
  return VirtualRouterStatus(
    status:
        _$enumDecodeNullable(_$VirtualRouterStatusCodeEnumMap, json['status']),
  );
}

const _$VirtualRouterStatusCodeEnumMap = {
  VirtualRouterStatusCode.active: 'ACTIVE',
  VirtualRouterStatusCode.deleted: 'DELETED',
  VirtualRouterStatusCode.inactive: 'INACTIVE',
};

TcpRouteAction _$TcpRouteActionFromJson(Map<String, dynamic> json) {
  return TcpRouteAction(
    weightedTargets: (json['weightedTargets'] as List)
        ?.map((e) => e == null
            ? null
            : WeightedTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TcpRouteActionToJson(TcpRouteAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('weightedTargets',
      instance.weightedTargets?.map((e) => e?.toJson())?.toList());
  return val;
}

RouteStatus _$RouteStatusFromJson(Map<String, dynamic> json) {
  return RouteStatus(
    status: _$enumDecodeNullable(_$RouteStatusCodeEnumMap, json['status']),
  );
}

const _$RouteStatusCodeEnumMap = {
  RouteStatusCode.active: 'ACTIVE',
  RouteStatusCode.deleted: 'DELETED',
  RouteStatusCode.inactive: 'INACTIVE',
};

Listener _$ListenerFromJson(Map<String, dynamic> json) {
  return Listener(
    portMapping: json['portMapping'] == null
        ? null
        : PortMapping.fromJson(json['portMapping'] as Map<String, dynamic>),
    healthCheck: json['healthCheck'] == null
        ? null
        : HealthCheckPolicy.fromJson(
            json['healthCheck'] as Map<String, dynamic>),
    tls: json['tls'] == null
        ? null
        : ListenerTls.fromJson(json['tls'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListenerToJson(Listener instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('portMapping', instance.portMapping?.toJson());
  writeNotNull('healthCheck', instance.healthCheck?.toJson());
  writeNotNull('tls', instance.tls?.toJson());
  return val;
}

GrpcRoute _$GrpcRouteFromJson(Map<String, dynamic> json) {
  return GrpcRoute(
    action: json['action'] == null
        ? null
        : GrpcRouteAction.fromJson(json['action'] as Map<String, dynamic>),
    match: json['match'] == null
        ? null
        : GrpcRouteMatch.fromJson(json['match'] as Map<String, dynamic>),
    retryPolicy: json['retryPolicy'] == null
        ? null
        : GrpcRetryPolicy.fromJson(json['retryPolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GrpcRouteToJson(GrpcRoute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('action', instance.action?.toJson());
  writeNotNull('match', instance.match?.toJson());
  writeNotNull('retryPolicy', instance.retryPolicy?.toJson());
  return val;
}

ClientPolicyTls _$ClientPolicyTlsFromJson(Map<String, dynamic> json) {
  return ClientPolicyTls(
    validation: json['validation'] == null
        ? null
        : TlsValidationContext.fromJson(
            json['validation'] as Map<String, dynamic>),
    enforce: json['enforce'] as bool,
    ports: (json['ports'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$ClientPolicyTlsToJson(ClientPolicyTls instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('validation', instance.validation?.toJson());
  writeNotNull('enforce', instance.enforce);
  writeNotNull('ports', instance.ports);
  return val;
}

DeleteVirtualServiceOutput _$DeleteVirtualServiceOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteVirtualServiceOutput(
    virtualService: json['virtualService'] == null
        ? null
        : VirtualServiceData.fromJson(
            json['virtualService'] as Map<String, dynamic>),
  );
}

VirtualNodeServiceProvider _$VirtualNodeServiceProviderFromJson(
    Map<String, dynamic> json) {
  return VirtualNodeServiceProvider(
    virtualNodeName: json['virtualNodeName'] as String,
  );
}

Map<String, dynamic> _$VirtualNodeServiceProviderToJson(
    VirtualNodeServiceProvider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('virtualNodeName', instance.virtualNodeName);
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

ListenerTlsFileCertificate _$ListenerTlsFileCertificateFromJson(
    Map<String, dynamic> json) {
  return ListenerTlsFileCertificate(
    certificateChain: json['certificateChain'] as String,
    privateKey: json['privateKey'] as String,
  );
}

Map<String, dynamic> _$ListenerTlsFileCertificateToJson(
    ListenerTlsFileCertificate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificateChain', instance.certificateChain);
  writeNotNull('privateKey', instance.privateKey);
  return val;
}

HttpRetryPolicy _$HttpRetryPolicyFromJson(Map<String, dynamic> json) {
  return HttpRetryPolicy(
    maxRetries: json['maxRetries'] as int,
    perRetryTimeout: json['perRetryTimeout'] == null
        ? null
        : Duration.fromJson(json['perRetryTimeout'] as Map<String, dynamic>),
    httpRetryEvents:
        (json['httpRetryEvents'] as List)?.map((e) => e as String)?.toList(),
    tcpRetryEvents: (json['tcpRetryEvents'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TcpRetryPolicyEventEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$HttpRetryPolicyToJson(HttpRetryPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxRetries', instance.maxRetries);
  writeNotNull('perRetryTimeout', instance.perRetryTimeout?.toJson());
  writeNotNull('httpRetryEvents', instance.httpRetryEvents);
  writeNotNull(
      'tcpRetryEvents',
      instance.tcpRetryEvents
          ?.map((e) => _$TcpRetryPolicyEventEnumMap[e])
          ?.toList());
  return val;
}

TagResourceOutput _$TagResourceOutputFromJson(Map<String, dynamic> json) {
  return TagResourceOutput();
}

TlsValidationContextFileTrust _$TlsValidationContextFileTrustFromJson(
    Map<String, dynamic> json) {
  return TlsValidationContextFileTrust(
    certificateChain: json['certificateChain'] as String,
  );
}

Map<String, dynamic> _$TlsValidationContextFileTrustToJson(
    TlsValidationContextFileTrust instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificateChain', instance.certificateChain);
  return val;
}

GrpcRouteMetadata _$GrpcRouteMetadataFromJson(Map<String, dynamic> json) {
  return GrpcRouteMetadata(
    name: json['name'] as String,
    invert: json['invert'] as bool,
    match: json['match'] == null
        ? null
        : GrpcRouteMetadataMatchMethod.fromJson(
            json['match'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GrpcRouteMetadataToJson(GrpcRouteMetadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('invert', instance.invert);
  writeNotNull('match', instance.match?.toJson());
  return val;
}

HttpRoute _$HttpRouteFromJson(Map<String, dynamic> json) {
  return HttpRoute(
    action: json['action'] == null
        ? null
        : HttpRouteAction.fromJson(json['action'] as Map<String, dynamic>),
    match: json['match'] == null
        ? null
        : HttpRouteMatch.fromJson(json['match'] as Map<String, dynamic>),
    retryPolicy: json['retryPolicy'] == null
        ? null
        : HttpRetryPolicy.fromJson(json['retryPolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HttpRouteToJson(HttpRoute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('action', instance.action?.toJson());
  writeNotNull('match', instance.match?.toJson());
  writeNotNull('retryPolicy', instance.retryPolicy?.toJson());
  return val;
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

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    tags: (json['tags'] as List)
        ?.map((e) =>
            e == null ? null : TagRef.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

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

ListVirtualNodesOutput _$ListVirtualNodesOutputFromJson(
    Map<String, dynamic> json) {
  return ListVirtualNodesOutput(
    virtualNodes: (json['virtualNodes'] as List)
        ?.map((e) => e == null
            ? null
            : VirtualNodeRef.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListenerTlsAcmCertificate _$ListenerTlsAcmCertificateFromJson(
    Map<String, dynamic> json) {
  return ListenerTlsAcmCertificate(
    certificateArn: json['certificateArn'] as String,
  );
}

Map<String, dynamic> _$ListenerTlsAcmCertificateToJson(
    ListenerTlsAcmCertificate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificateArn', instance.certificateArn);
  return val;
}

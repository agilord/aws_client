// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-10-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteMeshOutput _$DeleteMeshOutputFromJson(Map<String, dynamic> json) {
  return DeleteMeshOutput(
    mesh: json['mesh'] == null
        ? null
        : MeshData.fromJson(json['mesh'] as Map<String, dynamic>),
  );
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

CreateRouteOutput _$CreateRouteOutputFromJson(Map<String, dynamic> json) {
  return CreateRouteOutput(
    route: json['route'] == null
        ? null
        : RouteData.fromJson(json['route'] as Map<String, dynamic>),
  );
}

DnsServiceDiscovery _$DnsServiceDiscoveryFromJson(Map<String, dynamic> json) {
  return DnsServiceDiscovery(
    serviceName: json['serviceName'] as String,
  );
}

Map<String, dynamic> _$DnsServiceDiscoveryToJson(DnsServiceDiscovery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('serviceName', instance.serviceName);
  return val;
}

VirtualNodeRef _$VirtualNodeRefFromJson(Map<String, dynamic> json) {
  return VirtualNodeRef(
    arn: json['arn'] as String,
    meshName: json['meshName'] as String,
    virtualNodeName: json['virtualNodeName'] as String,
  );
}

DescribeRouteOutput _$DescribeRouteOutputFromJson(Map<String, dynamic> json) {
  return DescribeRouteOutput(
    route: json['route'] == null
        ? null
        : RouteData.fromJson(json['route'] as Map<String, dynamic>),
  );
}

ServiceDiscovery _$ServiceDiscoveryFromJson(Map<String, dynamic> json) {
  return ServiceDiscovery(
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

  writeNotNull('dns', instance.dns?.toJson());
  return val;
}

MeshStatus _$MeshStatusFromJson(Map<String, dynamic> json) {
  return MeshStatus(
    status: _$enumDecodeNullable(_$MeshStatusCodeEnumMap, json['status']),
  );
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

const _$MeshStatusCodeEnumMap = {
  MeshStatusCode.active: 'ACTIVE',
  MeshStatusCode.deleted: 'DELETED',
  MeshStatusCode.inactive: 'INACTIVE',
};

VirtualNodeData _$VirtualNodeDataFromJson(Map<String, dynamic> json) {
  return VirtualNodeData(
    meshName: json['meshName'] as String,
    virtualNodeName: json['virtualNodeName'] as String,
    metadata: json['metadata'] == null
        ? null
        : ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: json['spec'] == null
        ? null
        : VirtualNodeSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : VirtualNodeStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

VirtualNodeSpec _$VirtualNodeSpecFromJson(Map<String, dynamic> json) {
  return VirtualNodeSpec(
    backends: (json['backends'] as List)?.map((e) => e as String)?.toList(),
    listeners: (json['listeners'] as List)
        ?.map((e) =>
            e == null ? null : Listener.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

  writeNotNull('backends', instance.backends);
  writeNotNull(
      'listeners', instance.listeners?.map((e) => e?.toJson())?.toList());
  writeNotNull('serviceDiscovery', instance.serviceDiscovery?.toJson());
  return val;
}

MeshRef _$MeshRefFromJson(Map<String, dynamic> json) {
  return MeshRef(
    arn: json['arn'] as String,
    meshName: json['meshName'] as String,
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

CreateVirtualRouterOutput _$CreateVirtualRouterOutputFromJson(
    Map<String, dynamic> json) {
  return CreateVirtualRouterOutput(
    virtualRouter: json['virtualRouter'] == null
        ? null
        : VirtualRouterData.fromJson(
            json['virtualRouter'] as Map<String, dynamic>),
  );
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

ListMeshesOutput _$ListMeshesOutputFromJson(Map<String, dynamic> json) {
  return ListMeshesOutput(
    meshes: (json['meshes'] as List)
        ?.map((e) =>
            e == null ? null : MeshRef.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
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

CreateMeshOutput _$CreateMeshOutputFromJson(Map<String, dynamic> json) {
  return CreateMeshOutput(
    mesh: json['mesh'] == null
        ? null
        : MeshData.fromJson(json['mesh'] as Map<String, dynamic>),
  );
}

RouteData _$RouteDataFromJson(Map<String, dynamic> json) {
  return RouteData(
    meshName: json['meshName'] as String,
    routeName: json['routeName'] as String,
    virtualRouterName: json['virtualRouterName'] as String,
    metadata: json['metadata'] == null
        ? null
        : ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: json['spec'] == null
        ? null
        : RouteSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : RouteStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

HttpRoute _$HttpRouteFromJson(Map<String, dynamic> json) {
  return HttpRoute(
    action: json['action'] == null
        ? null
        : HttpRouteAction.fromJson(json['action'] as Map<String, dynamic>),
    match: json['match'] == null
        ? null
        : HttpRouteMatch.fromJson(json['match'] as Map<String, dynamic>),
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
  return val;
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

RouteSpec _$RouteSpecFromJson(Map<String, dynamic> json) {
  return RouteSpec(
    httpRoute: json['httpRoute'] == null
        ? null
        : HttpRoute.fromJson(json['httpRoute'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RouteSpecToJson(RouteSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('httpRoute', instance.httpRoute?.toJson());
  return val;
}

VirtualRouterRef _$VirtualRouterRefFromJson(Map<String, dynamic> json) {
  return VirtualRouterRef(
    arn: json['arn'] as String,
    meshName: json['meshName'] as String,
    virtualRouterName: json['virtualRouterName'] as String,
  );
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

DeleteVirtualNodeOutput _$DeleteVirtualNodeOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteVirtualNodeOutput(
    virtualNode: json['virtualNode'] == null
        ? null
        : VirtualNodeData.fromJson(json['virtualNode'] as Map<String, dynamic>),
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

CreateVirtualNodeOutput _$CreateVirtualNodeOutputFromJson(
    Map<String, dynamic> json) {
  return CreateVirtualNodeOutput(
    virtualNode: json['virtualNode'] == null
        ? null
        : VirtualNodeData.fromJson(json['virtualNode'] as Map<String, dynamic>),
  );
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

ResourceMetadata _$ResourceMetadataFromJson(Map<String, dynamic> json) {
  return ResourceMetadata(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    uid: json['uid'] as String,
    version: json['version'] as int,
  );
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

const _$PortProtocolEnumMap = {
  PortProtocol.http: 'http',
  PortProtocol.tcp: 'tcp',
};

VirtualRouterSpec _$VirtualRouterSpecFromJson(Map<String, dynamic> json) {
  return VirtualRouterSpec(
    serviceNames:
        (json['serviceNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$VirtualRouterSpecToJson(VirtualRouterSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('serviceNames', instance.serviceNames);
  return val;
}

DescribeMeshOutput _$DescribeMeshOutputFromJson(Map<String, dynamic> json) {
  return DescribeMeshOutput(
    mesh: json['mesh'] == null
        ? null
        : MeshData.fromJson(json['mesh'] as Map<String, dynamic>),
  );
}

VirtualRouterData _$VirtualRouterDataFromJson(Map<String, dynamic> json) {
  return VirtualRouterData(
    meshName: json['meshName'] as String,
    virtualRouterName: json['virtualRouterName'] as String,
    metadata: json['metadata'] == null
        ? null
        : ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    spec: json['spec'] == null
        ? null
        : VirtualRouterSpec.fromJson(json['spec'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : VirtualRouterStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Listener _$ListenerFromJson(Map<String, dynamic> json) {
  return Listener(
    healthCheck: json['healthCheck'] == null
        ? null
        : HealthCheckPolicy.fromJson(
            json['healthCheck'] as Map<String, dynamic>),
    portMapping: json['portMapping'] == null
        ? null
        : PortMapping.fromJson(json['portMapping'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListenerToJson(Listener instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('healthCheck', instance.healthCheck?.toJson());
  writeNotNull('portMapping', instance.portMapping?.toJson());
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

MeshData _$MeshDataFromJson(Map<String, dynamic> json) {
  return MeshData(
    meshName: json['meshName'] as String,
    metadata: json['metadata'] == null
        ? null
        : ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : MeshStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

HttpRouteMatch _$HttpRouteMatchFromJson(Map<String, dynamic> json) {
  return HttpRouteMatch(
    prefix: json['prefix'] as String,
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
  return val;
}

DeleteRouteOutput _$DeleteRouteOutputFromJson(Map<String, dynamic> json) {
  return DeleteRouteOutput(
    route: json['route'] == null
        ? null
        : RouteData.fromJson(json['route'] as Map<String, dynamic>),
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

RouteRef _$RouteRefFromJson(Map<String, dynamic> json) {
  return RouteRef(
    arn: json['arn'] as String,
    meshName: json['meshName'] as String,
    routeName: json['routeName'] as String,
    virtualRouterName: json['virtualRouterName'] as String,
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

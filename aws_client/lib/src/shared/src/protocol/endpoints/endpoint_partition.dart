class EndpointPartition {
  final String id;
  final String regionRegex;
  final Set<String> regions;
  final EndpointPartitionOutputs outputs;

  const EndpointPartition({
    required this.id,
    required this.regionRegex,
    required this.regions,
    required this.outputs,
  });
}

class EndpointPartitionOutputs {
  final String name;
  final String dnsSuffix;
  final String dualStackDnsSuffix;
  final bool supportsFips;
  final bool supportsDualStack;
  final String implicitGlobalRegion;

  const EndpointPartitionOutputs({
    required this.name,
    required this.dnsSuffix,
    required this.dualStackDnsSuffix,
    required this.supportsFips,
    required this.supportsDualStack,
    required this.implicitGlobalRegion,
  });
}

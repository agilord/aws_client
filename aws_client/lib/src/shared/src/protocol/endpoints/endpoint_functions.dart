import 'dart:convert';

import 'endpoint_partition.dart';
import 'partitions.dart';

class AwsArn {
  final String partition;
  final String service;
  final String region;
  final String accountId;
  final List<String> resourceId;

  const AwsArn({
    required this.partition,
    required this.service,
    required this.region,
    required this.accountId,
    required this.resourceId,
  });
}

class AwsUrl {
  final String scheme;
  final String authority;
  final String path;
  final String normalizedPath;
  final bool isIp;

  const AwsUrl({
    required this.scheme,
    required this.authority,
    required this.path,
    required this.normalizedPath,
    required this.isIp,
  });
}

T? elementOrNull<T>(List<T> list, int index) =>
    (index >= 0 && index < list.length) ? list[index] : null;

Object? getAttr(Object? value, String path) {
  var current = value;
  for (final segment in _parsePathSegments(path)) {
    if (segment is int) {
      if (current is List && segment >= 0 && segment < current.length) {
        current = current[segment];
      } else {
        return null;
      }
    } else {
      if (current is Map) {
        current = current[segment];
      } else {
        return null;
      }
    }
  }
  return current;
}

List<Object> _parsePathSegments(String path) {
  final segments = <Object>[];
  for (final part in path.split('.')) {
    final bracket = part.indexOf('[');
    if (bracket < 0) {
      if (part.isNotEmpty) segments.add(part);
    } else {
      final name = part.substring(0, bracket);
      if (name.isNotEmpty) segments.add(name);
      final index = part.substring(bracket + 1, part.indexOf(']'));
      segments.add(int.parse(index));
    }
  }
  return segments;
}

String? substring(Object? input, int start, int stop, bool reverse) {
  if (input is! String) return null;
  if (input.codeUnits.any((c) => c > 127)) return null;
  if (start >= stop || stop > input.length) return null;
  if (!reverse) {
    return input.substring(start, stop);
  }
  return input.substring(input.length - stop, input.length - start);
}

final _hostLabel = RegExp(r'^[a-zA-Z\d][a-zA-Z\d-]{0,62}$');

bool isValidHostLabel(Object? input, bool allowSubdomains) {
  if (input is! String) return false;
  if (!allowSubdomains) return _hostLabel.hasMatch(input);
  return input.split('.').every(_hostLabel.hasMatch);
}

final _uriUnreserved = RegExp(r'[A-Za-z0-9\-_.~]');

String uriEncode(Object? input) {
  final value = '$input';
  final buffer = StringBuffer();
  for (final unit in value.codeUnits) {
    final char = String.fromCharCode(unit);
    if (_uriUnreserved.hasMatch(char)) {
      buffer.write(char);
    } else {
      for (final byte in utf8.encode(char)) {
        buffer
            .write('%${byte.toRadixString(16).toUpperCase().padLeft(2, '0')}');
      }
    }
  }
  return buffer.toString();
}

AwsUrl? parseUrl(Object? input) {
  if (input is! String) return null;
  final uri = Uri.tryParse(input);
  if (uri == null) return null;
  if (uri.scheme != 'http' && uri.scheme != 'https') return null;
  if (uri.hasQuery) return null;
  if (uri.host.isEmpty) return null;

  final authority = uri.hasPort ? '${uri.host}:${uri.port}' : uri.host;
  final path = uri.path;
  final normalizedPath = path.isEmpty
      ? '/'
      : '${path.startsWith('/') ? '' : '/'}$path${path.endsWith('/') ? '' : '/'}';

  return AwsUrl(
    scheme: uri.scheme,
    authority: authority,
    path: path,
    normalizedPath: normalizedPath,
    isIp: isIpAddress(uri.host),
  );
}

final _ipv4 = RegExp(r'^(\d{1,3}\.){3}\d{1,3}$');

bool isIpAddress(String host) {
  if (_ipv4.hasMatch(host)) return true;
  // Bracketed IPv6 literal, e.g. [::1].
  return host.startsWith('[') && host.endsWith(']');
}

AwsArn? parseArn(Object? input) {
  if (input is! String) return null;
  final segments = input.split(':');
  if (segments.length < 6) return null;
  if (segments[0] != 'arn') return null;
  final partition = segments[1];
  final service = segments[2];
  final region = segments[3];
  final accountId = segments[4];
  if (partition.isEmpty || service.isEmpty) return null;
  final resource = segments.sublist(5).join(':');
  if (resource.isEmpty) return null;

  return AwsArn(
    partition: partition,
    service: service,
    region: region,
    accountId: accountId,
    resourceId: resource.split(RegExp(r'[:/]')),
  );
}

bool isVirtualHostableS3Bucket(Object? input, bool allowSubdomains) {
  if (input is! String) return false;
  if (input.length < 3 || input.length > 63) return false;
  if (input != input.toLowerCase()) return false;
  if (isIpAddress(input)) return false;
  if (!allowSubdomains) {
    return _isVirtualHostableLabel(input);
  }
  return input.split('.').every(_isVirtualHostableLabel);
}

final _s3Label = RegExp(r'^[a-z\d][a-z\d-]{0,61}[a-z\d]$|^[a-z\d]$');

bool _isVirtualHostableLabel(String label) {
  if (label.isEmpty || label.length > 63) return false;
  return _s3Label.hasMatch(label);
}

final _regionRegexes = {
  for (final partition in partitions)
    partition.id: RegExp(partition.regionRegex)
};

EndpointPartitionOutputs awsPartition(Object? input) {
  final region = '$input';
  for (final partition in partitions) {
    if (partition.regions.contains(region)) {
      return partition.outputs;
    }
  }
  for (final partition in partitions) {
    if (_regionRegexes[partition.id]!.hasMatch(region)) {
      return partition.outputs;
    }
  }
  return partitions.firstWhere((p) => p.id == 'aws').outputs;
}

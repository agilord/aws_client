import '../scoping_extensions.dart';
import 'descriptor.dart';

class Shape {
  final String? type;
  final Map<String, Member>? members;
  final Descriptor? member;
  final Descriptor? key;
  final Descriptor? value;
  final String? locationName;
  final String? timestampFormat;
  final bool flattened;

  Shape(
    this.type,
    this.key,
    this.value,
    this.member,
    this.flattened,
    this.members,
    this.locationName,
    this.timestampFormat,
  );

  factory Shape.fromJson(Map<String, dynamic> json) => Shape(
        json['type'] as String?,
        (json['key'] as Map?)
            ?.let((e) => Descriptor.fromJson(e.cast<String, dynamic>())),
        (json['value'] as Map?)
            ?.let((e) => Descriptor.fromJson(e.cast<String, dynamic>())),
        (json['member'] as Map?)
            ?.let((e) => Descriptor.fromJson(e.cast<String, dynamic>())),
        json['flattened'] as bool? ?? false,
        (json['members'] as Map?)?.cast<String, Object>().map(
              (k, e) => MapEntry(
                  k, Member.fromJson((e as Map).cast<String, dynamic>())),
            ),
        json['locationName'] as String?,
        json['timestampFormat'] as String?,
      );

  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      value?.let((e) => val[key] = value);
    }

    writeNotNull('type', type);
    writeNotNull('members', members);
    writeNotNull('member', member);
    writeNotNull('key', key);
    writeNotNull('value', value);
    writeNotNull('locationName', locationName);
    writeNotNull('timestampFormat', timestampFormat);
    writeNotNull('flattened', flattened);
    return val;
  }
}

class Member {
  final String? shape;
  final bool flattened;

  Member(
    this.shape,
    this.flattened,
  );

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        json['shape'] as String?,
        json['flattened'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('shape', shape);
    writeNotNull('flattened', flattened);
    return val;
  }
}

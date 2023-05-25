class Descriptor {
  final String? shape;
  final String? locationName;

  Descriptor(
    this.shape,
    this.locationName,
  );

  factory Descriptor.fromJson(Map<String, dynamic> json) => Descriptor(
        json['shape'] as String?,
        json['locationName'] as String?,
      );

  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('shape', shape);
    writeNotNull('locationName', locationName);
    return val;
  }
}

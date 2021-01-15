// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "TimeArg": {"shape": "TimestampType", "flattened": false},
      "TimeCustom": {"shape": "TimestampType", "flattened": false},
      "TimeFormat": {"shape": "TimestampFormatType", "flattened": false},
      "StructMember": {"shape": "TimeContainer", "flattened": false}
    },
    "flattened": false
  },
  "TimeContainer": {
    "type": "structure",
    "members": {
      "foo": {"shape": "TimestampType", "flattened": false},
      "bar": {"shape": "TimestampFormatType", "flattened": false}
    },
    "flattened": false
  },
  "TimestampFormatType": {
    "type": "timestamp",
    "timestampFormat": "unixTimestamp",
    "flattened": false
  },
  "TimestampType": {"type": "timestamp", "flattened": false}
};

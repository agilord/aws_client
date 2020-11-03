// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "InputShape": {
    "type": "structure",
    "members": {
      "TimeArg": {"shape": "TimestampType", "flattened": false},
      "TimeCustom": {"shape": "TimestampType", "flattened": false},
      "TimeFormat": {"shape": "TimestampFormatType", "flattened": false}
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

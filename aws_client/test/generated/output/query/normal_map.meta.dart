// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "Map": {"shape": "StringMap", "flattened": false}
    },
    "flattened": false
  },
  "StringMap": {
    "type": "map",
    "key": {"shape": "StringType"},
    "value": {"shape": "StructType"},
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false},
  "StructType": {
    "type": "structure",
    "members": {
      "foo": {"shape": "StringType", "flattened": false}
    },
    "flattened": false
  }
};

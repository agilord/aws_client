// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "Map": {"shape": "StringMap", "flattened": true}
    },
    "flattened": false
  },
  "StringMap": {
    "type": "map",
    "key": {"shape": "StringType"},
    "value": {"shape": "StringType"},
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false}
};

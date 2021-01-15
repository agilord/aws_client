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
    "key": {"shape": "StringType", "locationName": "Name"},
    "value": {"shape": "StringType", "locationName": "Value"},
    "locationName": "Attribute",
    "flattened": true
  },
  "StringType": {"type": "string", "flattened": false}
};

// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "InputShape": {
    "type": "structure",
    "members": {
      "MapArg": {"shape": "StringMap", "flattened": false}
    },
    "flattened": false
  },
  "StringMap": {
    "type": "map",
    "key": {"shape": "StringType", "locationName": "TheKey"},
    "value": {"shape": "StringType", "locationName": "TheValue"},
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false}
};

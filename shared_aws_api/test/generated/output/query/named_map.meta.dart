// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "Map": {"shape": "MapType", "flattened": false}
    },
    "flattened": false
  },
  "MapType": {
    "type": "map",
    "key": {"shape": "StringType", "locationName": "foo"},
    "value": {"shape": "StringType", "locationName": "bar"},
    "flattened": true
  },
  "StringType": {"type": "string", "flattened": false}
};

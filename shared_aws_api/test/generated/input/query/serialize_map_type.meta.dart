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
    "key": {"shape": "StringType"},
    "value": {"shape": "StringType"},
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false}
};

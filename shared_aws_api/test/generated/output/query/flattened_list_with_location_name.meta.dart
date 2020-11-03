// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "List": {"shape": "ListType", "flattened": false}
    },
    "flattened": false
  },
  "ListType": {
    "type": "list",
    "member": {"shape": "StringShape", "locationName": "NamedList"},
    "flattened": true
  },
  "StringShape": {"type": "string", "flattened": false}
};

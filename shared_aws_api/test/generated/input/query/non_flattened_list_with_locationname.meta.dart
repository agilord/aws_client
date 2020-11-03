// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "InputShape": {
    "type": "structure",
    "members": {
      "ListArg": {"shape": "ListType", "flattened": false}
    },
    "flattened": false
  },
  "ListType": {
    "type": "list",
    "member": {"shape": "StringType", "locationName": "item"},
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false}
};

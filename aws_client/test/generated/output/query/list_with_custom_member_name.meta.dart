// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "ListMember": {"shape": "ListShape", "flattened": false}
    },
    "flattened": false
  },
  "ListShape": {
    "type": "list",
    "member": {"shape": "StringType", "locationName": "item"},
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false}
};

// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "ListMember": {"shape": "ListType", "flattened": false}
    },
    "flattened": false
  },
  "ListType": {
    "type": "list",
    "member": {"shape": "StringType"},
    "flattened": true
  },
  "StringType": {"type": "string", "flattened": false}
};

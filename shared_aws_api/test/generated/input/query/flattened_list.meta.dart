// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "InputShape": {
    "type": "structure",
    "members": {
      "ScalarArg": {"shape": "StringType", "flattened": false},
      "ListArg": {"shape": "ListType", "flattened": false},
      "NamedListArg": {"shape": "NamedListType", "flattened": false}
    },
    "flattened": false
  },
  "ListType": {
    "type": "list",
    "member": {"shape": "StringType"},
    "flattened": true
  },
  "NamedListType": {
    "type": "list",
    "member": {"shape": "StringType", "locationName": "Foo"},
    "flattened": true
  },
  "StringType": {"type": "string", "flattened": false}
};

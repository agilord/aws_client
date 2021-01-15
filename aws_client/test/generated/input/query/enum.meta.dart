// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "InputShape": {
    "type": "structure",
    "members": {
      "FooEnum": {"shape": "EnumType", "flattened": false},
      "ListEnums": {"shape": "EnumList", "flattened": false}
    },
    "flattened": false
  },
  "EnumType": {"type": "string", "flattened": false},
  "EnumList": {
    "type": "list",
    "member": {"shape": "EnumType"},
    "flattened": false
  }
};

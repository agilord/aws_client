// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "FooEnum": {"shape": "EC2EnumType", "flattened": false},
      "ListEnums": {"shape": "EC2EnumList", "flattened": false}
    },
    "flattened": false
  },
  "EC2EnumType": {"type": "string", "flattened": false},
  "EC2EnumList": {
    "type": "list",
    "member": {"shape": "EC2EnumType"},
    "flattened": false
  }
};

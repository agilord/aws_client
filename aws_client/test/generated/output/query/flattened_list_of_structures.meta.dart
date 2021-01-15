// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "List": {"shape": "ListOfStructs", "flattened": false}
    },
    "flattened": false
  },
  "ListOfStructs": {
    "type": "list",
    "member": {"shape": "StructureShape"},
    "flattened": true
  },
  "StructureShape": {
    "type": "structure",
    "members": {
      "Foo": {"shape": "StringShape", "flattened": false},
      "Bar": {"shape": "StringShape", "flattened": false},
      "Baz": {"shape": "StringShape", "flattened": false}
    },
    "flattened": false
  },
  "StringShape": {"type": "string", "flattened": false}
};

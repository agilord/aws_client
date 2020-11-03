// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "InputShape": {
    "type": "structure",
    "members": {
      "Foo": {"shape": "StringType", "flattened": false},
      "Bar": {"shape": "StringType", "flattened": false},
      "Baz": {"shape": "BooleanType", "flattened": false}
    },
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false},
  "BooleanType": {"type": "boolean", "flattened": false}
};

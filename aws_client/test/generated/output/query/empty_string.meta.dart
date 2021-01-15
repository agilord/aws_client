// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "Foo": {"shape": "StringType", "flattened": false}
    },
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false}
};

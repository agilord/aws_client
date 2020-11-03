// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "Str": {"shape": "StringType", "flattened": false},
      "Num": {"shape": "IntegerType", "flattened": false}
    },
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false},
  "IntegerType": {"type": "integer", "flattened": false}
};

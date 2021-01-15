// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "InputShape": {
    "type": "structure",
    "members": {
      "StructArg": {"shape": "StructType", "flattened": false}
    },
    "flattened": false
  },
  "StructType": {
    "type": "structure",
    "members": {
      "ScalarArg": {"shape": "StringType", "flattened": false}
    },
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false}
};

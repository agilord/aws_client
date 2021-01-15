// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "StaticInputShape": {
    "type": "structure",
    "members": {
      "Name": {"shape": "StringType", "flattened": false}
    },
    "flattened": false
  },
  "MemberRefInputShape": {
    "type": "structure",
    "members": {
      "Name": {"shape": "StringType", "flattened": false}
    },
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false}
};

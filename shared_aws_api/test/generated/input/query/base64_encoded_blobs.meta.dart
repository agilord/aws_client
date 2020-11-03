// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "InputShape": {
    "type": "structure",
    "members": {
      "BlobArg": {"shape": "BlobType", "flattened": false}
    },
    "flattened": false
  },
  "BlobType": {"type": "blob", "flattened": false}
};

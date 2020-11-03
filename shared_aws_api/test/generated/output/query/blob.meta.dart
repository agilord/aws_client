// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "Blob": {"shape": "BlobType", "flattened": false}
    },
    "flattened": false
  },
  "BlobType": {"type": "blob", "flattened": false}
};

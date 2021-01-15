// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "InputShape": {
    "type": "structure",
    "members": {
      "BlobArgs": {"shape": "BlobsType", "flattened": false}
    },
    "flattened": false
  },
  "BlobsType": {
    "type": "list",
    "member": {"shape": "BlobType"},
    "flattened": true
  },
  "BlobType": {"type": "blob", "flattened": false}
};

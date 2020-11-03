// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "InputShape": {
    "type": "structure",
    "members": {
      "RecursiveStruct": {"shape": "RecursiveStructType", "flattened": false}
    },
    "flattened": false
  },
  "RecursiveStructType": {
    "type": "structure",
    "members": {
      "NoRecurse": {"shape": "StringType", "flattened": false},
      "RecursiveStruct": {"shape": "RecursiveStructType", "flattened": false},
      "RecursiveList": {"shape": "RecursiveListType", "flattened": false},
      "RecursiveMap": {"shape": "RecursiveMapType", "flattened": false}
    },
    "flattened": false
  },
  "RecursiveListType": {
    "type": "list",
    "member": {"shape": "RecursiveStructType"},
    "flattened": false
  },
  "RecursiveMapType": {
    "type": "map",
    "key": {"shape": "StringType"},
    "value": {"shape": "RecursiveStructType"},
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false}
};

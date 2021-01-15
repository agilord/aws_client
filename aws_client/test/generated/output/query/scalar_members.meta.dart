// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "OutputShape": {
    "type": "structure",
    "members": {
      "Str": {"shape": "StringType", "flattened": false},
      "Num": {"shape": "IntegerType", "flattened": false},
      "FalseBool": {"shape": "BooleanType", "flattened": false},
      "TrueBool": {"shape": "BooleanType", "flattened": false},
      "Float": {"shape": "FloatType", "flattened": false},
      "Double": {"shape": "DoubleType", "flattened": false},
      "Long": {"shape": "LongType", "flattened": false},
      "Char": {"shape": "CharType", "flattened": false},
      "Timestamp": {"shape": "TimestampType", "flattened": false}
    },
    "flattened": false
  },
  "StringType": {"type": "string", "flattened": false},
  "IntegerType": {"type": "integer", "flattened": false},
  "BooleanType": {"type": "boolean", "flattened": false},
  "FloatType": {"type": "float", "flattened": false},
  "DoubleType": {"type": "double", "flattened": false},
  "LongType": {"type": "long", "flattened": false},
  "CharType": {"type": "character", "flattened": false},
  "TimestampType": {"type": "timestamp", "flattened": false}
};

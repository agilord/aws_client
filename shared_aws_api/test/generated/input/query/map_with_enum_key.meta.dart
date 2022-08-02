// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "CreateQueueRequest": {
    "type": "structure",
    "members": {
      "QueueName": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "QueueAttributeMap", "flattened": false}
    },
    "flattened": false
  },
  "QueueAttributeMap": {
    "type": "map",
    "key": {"shape": "QueueAttributeName", "locationName": "Name"},
    "value": {"shape": "String", "locationName": "Value"},
    "locationName": "Attribute",
    "flattened": true
  },
  "QueueAttributeName": {"type": "string", "flattened": false},
  "String": {"type": "string", "flattened": false}
};

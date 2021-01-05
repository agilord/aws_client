// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "AWSAccountIdList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "AWSAccountId"},
    "flattened": true
  },
  "ActionNameList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "ActionName"},
    "flattened": true
  },
  "AddPermissionRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "Label": {"shape": "String", "flattened": false},
      "AWSAccountIds": {"shape": "AWSAccountIdList", "flattened": false},
      "Actions": {"shape": "ActionNameList", "flattened": false}
    },
    "flattened": false
  },
  "AttributeNameList": {
    "type": "list",
    "member": {"shape": "QueueAttributeName", "locationName": "AttributeName"},
    "flattened": true
  },
  "BatchResultErrorEntry": {
    "type": "structure",
    "members": {
      "Id": {"shape": "String", "flattened": false},
      "SenderFault": {"shape": "Boolean", "flattened": false},
      "Code": {"shape": "String", "flattened": false},
      "Message": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "BatchResultErrorEntryList": {
    "type": "list",
    "member": {
      "shape": "BatchResultErrorEntry",
      "locationName": "BatchResultErrorEntry"
    },
    "flattened": true
  },
  "Binary": {"type": "blob", "flattened": false},
  "BinaryList": {
    "type": "list",
    "member": {"shape": "Binary", "locationName": "BinaryListValue"},
    "flattened": false
  },
  "Boolean": {"type": "boolean", "flattened": false},
  "BoxedInteger": {"type": "integer", "flattened": false},
  "ChangeMessageVisibilityBatchRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "Entries": {
        "shape": "ChangeMessageVisibilityBatchRequestEntryList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ChangeMessageVisibilityBatchRequestEntry": {
    "type": "structure",
    "members": {
      "Id": {"shape": "String", "flattened": false},
      "ReceiptHandle": {"shape": "String", "flattened": false},
      "VisibilityTimeout": {"shape": "Integer", "flattened": false}
    },
    "flattened": false
  },
  "ChangeMessageVisibilityBatchRequestEntryList": {
    "type": "list",
    "member": {
      "shape": "ChangeMessageVisibilityBatchRequestEntry",
      "locationName": "ChangeMessageVisibilityBatchRequestEntry"
    },
    "flattened": true
  },
  "ChangeMessageVisibilityBatchResult": {
    "type": "structure",
    "members": {
      "Successful": {
        "shape": "ChangeMessageVisibilityBatchResultEntryList",
        "flattened": false
      },
      "Failed": {"shape": "BatchResultErrorEntryList", "flattened": false}
    },
    "flattened": false
  },
  "ChangeMessageVisibilityBatchResultEntry": {
    "type": "structure",
    "members": {
      "Id": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ChangeMessageVisibilityBatchResultEntryList": {
    "type": "list",
    "member": {
      "shape": "ChangeMessageVisibilityBatchResultEntry",
      "locationName": "ChangeMessageVisibilityBatchResultEntry"
    },
    "flattened": true
  },
  "ChangeMessageVisibilityRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "ReceiptHandle": {"shape": "String", "flattened": false},
      "VisibilityTimeout": {"shape": "Integer", "flattened": false}
    },
    "flattened": false
  },
  "CreateQueueRequest": {
    "type": "structure",
    "members": {
      "QueueName": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "QueueAttributeMap", "flattened": false},
      "tags": {"shape": "TagMap", "flattened": false}
    },
    "flattened": false
  },
  "CreateQueueResult": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteMessageBatchRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "Entries": {
        "shape": "DeleteMessageBatchRequestEntryList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteMessageBatchRequestEntry": {
    "type": "structure",
    "members": {
      "Id": {"shape": "String", "flattened": false},
      "ReceiptHandle": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteMessageBatchRequestEntryList": {
    "type": "list",
    "member": {
      "shape": "DeleteMessageBatchRequestEntry",
      "locationName": "DeleteMessageBatchRequestEntry"
    },
    "flattened": true
  },
  "DeleteMessageBatchResult": {
    "type": "structure",
    "members": {
      "Successful": {
        "shape": "DeleteMessageBatchResultEntryList",
        "flattened": false
      },
      "Failed": {"shape": "BatchResultErrorEntryList", "flattened": false}
    },
    "flattened": false
  },
  "DeleteMessageBatchResultEntry": {
    "type": "structure",
    "members": {
      "Id": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteMessageBatchResultEntryList": {
    "type": "list",
    "member": {
      "shape": "DeleteMessageBatchResultEntry",
      "locationName": "DeleteMessageBatchResultEntry"
    },
    "flattened": true
  },
  "DeleteMessageRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "ReceiptHandle": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteQueueRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "GetQueueAttributesRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "AttributeNames": {"shape": "AttributeNameList", "flattened": false}
    },
    "flattened": false
  },
  "GetQueueAttributesResult": {
    "type": "structure",
    "members": {
      "Attributes": {"shape": "QueueAttributeMap", "flattened": false}
    },
    "flattened": false
  },
  "GetQueueUrlRequest": {
    "type": "structure",
    "members": {
      "QueueName": {"shape": "String", "flattened": false},
      "QueueOwnerAWSAccountId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "GetQueueUrlResult": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "Integer": {"type": "integer", "flattened": false},
  "ListDeadLetterSourceQueuesRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "NextToken": {"shape": "Token", "flattened": false},
      "MaxResults": {"shape": "BoxedInteger", "flattened": false}
    },
    "flattened": false
  },
  "ListDeadLetterSourceQueuesResult": {
    "type": "structure",
    "members": {
      "queueUrls": {"shape": "QueueUrlList", "flattened": false},
      "NextToken": {"shape": "Token", "flattened": false}
    },
    "flattened": false
  },
  "ListQueueTagsRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ListQueueTagsResult": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "TagMap", "flattened": false}
    },
    "flattened": false
  },
  "ListQueuesRequest": {
    "type": "structure",
    "members": {
      "QueueNamePrefix": {"shape": "String", "flattened": false},
      "NextToken": {"shape": "Token", "flattened": false},
      "MaxResults": {"shape": "BoxedInteger", "flattened": false}
    },
    "flattened": false
  },
  "ListQueuesResult": {
    "type": "structure",
    "members": {
      "QueueUrls": {"shape": "QueueUrlList", "flattened": false},
      "NextToken": {"shape": "Token", "flattened": false}
    },
    "flattened": false
  },
  "Message": {
    "type": "structure",
    "members": {
      "MessageId": {"shape": "String", "flattened": false},
      "ReceiptHandle": {"shape": "String", "flattened": false},
      "MD5OfBody": {"shape": "String", "flattened": false},
      "Body": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "MessageSystemAttributeMap", "flattened": false},
      "MD5OfMessageAttributes": {"shape": "String", "flattened": false},
      "MessageAttributes": {
        "shape": "MessageBodyAttributeMap",
        "flattened": false
      }
    },
    "flattened": false
  },
  "MessageAttributeName": {"type": "string", "flattened": false},
  "MessageAttributeNameList": {
    "type": "list",
    "member": {
      "shape": "MessageAttributeName",
      "locationName": "MessageAttributeName"
    },
    "flattened": true
  },
  "MessageAttributeValue": {
    "type": "structure",
    "members": {
      "StringValue": {"shape": "String", "flattened": false},
      "BinaryValue": {"shape": "Binary", "flattened": false},
      "StringListValues": {"shape": "StringList", "flattened": true},
      "BinaryListValues": {"shape": "BinaryList", "flattened": true},
      "DataType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "MessageBodyAttributeMap": {
    "type": "map",
    "key": {"shape": "String", "locationName": "Name"},
    "value": {"shape": "MessageAttributeValue", "locationName": "Value"},
    "flattened": true
  },
  "MessageBodySystemAttributeMap": {
    "type": "map",
    "key": {
      "shape": "MessageSystemAttributeNameForSends",
      "locationName": "Name"
    },
    "value": {"shape": "MessageSystemAttributeValue", "locationName": "Value"},
    "flattened": true
  },
  "MessageList": {
    "type": "list",
    "member": {"shape": "Message", "locationName": "Message"},
    "flattened": true
  },
  "MessageSystemAttributeMap": {
    "type": "map",
    "key": {"shape": "MessageSystemAttributeName", "locationName": "Name"},
    "value": {"shape": "String", "locationName": "Value"},
    "locationName": "Attribute",
    "flattened": true
  },
  "MessageSystemAttributeName": {"type": "string", "flattened": false},
  "MessageSystemAttributeNameForSends": {"type": "string", "flattened": false},
  "MessageSystemAttributeValue": {
    "type": "structure",
    "members": {
      "StringValue": {"shape": "String", "flattened": false},
      "BinaryValue": {"shape": "Binary", "flattened": false},
      "StringListValues": {"shape": "StringList", "flattened": true},
      "BinaryListValues": {"shape": "BinaryList", "flattened": true},
      "DataType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PurgeQueueRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false}
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
  "QueueUrlList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "QueueUrl"},
    "flattened": true
  },
  "ReceiveMessageRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "AttributeNames": {"shape": "AttributeNameList", "flattened": false},
      "MessageAttributeNames": {
        "shape": "MessageAttributeNameList",
        "flattened": false
      },
      "MaxNumberOfMessages": {"shape": "Integer", "flattened": false},
      "VisibilityTimeout": {"shape": "Integer", "flattened": false},
      "WaitTimeSeconds": {"shape": "Integer", "flattened": false},
      "ReceiveRequestAttemptId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ReceiveMessageResult": {
    "type": "structure",
    "members": {
      "Messages": {"shape": "MessageList", "flattened": false}
    },
    "flattened": false
  },
  "RemovePermissionRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "Label": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SendMessageBatchRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "Entries": {
        "shape": "SendMessageBatchRequestEntryList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SendMessageBatchRequestEntry": {
    "type": "structure",
    "members": {
      "Id": {"shape": "String", "flattened": false},
      "MessageBody": {"shape": "String", "flattened": false},
      "DelaySeconds": {"shape": "Integer", "flattened": false},
      "MessageAttributes": {
        "shape": "MessageBodyAttributeMap",
        "flattened": false
      },
      "MessageSystemAttributes": {
        "shape": "MessageBodySystemAttributeMap",
        "flattened": false
      },
      "MessageDeduplicationId": {"shape": "String", "flattened": false},
      "MessageGroupId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SendMessageBatchRequestEntryList": {
    "type": "list",
    "member": {
      "shape": "SendMessageBatchRequestEntry",
      "locationName": "SendMessageBatchRequestEntry"
    },
    "flattened": true
  },
  "SendMessageBatchResult": {
    "type": "structure",
    "members": {
      "Successful": {
        "shape": "SendMessageBatchResultEntryList",
        "flattened": false
      },
      "Failed": {"shape": "BatchResultErrorEntryList", "flattened": false}
    },
    "flattened": false
  },
  "SendMessageBatchResultEntry": {
    "type": "structure",
    "members": {
      "Id": {"shape": "String", "flattened": false},
      "MessageId": {"shape": "String", "flattened": false},
      "MD5OfMessageBody": {"shape": "String", "flattened": false},
      "MD5OfMessageAttributes": {"shape": "String", "flattened": false},
      "MD5OfMessageSystemAttributes": {"shape": "String", "flattened": false},
      "SequenceNumber": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SendMessageBatchResultEntryList": {
    "type": "list",
    "member": {
      "shape": "SendMessageBatchResultEntry",
      "locationName": "SendMessageBatchResultEntry"
    },
    "flattened": true
  },
  "SendMessageRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "MessageBody": {"shape": "String", "flattened": false},
      "DelaySeconds": {"shape": "Integer", "flattened": false},
      "MessageAttributes": {
        "shape": "MessageBodyAttributeMap",
        "flattened": false
      },
      "MessageSystemAttributes": {
        "shape": "MessageBodySystemAttributeMap",
        "flattened": false
      },
      "MessageDeduplicationId": {"shape": "String", "flattened": false},
      "MessageGroupId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SendMessageResult": {
    "type": "structure",
    "members": {
      "MD5OfMessageBody": {"shape": "String", "flattened": false},
      "MD5OfMessageAttributes": {"shape": "String", "flattened": false},
      "MD5OfMessageSystemAttributes": {"shape": "String", "flattened": false},
      "MessageId": {"shape": "String", "flattened": false},
      "SequenceNumber": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SetQueueAttributesRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "QueueAttributeMap", "flattened": false}
    },
    "flattened": false
  },
  "String": {"type": "string", "flattened": false},
  "StringList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "StringListValue"},
    "flattened": false
  },
  "TagKey": {"type": "string", "flattened": false},
  "TagKeyList": {
    "type": "list",
    "member": {"shape": "TagKey", "locationName": "TagKey"},
    "flattened": true
  },
  "TagMap": {
    "type": "map",
    "key": {"shape": "TagKey", "locationName": "Key"},
    "value": {"shape": "TagValue", "locationName": "Value"},
    "locationName": "Tag",
    "flattened": true
  },
  "TagQueueRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagMap", "flattened": false}
    },
    "flattened": false
  },
  "TagValue": {"type": "string", "flattened": false},
  "Token": {"type": "string", "flattened": false},
  "UntagQueueRequest": {
    "type": "structure",
    "members": {
      "QueueUrl": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false}
    },
    "flattened": false
  }
};

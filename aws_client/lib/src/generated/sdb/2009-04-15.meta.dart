// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "Attribute": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "AlternateNameEncoding": {"shape": "String", "flattened": false},
      "Value": {"shape": "String", "flattened": false},
      "AlternateValueEncoding": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AttributeDoesNotExist": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "AttributeList": {
    "type": "list",
    "member": {"shape": "Attribute", "locationName": "Attribute"},
    "flattened": true
  },
  "AttributeNameList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "AttributeName"},
    "flattened": true
  },
  "BatchDeleteAttributesRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "String", "flattened": false},
      "Items": {"shape": "DeletableItemList", "flattened": false}
    },
    "flattened": false
  },
  "BatchPutAttributesRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "String", "flattened": false},
      "Items": {"shape": "ReplaceableItemList", "flattened": false}
    },
    "flattened": false
  },
  "Boolean": {"type": "boolean", "flattened": false},
  "CreateDomainRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeletableAttribute": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Value": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeletableAttributeList": {
    "type": "list",
    "member": {"shape": "DeletableAttribute", "locationName": "Attribute"},
    "flattened": true
  },
  "DeletableItem": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "DeletableAttributeList", "flattened": false}
    },
    "flattened": false
  },
  "DeletableItemList": {
    "type": "list",
    "member": {"shape": "DeletableItem", "locationName": "Item"},
    "flattened": true
  },
  "DeleteAttributesRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "String", "flattened": false},
      "ItemName": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "DeletableAttributeList", "flattened": false},
      "Expected": {"shape": "UpdateCondition", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDomainRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DomainMetadataRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DomainMetadataResult": {
    "type": "structure",
    "members": {
      "ItemCount": {"shape": "Integer", "flattened": false},
      "ItemNamesSizeBytes": {"shape": "Long", "flattened": false},
      "AttributeNameCount": {"shape": "Integer", "flattened": false},
      "AttributeNamesSizeBytes": {"shape": "Long", "flattened": false},
      "AttributeValueCount": {"shape": "Integer", "flattened": false},
      "AttributeValuesSizeBytes": {"shape": "Long", "flattened": false},
      "Timestamp": {"shape": "Integer", "flattened": false}
    },
    "flattened": false
  },
  "DomainNameList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "DomainName"},
    "flattened": true
  },
  "DuplicateItemName": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "Float": {"type": "float", "flattened": false},
  "GetAttributesRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "String", "flattened": false},
      "ItemName": {"shape": "String", "flattened": false},
      "AttributeNames": {"shape": "AttributeNameList", "flattened": false},
      "ConsistentRead": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "GetAttributesResult": {
    "type": "structure",
    "members": {
      "Attributes": {"shape": "AttributeList", "flattened": false}
    },
    "flattened": false
  },
  "Integer": {"type": "integer", "flattened": false},
  "InvalidNextToken": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "InvalidNumberPredicates": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "InvalidNumberValueTests": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "InvalidParameterValue": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "InvalidQueryExpression": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "Item": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "AlternateNameEncoding": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "AttributeList", "flattened": false}
    },
    "flattened": false
  },
  "ItemList": {
    "type": "list",
    "member": {"shape": "Item", "locationName": "Item"},
    "flattened": true
  },
  "ListDomainsRequest": {
    "type": "structure",
    "members": {
      "MaxNumberOfDomains": {"shape": "Integer", "flattened": false},
      "NextToken": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ListDomainsResult": {
    "type": "structure",
    "members": {
      "DomainNames": {"shape": "DomainNameList", "flattened": false},
      "NextToken": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "Long": {"type": "long", "flattened": false},
  "MissingParameter": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "NoSuchDomain": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "NumberDomainAttributesExceeded": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "NumberDomainBytesExceeded": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "NumberDomainsExceeded": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "NumberItemAttributesExceeded": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "NumberSubmittedAttributesExceeded": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "NumberSubmittedItemsExceeded": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "PutAttributesRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "String", "flattened": false},
      "ItemName": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "ReplaceableAttributeList", "flattened": false},
      "Expected": {"shape": "UpdateCondition", "flattened": false}
    },
    "flattened": false
  },
  "ReplaceableAttribute": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Value": {"shape": "String", "flattened": false},
      "Replace": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "ReplaceableAttributeList": {
    "type": "list",
    "member": {"shape": "ReplaceableAttribute", "locationName": "Attribute"},
    "flattened": true
  },
  "ReplaceableItem": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "ReplaceableAttributeList", "flattened": false}
    },
    "flattened": false
  },
  "ReplaceableItemList": {
    "type": "list",
    "member": {"shape": "ReplaceableItem", "locationName": "Item"},
    "flattened": true
  },
  "RequestTimeout": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "SelectRequest": {
    "type": "structure",
    "members": {
      "SelectExpression": {"shape": "String", "flattened": false},
      "NextToken": {"shape": "String", "flattened": false},
      "ConsistentRead": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "SelectResult": {
    "type": "structure",
    "members": {
      "Items": {"shape": "ItemList", "flattened": false},
      "NextToken": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "String": {"type": "string", "flattened": false},
  "TooManyRequestedAttributes": {
    "type": "structure",
    "members": {
      "BoxUsage": {"shape": "Float", "flattened": false}
    },
    "flattened": false
  },
  "UpdateCondition": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Value": {"shape": "String", "flattened": false},
      "Exists": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  }
};

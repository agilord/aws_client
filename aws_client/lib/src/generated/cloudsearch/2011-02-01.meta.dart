// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "AccessPoliciesStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "PolicyDocument", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "Arn": {"type": "string", "flattened": false},
  "AvailabilityOptionsStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "MultiAZ", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "BaseException": {
    "type": "structure",
    "members": {
      "Code": {"shape": "ErrorCode", "flattened": false},
      "Message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "Boolean": {"type": "boolean", "flattened": false},
  "CreateDomainRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false}
    },
    "flattened": false
  },
  "CreateDomainResponse": {
    "type": "structure",
    "members": {
      "DomainStatus": {"shape": "DomainStatus", "flattened": false}
    },
    "flattened": false
  },
  "DefaultSearchFieldStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "FieldName", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "DefineIndexFieldRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "IndexField": {"shape": "IndexField", "flattened": false}
    },
    "flattened": false
  },
  "DefineIndexFieldResponse": {
    "type": "structure",
    "members": {
      "IndexField": {"shape": "IndexFieldStatus", "flattened": false}
    },
    "flattened": false
  },
  "DefineRankExpressionRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "RankExpression": {"shape": "NamedRankExpression", "flattened": false}
    },
    "flattened": false
  },
  "DefineRankExpressionResponse": {
    "type": "structure",
    "members": {
      "RankExpression": {"shape": "RankExpressionStatus", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDomainRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDomainResponse": {
    "type": "structure",
    "members": {
      "DomainStatus": {"shape": "DomainStatus", "flattened": false}
    },
    "flattened": false
  },
  "DeleteIndexFieldRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "IndexFieldName": {"shape": "FieldName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteIndexFieldResponse": {
    "type": "structure",
    "members": {
      "IndexField": {"shape": "IndexFieldStatus", "flattened": false}
    },
    "flattened": false
  },
  "DeleteRankExpressionRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "RankName": {"shape": "FieldName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteRankExpressionResponse": {
    "type": "structure",
    "members": {
      "RankExpression": {"shape": "RankExpressionStatus", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAvailabilityOptionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAvailabilityOptionsResponse": {
    "type": "structure",
    "members": {
      "AvailabilityOptions": {
        "shape": "AvailabilityOptionsStatus",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeDefaultSearchFieldRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDefaultSearchFieldResponse": {
    "type": "structure",
    "members": {
      "DefaultSearchField": {
        "shape": "DefaultSearchFieldStatus",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeDomainsRequest": {
    "type": "structure",
    "members": {
      "DomainNames": {"shape": "DomainNameList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDomainsResponse": {
    "type": "structure",
    "members": {
      "DomainStatusList": {"shape": "DomainStatusList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeIndexFieldsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "FieldNames": {"shape": "FieldNameList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeIndexFieldsResponse": {
    "type": "structure",
    "members": {
      "IndexFields": {"shape": "IndexFieldStatusList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeRankExpressionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "RankNames": {"shape": "FieldNameList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeRankExpressionsResponse": {
    "type": "structure",
    "members": {
      "RankExpressions": {
        "shape": "RankExpressionStatusList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeServiceAccessPoliciesRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false}
    },
    "flattened": false
  },
  "DescribeServiceAccessPoliciesResponse": {
    "type": "structure",
    "members": {
      "AccessPolicies": {"shape": "AccessPoliciesStatus", "flattened": false}
    },
    "flattened": false
  },
  "DescribeStemmingOptionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false}
    },
    "flattened": false
  },
  "DescribeStemmingOptionsResponse": {
    "type": "structure",
    "members": {
      "Stems": {"shape": "StemmingOptionsStatus", "flattened": false}
    },
    "flattened": false
  },
  "DescribeStopwordOptionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false}
    },
    "flattened": false
  },
  "DescribeStopwordOptionsResponse": {
    "type": "structure",
    "members": {
      "Stopwords": {"shape": "StopwordOptionsStatus", "flattened": false}
    },
    "flattened": false
  },
  "DescribeSynonymOptionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false}
    },
    "flattened": false
  },
  "DescribeSynonymOptionsResponse": {
    "type": "structure",
    "members": {
      "Synonyms": {"shape": "SynonymOptionsStatus", "flattened": false}
    },
    "flattened": false
  },
  "DisabledOperationException": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DocumentCount": {"type": "long", "flattened": false},
  "DomainId": {"type": "string", "flattened": false},
  "DomainName": {"type": "string", "flattened": false},
  "DomainNameList": {
    "type": "list",
    "member": {"shape": "DomainName"},
    "flattened": false
  },
  "DomainStatus": {
    "type": "structure",
    "members": {
      "DomainId": {"shape": "DomainId", "flattened": false},
      "DomainName": {"shape": "DomainName", "flattened": false},
      "Created": {"shape": "Boolean", "flattened": false},
      "Deleted": {"shape": "Boolean", "flattened": false},
      "NumSearchableDocs": {"shape": "DocumentCount", "flattened": false},
      "DocService": {"shape": "ServiceEndpoint", "flattened": false},
      "SearchService": {"shape": "ServiceEndpoint", "flattened": false},
      "RequiresIndexDocuments": {"shape": "Boolean", "flattened": false},
      "Processing": {"shape": "Boolean", "flattened": false},
      "SearchInstanceType": {"shape": "SearchInstanceType", "flattened": false},
      "SearchPartitionCount": {"shape": "PartitionCount", "flattened": false},
      "SearchInstanceCount": {"shape": "InstanceCount", "flattened": false}
    },
    "flattened": false
  },
  "DomainStatusList": {
    "type": "list",
    "member": {"shape": "DomainStatus"},
    "flattened": false
  },
  "ErrorCode": {"type": "string", "flattened": false},
  "ErrorMessage": {"type": "string", "flattened": false},
  "FieldName": {"type": "string", "flattened": false},
  "FieldNameList": {
    "type": "list",
    "member": {"shape": "FieldName"},
    "flattened": false
  },
  "FieldValue": {"type": "string", "flattened": false},
  "IndexDocumentsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false}
    },
    "flattened": false
  },
  "IndexDocumentsResponse": {
    "type": "structure",
    "members": {
      "FieldNames": {"shape": "FieldNameList", "flattened": false}
    },
    "flattened": false
  },
  "IndexField": {
    "type": "structure",
    "members": {
      "IndexFieldName": {"shape": "FieldName", "flattened": false},
      "IndexFieldType": {"shape": "IndexFieldType", "flattened": false},
      "UIntOptions": {"shape": "UIntOptions", "flattened": false},
      "LiteralOptions": {"shape": "LiteralOptions", "flattened": false},
      "TextOptions": {"shape": "TextOptions", "flattened": false},
      "SourceAttributes": {"shape": "SourceAttributeList", "flattened": false}
    },
    "flattened": false
  },
  "IndexFieldStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "IndexField", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "IndexFieldStatusList": {
    "type": "list",
    "member": {"shape": "IndexFieldStatus"},
    "flattened": false
  },
  "IndexFieldType": {"type": "string", "flattened": false},
  "InstanceCount": {"type": "integer", "flattened": false},
  "InternalException": {"type": "structure", "members": {}, "flattened": false},
  "InvalidTypeException": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "Language": {"type": "string", "flattened": false},
  "LimitExceededException": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "LiteralOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "FieldValue", "flattened": false},
      "SearchEnabled": {"shape": "Boolean", "flattened": false},
      "FacetEnabled": {"shape": "Boolean", "flattened": false},
      "ResultEnabled": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "MultiAZ": {"type": "boolean", "flattened": false},
  "NamedRankExpression": {
    "type": "structure",
    "members": {
      "RankName": {"shape": "FieldName", "flattened": false},
      "RankExpression": {"shape": "RankExpression", "flattened": false}
    },
    "flattened": false
  },
  "OptionState": {"type": "string", "flattened": false},
  "OptionStatus": {
    "type": "structure",
    "members": {
      "CreationDate": {"shape": "UpdateTimestamp", "flattened": false},
      "UpdateDate": {"shape": "UpdateTimestamp", "flattened": false},
      "UpdateVersion": {"shape": "UIntValue", "flattened": false},
      "State": {"shape": "OptionState", "flattened": false},
      "PendingDeletion": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "PartitionCount": {"type": "integer", "flattened": false},
  "PolicyDocument": {"type": "string", "flattened": false},
  "RankExpression": {"type": "string", "flattened": false},
  "RankExpressionStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "NamedRankExpression", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "RankExpressionStatusList": {
    "type": "list",
    "member": {"shape": "RankExpressionStatus"},
    "flattened": false
  },
  "ResourceNotFoundException": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "SearchInstanceType": {"type": "string", "flattened": false},
  "ServiceEndpoint": {
    "type": "structure",
    "members": {
      "Arn": {"shape": "Arn", "flattened": false},
      "Endpoint": {"shape": "ServiceUrl", "flattened": false}
    },
    "flattened": false
  },
  "ServiceUrl": {"type": "string", "flattened": false},
  "SourceAttribute": {
    "type": "structure",
    "members": {
      "SourceDataFunction": {"shape": "SourceDataFunction", "flattened": false},
      "SourceDataCopy": {"shape": "SourceData", "flattened": false},
      "SourceDataTrimTitle": {
        "shape": "SourceDataTrimTitle",
        "flattened": false
      },
      "SourceDataMap": {"shape": "SourceDataMap", "flattened": false}
    },
    "flattened": false
  },
  "SourceAttributeList": {
    "type": "list",
    "member": {"shape": "SourceAttribute"},
    "flattened": false
  },
  "SourceData": {
    "type": "structure",
    "members": {
      "SourceName": {"shape": "FieldName", "flattened": false},
      "DefaultValue": {"shape": "FieldValue", "flattened": false}
    },
    "flattened": false
  },
  "SourceDataFunction": {"type": "string", "flattened": false},
  "SourceDataMap": {
    "type": "structure",
    "members": {
      "SourceName": {"shape": "FieldName", "flattened": false},
      "DefaultValue": {"shape": "FieldValue", "flattened": false},
      "Cases": {"shape": "StringCaseMap", "flattened": false}
    },
    "flattened": false
  },
  "SourceDataTrimTitle": {
    "type": "structure",
    "members": {
      "SourceName": {"shape": "FieldName", "flattened": false},
      "DefaultValue": {"shape": "FieldValue", "flattened": false},
      "Separator": {"shape": "String", "flattened": false},
      "Language": {"shape": "Language", "flattened": false}
    },
    "flattened": false
  },
  "StemmingOptionsStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "StemsDocument", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "StemsDocument": {"type": "string", "flattened": false},
  "StopwordOptionsStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "StopwordsDocument", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "StopwordsDocument": {"type": "string", "flattened": false},
  "String": {"type": "string", "flattened": false},
  "StringCaseMap": {
    "type": "map",
    "key": {"shape": "FieldValue"},
    "value": {"shape": "FieldValue"},
    "flattened": false
  },
  "SynonymOptionsStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "SynonymsDocument", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "SynonymsDocument": {"type": "string", "flattened": false},
  "TextOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "FieldValue", "flattened": false},
      "FacetEnabled": {"shape": "Boolean", "flattened": false},
      "ResultEnabled": {"shape": "Boolean", "flattened": false},
      "TextProcessor": {"shape": "FieldName", "flattened": false}
    },
    "flattened": false
  },
  "UIntOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "UIntValue", "flattened": false}
    },
    "flattened": false
  },
  "UIntValue": {"type": "integer", "flattened": false},
  "UpdateAvailabilityOptionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "MultiAZ": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "UpdateAvailabilityOptionsResponse": {
    "type": "structure",
    "members": {
      "AvailabilityOptions": {
        "shape": "AvailabilityOptionsStatus",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UpdateDefaultSearchFieldRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "DefaultSearchField": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "UpdateDefaultSearchFieldResponse": {
    "type": "structure",
    "members": {
      "DefaultSearchField": {
        "shape": "DefaultSearchFieldStatus",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UpdateServiceAccessPoliciesRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "AccessPolicies": {"shape": "PolicyDocument", "flattened": false}
    },
    "flattened": false
  },
  "UpdateServiceAccessPoliciesResponse": {
    "type": "structure",
    "members": {
      "AccessPolicies": {"shape": "AccessPoliciesStatus", "flattened": false}
    },
    "flattened": false
  },
  "UpdateStemmingOptionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "Stems": {"shape": "StemsDocument", "flattened": false}
    },
    "flattened": false
  },
  "UpdateStemmingOptionsResponse": {
    "type": "structure",
    "members": {
      "Stems": {"shape": "StemmingOptionsStatus", "flattened": false}
    },
    "flattened": false
  },
  "UpdateStopwordOptionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "Stopwords": {"shape": "StopwordsDocument", "flattened": false}
    },
    "flattened": false
  },
  "UpdateStopwordOptionsResponse": {
    "type": "structure",
    "members": {
      "Stopwords": {"shape": "StopwordOptionsStatus", "flattened": false}
    },
    "flattened": false
  },
  "UpdateSynonymOptionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "Synonyms": {"shape": "SynonymsDocument", "flattened": false}
    },
    "flattened": false
  },
  "UpdateSynonymOptionsResponse": {
    "type": "structure",
    "members": {
      "Synonyms": {"shape": "SynonymOptionsStatus", "flattened": false}
    },
    "flattened": false
  },
  "UpdateTimestamp": {"type": "timestamp", "flattened": false}
};

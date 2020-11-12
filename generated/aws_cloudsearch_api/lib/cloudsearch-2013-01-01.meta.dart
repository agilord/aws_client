// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "APIVersion": {"type": "string", "flattened": false},
  "ARN": {"type": "string", "flattened": false},
  "AccessPoliciesStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "PolicyDocument", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "AlgorithmicStemming": {"type": "string", "flattened": false},
  "AnalysisOptions": {
    "type": "structure",
    "members": {
      "Synonyms": {"shape": "String", "flattened": false},
      "Stopwords": {"shape": "String", "flattened": false},
      "StemmingDictionary": {"shape": "String", "flattened": false},
      "JapaneseTokenizationDictionary": {"shape": "String", "flattened": false},
      "AlgorithmicStemming": {
        "shape": "AlgorithmicStemming",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AnalysisScheme": {
    "type": "structure",
    "members": {
      "AnalysisSchemeName": {"shape": "StandardName", "flattened": false},
      "AnalysisSchemeLanguage": {
        "shape": "AnalysisSchemeLanguage",
        "flattened": false
      },
      "AnalysisOptions": {"shape": "AnalysisOptions", "flattened": false}
    },
    "flattened": false
  },
  "AnalysisSchemeLanguage": {"type": "string", "flattened": false},
  "AnalysisSchemeStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "AnalysisScheme", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "AnalysisSchemeStatusList": {
    "type": "list",
    "member": {"shape": "AnalysisSchemeStatus"},
    "flattened": false
  },
  "AvailabilityOptionsStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "MultiAZ", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "Boolean": {"type": "boolean", "flattened": false},
  "BuildSuggestersRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false}
    },
    "flattened": false
  },
  "BuildSuggestersResponse": {
    "type": "structure",
    "members": {
      "FieldNames": {"shape": "FieldNameList", "flattened": false}
    },
    "flattened": false
  },
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
  "DateArrayOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "FieldValue", "flattened": false},
      "SourceFields": {"shape": "FieldNameCommaList", "flattened": false},
      "FacetEnabled": {"shape": "Boolean", "flattened": false},
      "SearchEnabled": {"shape": "Boolean", "flattened": false},
      "ReturnEnabled": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DateOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "FieldValue", "flattened": false},
      "SourceField": {"shape": "FieldName", "flattened": false},
      "FacetEnabled": {"shape": "Boolean", "flattened": false},
      "SearchEnabled": {"shape": "Boolean", "flattened": false},
      "ReturnEnabled": {"shape": "Boolean", "flattened": false},
      "SortEnabled": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DefineAnalysisSchemeRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "AnalysisScheme": {"shape": "AnalysisScheme", "flattened": false}
    },
    "flattened": false
  },
  "DefineAnalysisSchemeResponse": {
    "type": "structure",
    "members": {
      "AnalysisScheme": {"shape": "AnalysisSchemeStatus", "flattened": false}
    },
    "flattened": false
  },
  "DefineExpressionRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "Expression": {"shape": "Expression", "flattened": false}
    },
    "flattened": false
  },
  "DefineExpressionResponse": {
    "type": "structure",
    "members": {
      "Expression": {"shape": "ExpressionStatus", "flattened": false}
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
  "DefineSuggesterRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "Suggester": {"shape": "Suggester", "flattened": false}
    },
    "flattened": false
  },
  "DefineSuggesterResponse": {
    "type": "structure",
    "members": {
      "Suggester": {"shape": "SuggesterStatus", "flattened": false}
    },
    "flattened": false
  },
  "DeleteAnalysisSchemeRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "AnalysisSchemeName": {"shape": "StandardName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteAnalysisSchemeResponse": {
    "type": "structure",
    "members": {
      "AnalysisScheme": {"shape": "AnalysisSchemeStatus", "flattened": false}
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
  "DeleteExpressionRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "ExpressionName": {"shape": "StandardName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteExpressionResponse": {
    "type": "structure",
    "members": {
      "Expression": {"shape": "ExpressionStatus", "flattened": false}
    },
    "flattened": false
  },
  "DeleteIndexFieldRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "IndexFieldName": {"shape": "DynamicFieldName", "flattened": false}
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
  "DeleteSuggesterRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "SuggesterName": {"shape": "StandardName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteSuggesterResponse": {
    "type": "structure",
    "members": {
      "Suggester": {"shape": "SuggesterStatus", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAnalysisSchemesRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "AnalysisSchemeNames": {"shape": "StandardNameList", "flattened": false},
      "Deployed": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAnalysisSchemesResponse": {
    "type": "structure",
    "members": {
      "AnalysisSchemes": {
        "shape": "AnalysisSchemeStatusList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeAvailabilityOptionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "Deployed": {"shape": "Boolean", "flattened": false}
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
  "DescribeDomainEndpointOptionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "Deployed": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDomainEndpointOptionsResponse": {
    "type": "structure",
    "members": {
      "DomainEndpointOptions": {
        "shape": "DomainEndpointOptionsStatus",
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
  "DescribeExpressionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "ExpressionNames": {"shape": "StandardNameList", "flattened": false},
      "Deployed": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DescribeExpressionsResponse": {
    "type": "structure",
    "members": {
      "Expressions": {"shape": "ExpressionStatusList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeIndexFieldsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "FieldNames": {"shape": "DynamicFieldNameList", "flattened": false},
      "Deployed": {"shape": "Boolean", "flattened": false}
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
  "DescribeScalingParametersRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false}
    },
    "flattened": false
  },
  "DescribeScalingParametersResponse": {
    "type": "structure",
    "members": {
      "ScalingParameters": {
        "shape": "ScalingParametersStatus",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeServiceAccessPoliciesRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "Deployed": {"shape": "Boolean", "flattened": false}
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
  "DescribeSuggestersRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "SuggesterNames": {"shape": "StandardNameList", "flattened": false},
      "Deployed": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DescribeSuggestersResponse": {
    "type": "structure",
    "members": {
      "Suggesters": {"shape": "SuggesterStatusList", "flattened": false}
    },
    "flattened": false
  },
  "DocumentSuggesterOptions": {
    "type": "structure",
    "members": {
      "SourceField": {"shape": "FieldName", "flattened": false},
      "FuzzyMatching": {"shape": "SuggesterFuzzyMatching", "flattened": false},
      "SortExpression": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DomainEndpointOptions": {
    "type": "structure",
    "members": {
      "EnforceHTTPS": {"shape": "Boolean", "flattened": false},
      "TLSSecurityPolicy": {"shape": "TLSSecurityPolicy", "flattened": false}
    },
    "flattened": false
  },
  "DomainEndpointOptionsStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "DomainEndpointOptions", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "DomainId": {"type": "string", "flattened": false},
  "DomainName": {"type": "string", "flattened": false},
  "DomainNameList": {
    "type": "list",
    "member": {"shape": "DomainName"},
    "flattened": false
  },
  "DomainNameMap": {
    "type": "map",
    "key": {"shape": "DomainName"},
    "value": {"shape": "APIVersion"},
    "flattened": false
  },
  "DomainStatus": {
    "type": "structure",
    "members": {
      "DomainId": {"shape": "DomainId", "flattened": false},
      "DomainName": {"shape": "DomainName", "flattened": false},
      "ARN": {"shape": "ARN", "flattened": false},
      "Created": {"shape": "Boolean", "flattened": false},
      "Deleted": {"shape": "Boolean", "flattened": false},
      "DocService": {"shape": "ServiceEndpoint", "flattened": false},
      "SearchService": {"shape": "ServiceEndpoint", "flattened": false},
      "RequiresIndexDocuments": {"shape": "Boolean", "flattened": false},
      "Processing": {"shape": "Boolean", "flattened": false},
      "SearchInstanceType": {"shape": "SearchInstanceType", "flattened": false},
      "SearchPartitionCount": {"shape": "PartitionCount", "flattened": false},
      "SearchInstanceCount": {"shape": "InstanceCount", "flattened": false},
      "Limits": {"shape": "Limits", "flattened": false}
    },
    "flattened": false
  },
  "DomainStatusList": {
    "type": "list",
    "member": {"shape": "DomainStatus"},
    "flattened": false
  },
  "Double": {"type": "double", "flattened": false},
  "DoubleArrayOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "Double", "flattened": false},
      "SourceFields": {"shape": "FieldNameCommaList", "flattened": false},
      "FacetEnabled": {"shape": "Boolean", "flattened": false},
      "SearchEnabled": {"shape": "Boolean", "flattened": false},
      "ReturnEnabled": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DoubleOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "Double", "flattened": false},
      "SourceField": {"shape": "FieldName", "flattened": false},
      "FacetEnabled": {"shape": "Boolean", "flattened": false},
      "SearchEnabled": {"shape": "Boolean", "flattened": false},
      "ReturnEnabled": {"shape": "Boolean", "flattened": false},
      "SortEnabled": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DynamicFieldName": {"type": "string", "flattened": false},
  "DynamicFieldNameList": {
    "type": "list",
    "member": {"shape": "DynamicFieldName"},
    "flattened": false
  },
  "Expression": {
    "type": "structure",
    "members": {
      "ExpressionName": {"shape": "StandardName", "flattened": false},
      "ExpressionValue": {"shape": "ExpressionValue", "flattened": false}
    },
    "flattened": false
  },
  "ExpressionStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "Expression", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "ExpressionStatusList": {
    "type": "list",
    "member": {"shape": "ExpressionStatus"},
    "flattened": false
  },
  "ExpressionValue": {"type": "string", "flattened": false},
  "FieldName": {"type": "string", "flattened": false},
  "FieldNameCommaList": {"type": "string", "flattened": false},
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
      "IndexFieldName": {"shape": "DynamicFieldName", "flattened": false},
      "IndexFieldType": {"shape": "IndexFieldType", "flattened": false},
      "IntOptions": {"shape": "IntOptions", "flattened": false},
      "DoubleOptions": {"shape": "DoubleOptions", "flattened": false},
      "LiteralOptions": {"shape": "LiteralOptions", "flattened": false},
      "TextOptions": {"shape": "TextOptions", "flattened": false},
      "DateOptions": {"shape": "DateOptions", "flattened": false},
      "LatLonOptions": {"shape": "LatLonOptions", "flattened": false},
      "IntArrayOptions": {"shape": "IntArrayOptions", "flattened": false},
      "DoubleArrayOptions": {"shape": "DoubleArrayOptions", "flattened": false},
      "LiteralArrayOptions": {
        "shape": "LiteralArrayOptions",
        "flattened": false
      },
      "TextArrayOptions": {"shape": "TextArrayOptions", "flattened": false},
      "DateArrayOptions": {"shape": "DateArrayOptions", "flattened": false}
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
  "IntArrayOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "Long", "flattened": false},
      "SourceFields": {"shape": "FieldNameCommaList", "flattened": false},
      "FacetEnabled": {"shape": "Boolean", "flattened": false},
      "SearchEnabled": {"shape": "Boolean", "flattened": false},
      "ReturnEnabled": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "IntOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "Long", "flattened": false},
      "SourceField": {"shape": "FieldName", "flattened": false},
      "FacetEnabled": {"shape": "Boolean", "flattened": false},
      "SearchEnabled": {"shape": "Boolean", "flattened": false},
      "ReturnEnabled": {"shape": "Boolean", "flattened": false},
      "SortEnabled": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "LatLonOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "FieldValue", "flattened": false},
      "SourceField": {"shape": "FieldName", "flattened": false},
      "FacetEnabled": {"shape": "Boolean", "flattened": false},
      "SearchEnabled": {"shape": "Boolean", "flattened": false},
      "ReturnEnabled": {"shape": "Boolean", "flattened": false},
      "SortEnabled": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "Limits": {
    "type": "structure",
    "members": {
      "MaximumReplicationCount": {
        "shape": "MaximumReplicationCount",
        "flattened": false
      },
      "MaximumPartitionCount": {
        "shape": "MaximumPartitionCount",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ListDomainNamesResponse": {
    "type": "structure",
    "members": {
      "DomainNames": {"shape": "DomainNameMap", "flattened": false}
    },
    "flattened": false
  },
  "LiteralArrayOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "FieldValue", "flattened": false},
      "SourceFields": {"shape": "FieldNameCommaList", "flattened": false},
      "FacetEnabled": {"shape": "Boolean", "flattened": false},
      "SearchEnabled": {"shape": "Boolean", "flattened": false},
      "ReturnEnabled": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "LiteralOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "FieldValue", "flattened": false},
      "SourceField": {"shape": "FieldName", "flattened": false},
      "FacetEnabled": {"shape": "Boolean", "flattened": false},
      "SearchEnabled": {"shape": "Boolean", "flattened": false},
      "ReturnEnabled": {"shape": "Boolean", "flattened": false},
      "SortEnabled": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "Long": {"type": "long", "flattened": false},
  "MaximumPartitionCount": {"type": "integer", "flattened": false},
  "MaximumReplicationCount": {"type": "integer", "flattened": false},
  "MultiAZ": {"type": "boolean", "flattened": false},
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
  "PartitionInstanceType": {"type": "string", "flattened": false},
  "PolicyDocument": {"type": "string", "flattened": false},
  "ScalingParameters": {
    "type": "structure",
    "members": {
      "DesiredInstanceType": {
        "shape": "PartitionInstanceType",
        "flattened": false
      },
      "DesiredReplicationCount": {"shape": "UIntValue", "flattened": false},
      "DesiredPartitionCount": {"shape": "UIntValue", "flattened": false}
    },
    "flattened": false
  },
  "ScalingParametersStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "ScalingParameters", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "SearchInstanceType": {"type": "string", "flattened": false},
  "ServiceEndpoint": {
    "type": "structure",
    "members": {
      "Endpoint": {"shape": "ServiceUrl", "flattened": false}
    },
    "flattened": false
  },
  "ServiceUrl": {"type": "string", "flattened": false},
  "StandardName": {"type": "string", "flattened": false},
  "StandardNameList": {
    "type": "list",
    "member": {"shape": "StandardName"},
    "flattened": false
  },
  "String": {"type": "string", "flattened": false},
  "Suggester": {
    "type": "structure",
    "members": {
      "SuggesterName": {"shape": "StandardName", "flattened": false},
      "DocumentSuggesterOptions": {
        "shape": "DocumentSuggesterOptions",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SuggesterFuzzyMatching": {"type": "string", "flattened": false},
  "SuggesterStatus": {
    "type": "structure",
    "members": {
      "Options": {"shape": "Suggester", "flattened": false},
      "Status": {"shape": "OptionStatus", "flattened": false}
    },
    "flattened": false
  },
  "SuggesterStatusList": {
    "type": "list",
    "member": {"shape": "SuggesterStatus"},
    "flattened": false
  },
  "TLSSecurityPolicy": {"type": "string", "flattened": false},
  "TextArrayOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "FieldValue", "flattened": false},
      "SourceFields": {"shape": "FieldNameCommaList", "flattened": false},
      "ReturnEnabled": {"shape": "Boolean", "flattened": false},
      "HighlightEnabled": {"shape": "Boolean", "flattened": false},
      "AnalysisScheme": {"shape": "Word", "flattened": false}
    },
    "flattened": false
  },
  "TextOptions": {
    "type": "structure",
    "members": {
      "DefaultValue": {"shape": "FieldValue", "flattened": false},
      "SourceField": {"shape": "FieldName", "flattened": false},
      "ReturnEnabled": {"shape": "Boolean", "flattened": false},
      "SortEnabled": {"shape": "Boolean", "flattened": false},
      "HighlightEnabled": {"shape": "Boolean", "flattened": false},
      "AnalysisScheme": {"shape": "Word", "flattened": false}
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
  "UpdateDomainEndpointOptionsRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "DomainEndpointOptions": {
        "shape": "DomainEndpointOptions",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UpdateDomainEndpointOptionsResponse": {
    "type": "structure",
    "members": {
      "DomainEndpointOptions": {
        "shape": "DomainEndpointOptionsStatus",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UpdateScalingParametersRequest": {
    "type": "structure",
    "members": {
      "DomainName": {"shape": "DomainName", "flattened": false},
      "ScalingParameters": {"shape": "ScalingParameters", "flattened": false}
    },
    "flattened": false
  },
  "UpdateScalingParametersResponse": {
    "type": "structure",
    "members": {
      "ScalingParameters": {
        "shape": "ScalingParametersStatus",
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
  "UpdateTimestamp": {"type": "timestamp", "flattened": false},
  "Word": {"type": "string", "flattened": false}
};

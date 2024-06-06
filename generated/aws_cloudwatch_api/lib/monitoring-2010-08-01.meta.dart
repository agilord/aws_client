// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "AccountId": {"type": "string", "flattened": false},
  "ActionPrefix": {"type": "string", "flattened": false},
  "ActionsEnabled": {"type": "boolean", "flattened": false},
  "ActionsSuppressedBy": {"type": "string", "flattened": false},
  "ActionsSuppressedReason": {"type": "string", "flattened": false},
  "AlarmArn": {"type": "string", "flattened": false},
  "AlarmDescription": {"type": "string", "flattened": false},
  "AlarmHistoryItem": {
    "type": "structure",
    "members": {
      "AlarmName": {"shape": "AlarmName", "flattened": false},
      "AlarmType": {"shape": "AlarmType", "flattened": false},
      "Timestamp": {"shape": "Timestamp", "flattened": false},
      "HistoryItemType": {"shape": "HistoryItemType", "flattened": false},
      "HistorySummary": {"shape": "HistorySummary", "flattened": false},
      "HistoryData": {"shape": "HistoryData", "flattened": false}
    },
    "flattened": false
  },
  "AlarmHistoryItems": {
    "type": "list",
    "member": {"shape": "AlarmHistoryItem"},
    "flattened": false
  },
  "AlarmName": {"type": "string", "flattened": false},
  "AlarmNamePrefix": {"type": "string", "flattened": false},
  "AlarmNames": {
    "type": "list",
    "member": {"shape": "AlarmName"},
    "flattened": false
  },
  "AlarmRule": {"type": "string", "flattened": false},
  "AlarmType": {"type": "string", "flattened": false},
  "AlarmTypes": {
    "type": "list",
    "member": {"shape": "AlarmType"},
    "flattened": false
  },
  "AmazonResourceName": {"type": "string", "flattened": false},
  "AnomalyDetector": {
    "type": "structure",
    "members": {
      "Namespace": {"shape": "Namespace", "flattened": false},
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Dimensions": {"shape": "Dimensions", "flattened": false},
      "Stat": {"shape": "AnomalyDetectorMetricStat", "flattened": false},
      "Configuration": {
        "shape": "AnomalyDetectorConfiguration",
        "flattened": false
      },
      "StateValue": {"shape": "AnomalyDetectorStateValue", "flattened": false},
      "MetricCharacteristics": {
        "shape": "MetricCharacteristics",
        "flattened": false
      },
      "SingleMetricAnomalyDetector": {
        "shape": "SingleMetricAnomalyDetector",
        "flattened": false
      },
      "MetricMathAnomalyDetector": {
        "shape": "MetricMathAnomalyDetector",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AnomalyDetectorConfiguration": {
    "type": "structure",
    "members": {
      "ExcludedTimeRanges": {
        "shape": "AnomalyDetectorExcludedTimeRanges",
        "flattened": false
      },
      "MetricTimezone": {
        "shape": "AnomalyDetectorMetricTimezone",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AnomalyDetectorExcludedTimeRanges": {
    "type": "list",
    "member": {"shape": "Range"},
    "flattened": false
  },
  "AnomalyDetectorMetricStat": {"type": "string", "flattened": false},
  "AnomalyDetectorMetricTimezone": {"type": "string", "flattened": false},
  "AnomalyDetectorStateValue": {"type": "string", "flattened": false},
  "AnomalyDetectorType": {"type": "string", "flattened": false},
  "AnomalyDetectorTypes": {
    "type": "list",
    "member": {"shape": "AnomalyDetectorType"},
    "flattened": false
  },
  "AnomalyDetectors": {
    "type": "list",
    "member": {"shape": "AnomalyDetector"},
    "flattened": false
  },
  "BatchFailures": {
    "type": "list",
    "member": {"shape": "PartialFailure"},
    "flattened": false
  },
  "ComparisonOperator": {"type": "string", "flattened": false},
  "CompositeAlarm": {
    "type": "structure",
    "members": {
      "ActionsEnabled": {"shape": "ActionsEnabled", "flattened": false},
      "AlarmActions": {"shape": "ResourceList", "flattened": false},
      "AlarmArn": {"shape": "AlarmArn", "flattened": false},
      "AlarmConfigurationUpdatedTimestamp": {
        "shape": "Timestamp",
        "flattened": false
      },
      "AlarmDescription": {"shape": "AlarmDescription", "flattened": false},
      "AlarmName": {"shape": "AlarmName", "flattened": false},
      "AlarmRule": {"shape": "AlarmRule", "flattened": false},
      "InsufficientDataActions": {"shape": "ResourceList", "flattened": false},
      "OKActions": {"shape": "ResourceList", "flattened": false},
      "StateReason": {"shape": "StateReason", "flattened": false},
      "StateReasonData": {"shape": "StateReasonData", "flattened": false},
      "StateUpdatedTimestamp": {"shape": "Timestamp", "flattened": false},
      "StateValue": {"shape": "StateValue", "flattened": false},
      "StateTransitionedTimestamp": {"shape": "Timestamp", "flattened": false},
      "ActionsSuppressedBy": {
        "shape": "ActionsSuppressedBy",
        "flattened": false
      },
      "ActionsSuppressedReason": {
        "shape": "ActionsSuppressedReason",
        "flattened": false
      },
      "ActionsSuppressor": {"shape": "AlarmArn", "flattened": false},
      "ActionsSuppressorWaitPeriod": {
        "shape": "SuppressorPeriod",
        "flattened": false
      },
      "ActionsSuppressorExtensionPeriod": {
        "shape": "SuppressorPeriod",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CompositeAlarms": {
    "type": "list",
    "member": {"shape": "CompositeAlarm"},
    "flattened": false
  },
  "Counts": {
    "type": "list",
    "member": {"shape": "DatapointValue"},
    "flattened": false
  },
  "DashboardArn": {"type": "string", "flattened": false},
  "DashboardBody": {"type": "string", "flattened": false},
  "DashboardEntries": {
    "type": "list",
    "member": {"shape": "DashboardEntry"},
    "flattened": false
  },
  "DashboardEntry": {
    "type": "structure",
    "members": {
      "DashboardName": {"shape": "DashboardName", "flattened": false},
      "DashboardArn": {"shape": "DashboardArn", "flattened": false},
      "LastModified": {"shape": "LastModified", "flattened": false},
      "Size": {"shape": "Size", "flattened": false}
    },
    "flattened": false
  },
  "DashboardName": {"type": "string", "flattened": false},
  "DashboardNamePrefix": {"type": "string", "flattened": false},
  "DashboardNames": {
    "type": "list",
    "member": {"shape": "DashboardName"},
    "flattened": false
  },
  "DashboardValidationMessage": {
    "type": "structure",
    "members": {
      "DataPath": {"shape": "DataPath", "flattened": false},
      "Message": {"shape": "Message", "flattened": false}
    },
    "flattened": false
  },
  "DashboardValidationMessages": {
    "type": "list",
    "member": {"shape": "DashboardValidationMessage"},
    "flattened": false
  },
  "DataPath": {"type": "string", "flattened": false},
  "Datapoint": {
    "type": "structure",
    "members": {
      "Timestamp": {"shape": "Timestamp", "flattened": false},
      "SampleCount": {"shape": "DatapointValue", "flattened": false},
      "Average": {"shape": "DatapointValue", "flattened": false},
      "Sum": {"shape": "DatapointValue", "flattened": false},
      "Minimum": {"shape": "DatapointValue", "flattened": false},
      "Maximum": {"shape": "DatapointValue", "flattened": false},
      "Unit": {"shape": "StandardUnit", "flattened": false},
      "ExtendedStatistics": {"shape": "DatapointValueMap", "flattened": false}
    },
    "flattened": false
  },
  "DatapointValue": {"type": "double", "flattened": false},
  "DatapointValueMap": {
    "type": "map",
    "key": {"shape": "ExtendedStatistic"},
    "value": {"shape": "DatapointValue"},
    "flattened": false
  },
  "DatapointValues": {
    "type": "list",
    "member": {"shape": "DatapointValue"},
    "flattened": false
  },
  "Datapoints": {
    "type": "list",
    "member": {"shape": "Datapoint"},
    "flattened": false
  },
  "DatapointsToAlarm": {"type": "integer", "flattened": false},
  "DeleteAlarmsInput": {
    "type": "structure",
    "members": {
      "AlarmNames": {"shape": "AlarmNames", "flattened": false}
    },
    "flattened": false
  },
  "DeleteAnomalyDetectorInput": {
    "type": "structure",
    "members": {
      "Namespace": {"shape": "Namespace", "flattened": false},
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Dimensions": {"shape": "Dimensions", "flattened": false},
      "Stat": {"shape": "AnomalyDetectorMetricStat", "flattened": false},
      "SingleMetricAnomalyDetector": {
        "shape": "SingleMetricAnomalyDetector",
        "flattened": false
      },
      "MetricMathAnomalyDetector": {
        "shape": "MetricMathAnomalyDetector",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteAnomalyDetectorOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteDashboardsInput": {
    "type": "structure",
    "members": {
      "DashboardNames": {"shape": "DashboardNames", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDashboardsOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteInsightRulesInput": {
    "type": "structure",
    "members": {
      "RuleNames": {"shape": "InsightRuleNames", "flattened": false}
    },
    "flattened": false
  },
  "DeleteInsightRulesOutput": {
    "type": "structure",
    "members": {
      "Failures": {"shape": "BatchFailures", "flattened": false}
    },
    "flattened": false
  },
  "DeleteMetricStreamInput": {
    "type": "structure",
    "members": {
      "Name": {"shape": "MetricStreamName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteMetricStreamOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DescribeAlarmHistoryInput": {
    "type": "structure",
    "members": {
      "AlarmName": {"shape": "AlarmName", "flattened": false},
      "AlarmTypes": {"shape": "AlarmTypes", "flattened": false},
      "HistoryItemType": {"shape": "HistoryItemType", "flattened": false},
      "StartDate": {"shape": "Timestamp", "flattened": false},
      "EndDate": {"shape": "Timestamp", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false},
      "ScanBy": {"shape": "ScanBy", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAlarmHistoryOutput": {
    "type": "structure",
    "members": {
      "AlarmHistoryItems": {"shape": "AlarmHistoryItems", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAlarmsForMetricInput": {
    "type": "structure",
    "members": {
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Namespace": {"shape": "Namespace", "flattened": false},
      "Statistic": {"shape": "Statistic", "flattened": false},
      "ExtendedStatistic": {"shape": "ExtendedStatistic", "flattened": false},
      "Dimensions": {"shape": "Dimensions", "flattened": false},
      "Period": {"shape": "Period", "flattened": false},
      "Unit": {"shape": "StandardUnit", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAlarmsForMetricOutput": {
    "type": "structure",
    "members": {
      "MetricAlarms": {"shape": "MetricAlarms", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAlarmsInput": {
    "type": "structure",
    "members": {
      "AlarmNames": {"shape": "AlarmNames", "flattened": false},
      "AlarmNamePrefix": {"shape": "AlarmNamePrefix", "flattened": false},
      "AlarmTypes": {"shape": "AlarmTypes", "flattened": false},
      "ChildrenOfAlarmName": {"shape": "AlarmName", "flattened": false},
      "ParentsOfAlarmName": {"shape": "AlarmName", "flattened": false},
      "StateValue": {"shape": "StateValue", "flattened": false},
      "ActionPrefix": {"shape": "ActionPrefix", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAlarmsOutput": {
    "type": "structure",
    "members": {
      "CompositeAlarms": {"shape": "CompositeAlarms", "flattened": false},
      "MetricAlarms": {"shape": "MetricAlarms", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAnomalyDetectorsInput": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "NextToken", "flattened": false},
      "MaxResults": {"shape": "MaxReturnedResultsCount", "flattened": false},
      "Namespace": {"shape": "Namespace", "flattened": false},
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Dimensions": {"shape": "Dimensions", "flattened": false},
      "AnomalyDetectorTypes": {
        "shape": "AnomalyDetectorTypes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeAnomalyDetectorsOutput": {
    "type": "structure",
    "members": {
      "AnomalyDetectors": {"shape": "AnomalyDetectors", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "DescribeInsightRulesInput": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "NextToken", "flattened": false},
      "MaxResults": {"shape": "InsightRuleMaxResults", "flattened": false}
    },
    "flattened": false
  },
  "DescribeInsightRulesOutput": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "NextToken", "flattened": false},
      "InsightRules": {"shape": "InsightRules", "flattened": false}
    },
    "flattened": false
  },
  "Dimension": {
    "type": "structure",
    "members": {
      "Name": {"shape": "DimensionName", "flattened": false},
      "Value": {"shape": "DimensionValue", "flattened": false}
    },
    "flattened": false
  },
  "DimensionFilter": {
    "type": "structure",
    "members": {
      "Name": {"shape": "DimensionName", "flattened": false},
      "Value": {"shape": "DimensionValue", "flattened": false}
    },
    "flattened": false
  },
  "DimensionFilters": {
    "type": "list",
    "member": {"shape": "DimensionFilter"},
    "flattened": false
  },
  "DimensionName": {"type": "string", "flattened": false},
  "DimensionValue": {"type": "string", "flattened": false},
  "Dimensions": {
    "type": "list",
    "member": {"shape": "Dimension"},
    "flattened": false
  },
  "DisableAlarmActionsInput": {
    "type": "structure",
    "members": {
      "AlarmNames": {"shape": "AlarmNames", "flattened": false}
    },
    "flattened": false
  },
  "DisableInsightRulesInput": {
    "type": "structure",
    "members": {
      "RuleNames": {"shape": "InsightRuleNames", "flattened": false}
    },
    "flattened": false
  },
  "DisableInsightRulesOutput": {
    "type": "structure",
    "members": {
      "Failures": {"shape": "BatchFailures", "flattened": false}
    },
    "flattened": false
  },
  "EnableAlarmActionsInput": {
    "type": "structure",
    "members": {
      "AlarmNames": {"shape": "AlarmNames", "flattened": false}
    },
    "flattened": false
  },
  "EnableInsightRulesInput": {
    "type": "structure",
    "members": {
      "RuleNames": {"shape": "InsightRuleNames", "flattened": false}
    },
    "flattened": false
  },
  "EnableInsightRulesOutput": {
    "type": "structure",
    "members": {
      "Failures": {"shape": "BatchFailures", "flattened": false}
    },
    "flattened": false
  },
  "EvaluateLowSampleCountPercentile": {"type": "string", "flattened": false},
  "EvaluationPeriods": {"type": "integer", "flattened": false},
  "EvaluationState": {"type": "string", "flattened": false},
  "ExceptionType": {"type": "string", "flattened": false},
  "ExtendedStatistic": {"type": "string", "flattened": false},
  "ExtendedStatistics": {
    "type": "list",
    "member": {"shape": "ExtendedStatistic"},
    "flattened": false
  },
  "FailureCode": {"type": "string", "flattened": false},
  "FailureDescription": {"type": "string", "flattened": false},
  "FailureResource": {"type": "string", "flattened": false},
  "GetDashboardInput": {
    "type": "structure",
    "members": {
      "DashboardName": {"shape": "DashboardName", "flattened": false}
    },
    "flattened": false
  },
  "GetDashboardOutput": {
    "type": "structure",
    "members": {
      "DashboardArn": {"shape": "DashboardArn", "flattened": false},
      "DashboardBody": {"shape": "DashboardBody", "flattened": false},
      "DashboardName": {"shape": "DashboardName", "flattened": false}
    },
    "flattened": false
  },
  "GetInsightRuleReportInput": {
    "type": "structure",
    "members": {
      "RuleName": {"shape": "InsightRuleName", "flattened": false},
      "StartTime": {"shape": "Timestamp", "flattened": false},
      "EndTime": {"shape": "Timestamp", "flattened": false},
      "Period": {"shape": "Period", "flattened": false},
      "MaxContributorCount": {
        "shape": "InsightRuleUnboundInteger",
        "flattened": false
      },
      "Metrics": {"shape": "InsightRuleMetricList", "flattened": false},
      "OrderBy": {"shape": "InsightRuleOrderBy", "flattened": false}
    },
    "flattened": false
  },
  "GetInsightRuleReportOutput": {
    "type": "structure",
    "members": {
      "KeyLabels": {
        "shape": "InsightRuleContributorKeyLabels",
        "flattened": false
      },
      "AggregationStatistic": {
        "shape": "InsightRuleAggregationStatistic",
        "flattened": false
      },
      "AggregateValue": {
        "shape": "InsightRuleUnboundDouble",
        "flattened": false
      },
      "ApproximateUniqueCount": {
        "shape": "InsightRuleUnboundLong",
        "flattened": false
      },
      "Contributors": {"shape": "InsightRuleContributors", "flattened": false},
      "MetricDatapoints": {
        "shape": "InsightRuleMetricDatapoints",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetMetricDataInput": {
    "type": "structure",
    "members": {
      "MetricDataQueries": {"shape": "MetricDataQueries", "flattened": false},
      "StartTime": {"shape": "Timestamp", "flattened": false},
      "EndTime": {"shape": "Timestamp", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false},
      "ScanBy": {"shape": "ScanBy", "flattened": false},
      "MaxDatapoints": {
        "shape": "GetMetricDataMaxDatapoints",
        "flattened": false
      },
      "LabelOptions": {"shape": "LabelOptions", "flattened": false}
    },
    "flattened": false
  },
  "GetMetricDataLabelTimezone": {"type": "string", "flattened": false},
  "GetMetricDataMaxDatapoints": {"type": "integer", "flattened": false},
  "GetMetricDataOutput": {
    "type": "structure",
    "members": {
      "MetricDataResults": {"shape": "MetricDataResults", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false},
      "Messages": {"shape": "MetricDataResultMessages", "flattened": false}
    },
    "flattened": false
  },
  "GetMetricStatisticsInput": {
    "type": "structure",
    "members": {
      "Namespace": {"shape": "Namespace", "flattened": false},
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Dimensions": {"shape": "Dimensions", "flattened": false},
      "StartTime": {"shape": "Timestamp", "flattened": false},
      "EndTime": {"shape": "Timestamp", "flattened": false},
      "Period": {"shape": "Period", "flattened": false},
      "Statistics": {"shape": "Statistics", "flattened": false},
      "ExtendedStatistics": {"shape": "ExtendedStatistics", "flattened": false},
      "Unit": {"shape": "StandardUnit", "flattened": false}
    },
    "flattened": false
  },
  "GetMetricStatisticsOutput": {
    "type": "structure",
    "members": {
      "Label": {"shape": "MetricLabel", "flattened": false},
      "Datapoints": {"shape": "Datapoints", "flattened": false}
    },
    "flattened": false
  },
  "GetMetricStreamInput": {
    "type": "structure",
    "members": {
      "Name": {"shape": "MetricStreamName", "flattened": false}
    },
    "flattened": false
  },
  "GetMetricStreamOutput": {
    "type": "structure",
    "members": {
      "Arn": {"shape": "AmazonResourceName", "flattened": false},
      "Name": {"shape": "MetricStreamName", "flattened": false},
      "IncludeFilters": {"shape": "MetricStreamFilters", "flattened": false},
      "ExcludeFilters": {"shape": "MetricStreamFilters", "flattened": false},
      "FirehoseArn": {"shape": "AmazonResourceName", "flattened": false},
      "RoleArn": {"shape": "AmazonResourceName", "flattened": false},
      "State": {"shape": "MetricStreamState", "flattened": false},
      "CreationDate": {"shape": "Timestamp", "flattened": false},
      "LastUpdateDate": {"shape": "Timestamp", "flattened": false},
      "OutputFormat": {"shape": "MetricStreamOutputFormat", "flattened": false},
      "StatisticsConfigurations": {
        "shape": "MetricStreamStatisticsConfigurations",
        "flattened": false
      },
      "IncludeLinkedAccountsMetrics": {
        "shape": "IncludeLinkedAccountsMetrics",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetMetricWidgetImageInput": {
    "type": "structure",
    "members": {
      "MetricWidget": {"shape": "MetricWidget", "flattened": false},
      "OutputFormat": {"shape": "OutputFormat", "flattened": false}
    },
    "flattened": false
  },
  "GetMetricWidgetImageOutput": {
    "type": "structure",
    "members": {
      "MetricWidgetImage": {"shape": "MetricWidgetImage", "flattened": false}
    },
    "flattened": false
  },
  "HistoryData": {"type": "string", "flattened": false},
  "HistoryItemType": {"type": "string", "flattened": false},
  "HistorySummary": {"type": "string", "flattened": false},
  "IncludeLinkedAccounts": {"type": "boolean", "flattened": false},
  "IncludeLinkedAccountsMetrics": {"type": "boolean", "flattened": false},
  "InsightRule": {
    "type": "structure",
    "members": {
      "Name": {"shape": "InsightRuleName", "flattened": false},
      "State": {"shape": "InsightRuleState", "flattened": false},
      "Schema": {"shape": "InsightRuleSchema", "flattened": false},
      "Definition": {"shape": "InsightRuleDefinition", "flattened": false},
      "ManagedRule": {"shape": "InsightRuleIsManaged", "flattened": false}
    },
    "flattened": false
  },
  "InsightRuleAggregationStatistic": {"type": "string", "flattened": false},
  "InsightRuleContributor": {
    "type": "structure",
    "members": {
      "Keys": {"shape": "InsightRuleContributorKeys", "flattened": false},
      "ApproximateAggregateValue": {
        "shape": "InsightRuleUnboundDouble",
        "flattened": false
      },
      "Datapoints": {
        "shape": "InsightRuleContributorDatapoints",
        "flattened": false
      }
    },
    "flattened": false
  },
  "InsightRuleContributorDatapoint": {
    "type": "structure",
    "members": {
      "Timestamp": {"shape": "Timestamp", "flattened": false},
      "ApproximateValue": {
        "shape": "InsightRuleUnboundDouble",
        "flattened": false
      }
    },
    "flattened": false
  },
  "InsightRuleContributorDatapoints": {
    "type": "list",
    "member": {"shape": "InsightRuleContributorDatapoint"},
    "flattened": false
  },
  "InsightRuleContributorKey": {"type": "string", "flattened": false},
  "InsightRuleContributorKeyLabel": {"type": "string", "flattened": false},
  "InsightRuleContributorKeyLabels": {
    "type": "list",
    "member": {"shape": "InsightRuleContributorKeyLabel"},
    "flattened": false
  },
  "InsightRuleContributorKeys": {
    "type": "list",
    "member": {"shape": "InsightRuleContributorKey"},
    "flattened": false
  },
  "InsightRuleContributors": {
    "type": "list",
    "member": {"shape": "InsightRuleContributor"},
    "flattened": false
  },
  "InsightRuleDefinition": {"type": "string", "flattened": false},
  "InsightRuleIsManaged": {"type": "boolean", "flattened": false},
  "InsightRuleMaxResults": {"type": "integer", "flattened": false},
  "InsightRuleMetricDatapoint": {
    "type": "structure",
    "members": {
      "Timestamp": {"shape": "Timestamp", "flattened": false},
      "UniqueContributors": {
        "shape": "InsightRuleUnboundDouble",
        "flattened": false
      },
      "MaxContributorValue": {
        "shape": "InsightRuleUnboundDouble",
        "flattened": false
      },
      "SampleCount": {"shape": "InsightRuleUnboundDouble", "flattened": false},
      "Average": {"shape": "InsightRuleUnboundDouble", "flattened": false},
      "Sum": {"shape": "InsightRuleUnboundDouble", "flattened": false},
      "Minimum": {"shape": "InsightRuleUnboundDouble", "flattened": false},
      "Maximum": {"shape": "InsightRuleUnboundDouble", "flattened": false}
    },
    "flattened": false
  },
  "InsightRuleMetricDatapoints": {
    "type": "list",
    "member": {"shape": "InsightRuleMetricDatapoint"},
    "flattened": false
  },
  "InsightRuleMetricList": {
    "type": "list",
    "member": {"shape": "InsightRuleMetricName"},
    "flattened": false
  },
  "InsightRuleMetricName": {"type": "string", "flattened": false},
  "InsightRuleName": {"type": "string", "flattened": false},
  "InsightRuleNames": {
    "type": "list",
    "member": {"shape": "InsightRuleName"},
    "flattened": false
  },
  "InsightRuleOrderBy": {"type": "string", "flattened": false},
  "InsightRuleSchema": {"type": "string", "flattened": false},
  "InsightRuleState": {"type": "string", "flattened": false},
  "InsightRuleUnboundDouble": {"type": "double", "flattened": false},
  "InsightRuleUnboundInteger": {"type": "integer", "flattened": false},
  "InsightRuleUnboundLong": {"type": "long", "flattened": false},
  "InsightRules": {
    "type": "list",
    "member": {"shape": "InsightRule"},
    "flattened": false
  },
  "LabelOptions": {
    "type": "structure",
    "members": {
      "Timezone": {"shape": "GetMetricDataLabelTimezone", "flattened": false}
    },
    "flattened": false
  },
  "LastModified": {"type": "timestamp", "flattened": false},
  "ListDashboardsInput": {
    "type": "structure",
    "members": {
      "DashboardNamePrefix": {
        "shape": "DashboardNamePrefix",
        "flattened": false
      },
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListDashboardsOutput": {
    "type": "structure",
    "members": {
      "DashboardEntries": {"shape": "DashboardEntries", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListManagedInsightRulesInput": {
    "type": "structure",
    "members": {
      "ResourceARN": {"shape": "AmazonResourceName", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false},
      "MaxResults": {"shape": "InsightRuleMaxResults", "flattened": false}
    },
    "flattened": false
  },
  "ListManagedInsightRulesOutput": {
    "type": "structure",
    "members": {
      "ManagedRules": {"shape": "ManagedRuleDescriptions", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListMetricStreamsInput": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "NextToken", "flattened": false},
      "MaxResults": {"shape": "ListMetricStreamsMaxResults", "flattened": false}
    },
    "flattened": false
  },
  "ListMetricStreamsMaxResults": {"type": "integer", "flattened": false},
  "ListMetricStreamsOutput": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "NextToken", "flattened": false},
      "Entries": {"shape": "MetricStreamEntries", "flattened": false}
    },
    "flattened": false
  },
  "ListMetricsInput": {
    "type": "structure",
    "members": {
      "Namespace": {"shape": "Namespace", "flattened": false},
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Dimensions": {"shape": "DimensionFilters", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false},
      "RecentlyActive": {"shape": "RecentlyActive", "flattened": false},
      "IncludeLinkedAccounts": {
        "shape": "IncludeLinkedAccounts",
        "flattened": false
      },
      "OwningAccount": {"shape": "AccountId", "flattened": false}
    },
    "flattened": false
  },
  "ListMetricsOutput": {
    "type": "structure",
    "members": {
      "Metrics": {"shape": "Metrics", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false},
      "OwningAccounts": {"shape": "OwningAccounts", "flattened": false}
    },
    "flattened": false
  },
  "ListTagsForResourceInput": {
    "type": "structure",
    "members": {
      "ResourceARN": {"shape": "AmazonResourceName", "flattened": false}
    },
    "flattened": false
  },
  "ListTagsForResourceOutput": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "ManagedRule": {
    "type": "structure",
    "members": {
      "TemplateName": {"shape": "TemplateName", "flattened": false},
      "ResourceARN": {"shape": "AmazonResourceName", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "ManagedRuleDescription": {
    "type": "structure",
    "members": {
      "TemplateName": {"shape": "TemplateName", "flattened": false},
      "ResourceARN": {"shape": "AmazonResourceName", "flattened": false},
      "RuleState": {"shape": "ManagedRuleState", "flattened": false}
    },
    "flattened": false
  },
  "ManagedRuleDescriptions": {
    "type": "list",
    "member": {"shape": "ManagedRuleDescription"},
    "flattened": false
  },
  "ManagedRuleState": {
    "type": "structure",
    "members": {
      "RuleName": {"shape": "InsightRuleName", "flattened": false},
      "State": {"shape": "InsightRuleState", "flattened": false}
    },
    "flattened": false
  },
  "ManagedRules": {
    "type": "list",
    "member": {"shape": "ManagedRule"},
    "flattened": false
  },
  "MaxRecords": {"type": "integer", "flattened": false},
  "MaxReturnedResultsCount": {"type": "integer", "flattened": false},
  "Message": {"type": "string", "flattened": false},
  "MessageData": {
    "type": "structure",
    "members": {
      "Code": {"shape": "MessageDataCode", "flattened": false},
      "Value": {"shape": "MessageDataValue", "flattened": false}
    },
    "flattened": false
  },
  "MessageDataCode": {"type": "string", "flattened": false},
  "MessageDataValue": {"type": "string", "flattened": false},
  "Metric": {
    "type": "structure",
    "members": {
      "Namespace": {"shape": "Namespace", "flattened": false},
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Dimensions": {"shape": "Dimensions", "flattened": false}
    },
    "flattened": false
  },
  "MetricAlarm": {
    "type": "structure",
    "members": {
      "AlarmName": {"shape": "AlarmName", "flattened": false},
      "AlarmArn": {"shape": "AlarmArn", "flattened": false},
      "AlarmDescription": {"shape": "AlarmDescription", "flattened": false},
      "AlarmConfigurationUpdatedTimestamp": {
        "shape": "Timestamp",
        "flattened": false
      },
      "ActionsEnabled": {"shape": "ActionsEnabled", "flattened": false},
      "OKActions": {"shape": "ResourceList", "flattened": false},
      "AlarmActions": {"shape": "ResourceList", "flattened": false},
      "InsufficientDataActions": {"shape": "ResourceList", "flattened": false},
      "StateValue": {"shape": "StateValue", "flattened": false},
      "StateReason": {"shape": "StateReason", "flattened": false},
      "StateReasonData": {"shape": "StateReasonData", "flattened": false},
      "StateUpdatedTimestamp": {"shape": "Timestamp", "flattened": false},
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Namespace": {"shape": "Namespace", "flattened": false},
      "Statistic": {"shape": "Statistic", "flattened": false},
      "ExtendedStatistic": {"shape": "ExtendedStatistic", "flattened": false},
      "Dimensions": {"shape": "Dimensions", "flattened": false},
      "Period": {"shape": "Period", "flattened": false},
      "Unit": {"shape": "StandardUnit", "flattened": false},
      "EvaluationPeriods": {"shape": "EvaluationPeriods", "flattened": false},
      "DatapointsToAlarm": {"shape": "DatapointsToAlarm", "flattened": false},
      "Threshold": {"shape": "Threshold", "flattened": false},
      "ComparisonOperator": {"shape": "ComparisonOperator", "flattened": false},
      "TreatMissingData": {"shape": "TreatMissingData", "flattened": false},
      "EvaluateLowSampleCountPercentile": {
        "shape": "EvaluateLowSampleCountPercentile",
        "flattened": false
      },
      "Metrics": {"shape": "MetricDataQueries", "flattened": false},
      "ThresholdMetricId": {"shape": "MetricId", "flattened": false},
      "EvaluationState": {"shape": "EvaluationState", "flattened": false},
      "StateTransitionedTimestamp": {"shape": "Timestamp", "flattened": false}
    },
    "flattened": false
  },
  "MetricAlarms": {
    "type": "list",
    "member": {"shape": "MetricAlarm"},
    "flattened": false
  },
  "MetricCharacteristics": {
    "type": "structure",
    "members": {
      "PeriodicSpikes": {"shape": "PeriodicSpikes", "flattened": false}
    },
    "flattened": false
  },
  "MetricData": {
    "type": "list",
    "member": {"shape": "MetricDatum"},
    "flattened": false
  },
  "MetricDataQueries": {
    "type": "list",
    "member": {"shape": "MetricDataQuery"},
    "flattened": false
  },
  "MetricDataQuery": {
    "type": "structure",
    "members": {
      "Id": {"shape": "MetricId", "flattened": false},
      "MetricStat": {"shape": "MetricStat", "flattened": false},
      "Expression": {"shape": "MetricExpression", "flattened": false},
      "Label": {"shape": "MetricLabel", "flattened": false},
      "ReturnData": {"shape": "ReturnData", "flattened": false},
      "Period": {"shape": "Period", "flattened": false},
      "AccountId": {"shape": "AccountId", "flattened": false}
    },
    "flattened": false
  },
  "MetricDataResult": {
    "type": "structure",
    "members": {
      "Id": {"shape": "MetricId", "flattened": false},
      "Label": {"shape": "MetricLabel", "flattened": false},
      "Timestamps": {"shape": "Timestamps", "flattened": false},
      "Values": {"shape": "DatapointValues", "flattened": false},
      "StatusCode": {"shape": "StatusCode", "flattened": false},
      "Messages": {"shape": "MetricDataResultMessages", "flattened": false}
    },
    "flattened": false
  },
  "MetricDataResultMessages": {
    "type": "list",
    "member": {"shape": "MessageData"},
    "flattened": false
  },
  "MetricDataResults": {
    "type": "list",
    "member": {"shape": "MetricDataResult"},
    "flattened": false
  },
  "MetricDatum": {
    "type": "structure",
    "members": {
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Dimensions": {"shape": "Dimensions", "flattened": false},
      "Timestamp": {"shape": "Timestamp", "flattened": false},
      "Value": {"shape": "DatapointValue", "flattened": false},
      "StatisticValues": {"shape": "StatisticSet", "flattened": false},
      "Values": {"shape": "Values", "flattened": false},
      "Counts": {"shape": "Counts", "flattened": false},
      "Unit": {"shape": "StandardUnit", "flattened": false},
      "StorageResolution": {"shape": "StorageResolution", "flattened": false}
    },
    "flattened": false
  },
  "MetricExpression": {"type": "string", "flattened": false},
  "MetricId": {"type": "string", "flattened": false},
  "MetricLabel": {"type": "string", "flattened": false},
  "MetricMathAnomalyDetector": {
    "type": "structure",
    "members": {
      "MetricDataQueries": {"shape": "MetricDataQueries", "flattened": false}
    },
    "flattened": false
  },
  "MetricName": {"type": "string", "flattened": false},
  "MetricStat": {
    "type": "structure",
    "members": {
      "Metric": {"shape": "Metric", "flattened": false},
      "Period": {"shape": "Period", "flattened": false},
      "Stat": {"shape": "Stat", "flattened": false},
      "Unit": {"shape": "StandardUnit", "flattened": false}
    },
    "flattened": false
  },
  "MetricStreamEntries": {
    "type": "list",
    "member": {"shape": "MetricStreamEntry"},
    "flattened": false
  },
  "MetricStreamEntry": {
    "type": "structure",
    "members": {
      "Arn": {"shape": "AmazonResourceName", "flattened": false},
      "CreationDate": {"shape": "Timestamp", "flattened": false},
      "LastUpdateDate": {"shape": "Timestamp", "flattened": false},
      "Name": {"shape": "MetricStreamName", "flattened": false},
      "FirehoseArn": {"shape": "AmazonResourceName", "flattened": false},
      "State": {"shape": "MetricStreamState", "flattened": false},
      "OutputFormat": {"shape": "MetricStreamOutputFormat", "flattened": false}
    },
    "flattened": false
  },
  "MetricStreamFilter": {
    "type": "structure",
    "members": {
      "Namespace": {"shape": "Namespace", "flattened": false},
      "MetricNames": {
        "shape": "MetricStreamFilterMetricNames",
        "flattened": false
      }
    },
    "flattened": false
  },
  "MetricStreamFilterMetricNames": {
    "type": "list",
    "member": {"shape": "MetricName"},
    "flattened": false
  },
  "MetricStreamFilters": {
    "type": "list",
    "member": {"shape": "MetricStreamFilter"},
    "flattened": false
  },
  "MetricStreamName": {"type": "string", "flattened": false},
  "MetricStreamNames": {
    "type": "list",
    "member": {"shape": "MetricStreamName"},
    "flattened": false
  },
  "MetricStreamOutputFormat": {"type": "string", "flattened": false},
  "MetricStreamState": {"type": "string", "flattened": false},
  "MetricStreamStatistic": {"type": "string", "flattened": false},
  "MetricStreamStatisticsAdditionalStatistics": {
    "type": "list",
    "member": {"shape": "MetricStreamStatistic"},
    "flattened": false
  },
  "MetricStreamStatisticsConfiguration": {
    "type": "structure",
    "members": {
      "IncludeMetrics": {
        "shape": "MetricStreamStatisticsIncludeMetrics",
        "flattened": false
      },
      "AdditionalStatistics": {
        "shape": "MetricStreamStatisticsAdditionalStatistics",
        "flattened": false
      }
    },
    "flattened": false
  },
  "MetricStreamStatisticsConfigurations": {
    "type": "list",
    "member": {"shape": "MetricStreamStatisticsConfiguration"},
    "flattened": false
  },
  "MetricStreamStatisticsIncludeMetrics": {
    "type": "list",
    "member": {"shape": "MetricStreamStatisticsMetric"},
    "flattened": false
  },
  "MetricStreamStatisticsMetric": {
    "type": "structure",
    "members": {
      "Namespace": {"shape": "Namespace", "flattened": false},
      "MetricName": {"shape": "MetricName", "flattened": false}
    },
    "flattened": false
  },
  "MetricWidget": {"type": "string", "flattened": false},
  "MetricWidgetImage": {"type": "blob", "flattened": false},
  "Metrics": {
    "type": "list",
    "member": {"shape": "Metric"},
    "flattened": false
  },
  "Namespace": {"type": "string", "flattened": false},
  "NextToken": {"type": "string", "flattened": false},
  "OutputFormat": {"type": "string", "flattened": false},
  "OwningAccounts": {
    "type": "list",
    "member": {"shape": "AccountId"},
    "flattened": false
  },
  "PartialFailure": {
    "type": "structure",
    "members": {
      "FailureResource": {"shape": "FailureResource", "flattened": false},
      "ExceptionType": {"shape": "ExceptionType", "flattened": false},
      "FailureCode": {"shape": "FailureCode", "flattened": false},
      "FailureDescription": {"shape": "FailureDescription", "flattened": false}
    },
    "flattened": false
  },
  "Period": {"type": "integer", "flattened": false},
  "PeriodicSpikes": {"type": "boolean", "flattened": false},
  "PutAnomalyDetectorInput": {
    "type": "structure",
    "members": {
      "Namespace": {"shape": "Namespace", "flattened": false},
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Dimensions": {"shape": "Dimensions", "flattened": false},
      "Stat": {"shape": "AnomalyDetectorMetricStat", "flattened": false},
      "Configuration": {
        "shape": "AnomalyDetectorConfiguration",
        "flattened": false
      },
      "MetricCharacteristics": {
        "shape": "MetricCharacteristics",
        "flattened": false
      },
      "SingleMetricAnomalyDetector": {
        "shape": "SingleMetricAnomalyDetector",
        "flattened": false
      },
      "MetricMathAnomalyDetector": {
        "shape": "MetricMathAnomalyDetector",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PutAnomalyDetectorOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "PutCompositeAlarmInput": {
    "type": "structure",
    "members": {
      "ActionsEnabled": {"shape": "ActionsEnabled", "flattened": false},
      "AlarmActions": {"shape": "ResourceList", "flattened": false},
      "AlarmDescription": {"shape": "AlarmDescription", "flattened": false},
      "AlarmName": {"shape": "AlarmName", "flattened": false},
      "AlarmRule": {"shape": "AlarmRule", "flattened": false},
      "InsufficientDataActions": {"shape": "ResourceList", "flattened": false},
      "OKActions": {"shape": "ResourceList", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "ActionsSuppressor": {"shape": "AlarmArn", "flattened": false},
      "ActionsSuppressorWaitPeriod": {
        "shape": "SuppressorPeriod",
        "flattened": false
      },
      "ActionsSuppressorExtensionPeriod": {
        "shape": "SuppressorPeriod",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PutDashboardInput": {
    "type": "structure",
    "members": {
      "DashboardName": {"shape": "DashboardName", "flattened": false},
      "DashboardBody": {"shape": "DashboardBody", "flattened": false}
    },
    "flattened": false
  },
  "PutDashboardOutput": {
    "type": "structure",
    "members": {
      "DashboardValidationMessages": {
        "shape": "DashboardValidationMessages",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PutInsightRuleInput": {
    "type": "structure",
    "members": {
      "RuleName": {"shape": "InsightRuleName", "flattened": false},
      "RuleState": {"shape": "InsightRuleState", "flattened": false},
      "RuleDefinition": {"shape": "InsightRuleDefinition", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "PutInsightRuleOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "PutManagedInsightRulesInput": {
    "type": "structure",
    "members": {
      "ManagedRules": {"shape": "ManagedRules", "flattened": false}
    },
    "flattened": false
  },
  "PutManagedInsightRulesOutput": {
    "type": "structure",
    "members": {
      "Failures": {"shape": "BatchFailures", "flattened": false}
    },
    "flattened": false
  },
  "PutMetricAlarmInput": {
    "type": "structure",
    "members": {
      "AlarmName": {"shape": "AlarmName", "flattened": false},
      "AlarmDescription": {"shape": "AlarmDescription", "flattened": false},
      "ActionsEnabled": {"shape": "ActionsEnabled", "flattened": false},
      "OKActions": {"shape": "ResourceList", "flattened": false},
      "AlarmActions": {"shape": "ResourceList", "flattened": false},
      "InsufficientDataActions": {"shape": "ResourceList", "flattened": false},
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Namespace": {"shape": "Namespace", "flattened": false},
      "Statistic": {"shape": "Statistic", "flattened": false},
      "ExtendedStatistic": {"shape": "ExtendedStatistic", "flattened": false},
      "Dimensions": {"shape": "Dimensions", "flattened": false},
      "Period": {"shape": "Period", "flattened": false},
      "Unit": {"shape": "StandardUnit", "flattened": false},
      "EvaluationPeriods": {"shape": "EvaluationPeriods", "flattened": false},
      "DatapointsToAlarm": {"shape": "DatapointsToAlarm", "flattened": false},
      "Threshold": {"shape": "Threshold", "flattened": false},
      "ComparisonOperator": {"shape": "ComparisonOperator", "flattened": false},
      "TreatMissingData": {"shape": "TreatMissingData", "flattened": false},
      "EvaluateLowSampleCountPercentile": {
        "shape": "EvaluateLowSampleCountPercentile",
        "flattened": false
      },
      "Metrics": {"shape": "MetricDataQueries", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "ThresholdMetricId": {"shape": "MetricId", "flattened": false}
    },
    "flattened": false
  },
  "PutMetricDataInput": {
    "type": "structure",
    "members": {
      "Namespace": {"shape": "Namespace", "flattened": false},
      "MetricData": {"shape": "MetricData", "flattened": false}
    },
    "flattened": false
  },
  "PutMetricStreamInput": {
    "type": "structure",
    "members": {
      "Name": {"shape": "MetricStreamName", "flattened": false},
      "IncludeFilters": {"shape": "MetricStreamFilters", "flattened": false},
      "ExcludeFilters": {"shape": "MetricStreamFilters", "flattened": false},
      "FirehoseArn": {"shape": "AmazonResourceName", "flattened": false},
      "RoleArn": {"shape": "AmazonResourceName", "flattened": false},
      "OutputFormat": {"shape": "MetricStreamOutputFormat", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "StatisticsConfigurations": {
        "shape": "MetricStreamStatisticsConfigurations",
        "flattened": false
      },
      "IncludeLinkedAccountsMetrics": {
        "shape": "IncludeLinkedAccountsMetrics",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PutMetricStreamOutput": {
    "type": "structure",
    "members": {
      "Arn": {"shape": "AmazonResourceName", "flattened": false}
    },
    "flattened": false
  },
  "Range": {
    "type": "structure",
    "members": {
      "StartTime": {"shape": "Timestamp", "flattened": false},
      "EndTime": {"shape": "Timestamp", "flattened": false}
    },
    "flattened": false
  },
  "RecentlyActive": {"type": "string", "flattened": false},
  "ResourceList": {
    "type": "list",
    "member": {"shape": "ResourceName"},
    "flattened": false
  },
  "ResourceName": {"type": "string", "flattened": false},
  "ReturnData": {"type": "boolean", "flattened": false},
  "ScanBy": {"type": "string", "flattened": false},
  "SetAlarmStateInput": {
    "type": "structure",
    "members": {
      "AlarmName": {"shape": "AlarmName", "flattened": false},
      "StateValue": {"shape": "StateValue", "flattened": false},
      "StateReason": {"shape": "StateReason", "flattened": false},
      "StateReasonData": {"shape": "StateReasonData", "flattened": false}
    },
    "flattened": false
  },
  "SingleMetricAnomalyDetector": {
    "type": "structure",
    "members": {
      "AccountId": {"shape": "AccountId", "flattened": false},
      "Namespace": {"shape": "Namespace", "flattened": false},
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Dimensions": {"shape": "Dimensions", "flattened": false},
      "Stat": {"shape": "AnomalyDetectorMetricStat", "flattened": false}
    },
    "flattened": false
  },
  "Size": {"type": "long", "flattened": false},
  "StandardUnit": {"type": "string", "flattened": false},
  "StartMetricStreamsInput": {
    "type": "structure",
    "members": {
      "Names": {"shape": "MetricStreamNames", "flattened": false}
    },
    "flattened": false
  },
  "StartMetricStreamsOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "Stat": {"type": "string", "flattened": false},
  "StateReason": {"type": "string", "flattened": false},
  "StateReasonData": {"type": "string", "flattened": false},
  "StateValue": {"type": "string", "flattened": false},
  "Statistic": {"type": "string", "flattened": false},
  "StatisticSet": {
    "type": "structure",
    "members": {
      "SampleCount": {"shape": "DatapointValue", "flattened": false},
      "Sum": {"shape": "DatapointValue", "flattened": false},
      "Minimum": {"shape": "DatapointValue", "flattened": false},
      "Maximum": {"shape": "DatapointValue", "flattened": false}
    },
    "flattened": false
  },
  "Statistics": {
    "type": "list",
    "member": {"shape": "Statistic"},
    "flattened": false
  },
  "StatusCode": {"type": "string", "flattened": false},
  "StopMetricStreamsInput": {
    "type": "structure",
    "members": {
      "Names": {"shape": "MetricStreamNames", "flattened": false}
    },
    "flattened": false
  },
  "StopMetricStreamsOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "StorageResolution": {"type": "integer", "flattened": false},
  "SuppressorPeriod": {"type": "integer", "flattened": false},
  "Tag": {
    "type": "structure",
    "members": {
      "Key": {"shape": "TagKey", "flattened": false},
      "Value": {"shape": "TagValue", "flattened": false}
    },
    "flattened": false
  },
  "TagKey": {"type": "string", "flattened": false},
  "TagKeyList": {
    "type": "list",
    "member": {"shape": "TagKey"},
    "flattened": false
  },
  "TagList": {
    "type": "list",
    "member": {"shape": "Tag"},
    "flattened": false
  },
  "TagResourceInput": {
    "type": "structure",
    "members": {
      "ResourceARN": {"shape": "AmazonResourceName", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "TagResourceOutput": {"type": "structure", "members": {}, "flattened": false},
  "TagValue": {"type": "string", "flattened": false},
  "TemplateName": {"type": "string", "flattened": false},
  "Threshold": {"type": "double", "flattened": false},
  "Timestamp": {"type": "timestamp", "flattened": false},
  "Timestamps": {
    "type": "list",
    "member": {"shape": "Timestamp"},
    "flattened": false
  },
  "TreatMissingData": {"type": "string", "flattened": false},
  "UntagResourceInput": {
    "type": "structure",
    "members": {
      "ResourceARN": {"shape": "AmazonResourceName", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false}
    },
    "flattened": false
  },
  "UntagResourceOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "Values": {
    "type": "list",
    "member": {"shape": "DatapointValue"},
    "flattened": false
  }
};

// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "APIVersion": {"type": "string", "flattened": false},
  "Artifact": {
    "type": "structure",
    "members": {
      "Description": {"shape": "Description", "flattened": false},
      "URL": {"shape": "URL", "flattened": false}
    },
    "flattened": false
  },
  "ArtifactList": {
    "type": "list",
    "member": {"shape": "Artifact"},
    "flattened": false
  },
  "BucketPermissionException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "CancelJobInput": {
    "type": "structure",
    "members": {
      "JobId": {"shape": "JobId", "flattened": false},
      "APIVersion": {"shape": "APIVersion", "flattened": false}
    },
    "flattened": false
  },
  "CancelJobOutput": {
    "type": "structure",
    "members": {
      "Success": {"shape": "Success", "flattened": false}
    },
    "flattened": false
  },
  "CanceledJobIdException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "Carrier": {"type": "string", "flattened": false},
  "CreateJobInput": {
    "type": "structure",
    "members": {
      "JobType": {"shape": "JobType", "flattened": false},
      "Manifest": {"shape": "Manifest", "flattened": false},
      "ManifestAddendum": {"shape": "ManifestAddendum", "flattened": false},
      "ValidateOnly": {"shape": "ValidateOnly", "flattened": false},
      "APIVersion": {"shape": "APIVersion", "flattened": false}
    },
    "flattened": false
  },
  "CreateJobOutput": {
    "type": "structure",
    "members": {
      "JobId": {"shape": "JobId", "flattened": false},
      "JobType": {"shape": "JobType", "flattened": false},
      "Signature": {"shape": "Signature", "flattened": false},
      "SignatureFileContents": {
        "shape": "SignatureFileContents",
        "flattened": false
      },
      "WarningMessage": {"shape": "WarningMessage", "flattened": false},
      "ArtifactList": {"shape": "ArtifactList", "flattened": false}
    },
    "flattened": false
  },
  "CreateJobQuotaExceededException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "CreationDate": {"type": "timestamp", "flattened": false},
  "CurrentManifest": {"type": "string", "flattened": false},
  "Description": {"type": "string", "flattened": false},
  "ErrorCount": {"type": "integer", "flattened": false},
  "ErrorMessage": {"type": "string", "flattened": false},
  "ExpiredJobIdException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "GenericString": {"type": "string", "flattened": false},
  "GetShippingLabelInput": {
    "type": "structure",
    "members": {
      "jobIds": {"shape": "JobIdList", "flattened": false},
      "name": {"shape": "name", "flattened": false},
      "company": {"shape": "company", "flattened": false},
      "phoneNumber": {"shape": "phoneNumber", "flattened": false},
      "country": {"shape": "country", "flattened": false},
      "stateOrProvince": {"shape": "stateOrProvince", "flattened": false},
      "city": {"shape": "city", "flattened": false},
      "postalCode": {"shape": "postalCode", "flattened": false},
      "street1": {"shape": "street1", "flattened": false},
      "street2": {"shape": "street2", "flattened": false},
      "street3": {"shape": "street3", "flattened": false},
      "APIVersion": {"shape": "APIVersion", "flattened": false}
    },
    "flattened": false
  },
  "GetShippingLabelOutput": {
    "type": "structure",
    "members": {
      "ShippingLabelURL": {"shape": "GenericString", "flattened": false},
      "Warning": {"shape": "GenericString", "flattened": false}
    },
    "flattened": false
  },
  "GetStatusInput": {
    "type": "structure",
    "members": {
      "JobId": {"shape": "JobId", "flattened": false},
      "APIVersion": {"shape": "APIVersion", "flattened": false}
    },
    "flattened": false
  },
  "GetStatusOutput": {
    "type": "structure",
    "members": {
      "JobId": {"shape": "JobId", "flattened": false},
      "JobType": {"shape": "JobType", "flattened": false},
      "LocationCode": {"shape": "LocationCode", "flattened": false},
      "LocationMessage": {"shape": "LocationMessage", "flattened": false},
      "ProgressCode": {"shape": "ProgressCode", "flattened": false},
      "ProgressMessage": {"shape": "ProgressMessage", "flattened": false},
      "Carrier": {"shape": "Carrier", "flattened": false},
      "TrackingNumber": {"shape": "TrackingNumber", "flattened": false},
      "LogBucket": {"shape": "LogBucket", "flattened": false},
      "LogKey": {"shape": "LogKey", "flattened": false},
      "ErrorCount": {"shape": "ErrorCount", "flattened": false},
      "Signature": {"shape": "Signature", "flattened": false},
      "SignatureFileContents": {"shape": "Signature", "flattened": false},
      "CurrentManifest": {"shape": "CurrentManifest", "flattened": false},
      "CreationDate": {"shape": "CreationDate", "flattened": false},
      "ArtifactList": {"shape": "ArtifactList", "flattened": false}
    },
    "flattened": false
  },
  "InvalidAccessKeyIdException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "InvalidAddressException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "InvalidCustomsException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "InvalidFileSystemException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "InvalidJobIdException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "InvalidManifestFieldException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "InvalidParameterException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "InvalidVersionException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "IsCanceled": {"type": "boolean", "flattened": false},
  "IsTruncated": {"type": "boolean", "flattened": false},
  "Job": {
    "type": "structure",
    "members": {
      "JobId": {"shape": "JobId", "flattened": false},
      "CreationDate": {"shape": "CreationDate", "flattened": false},
      "IsCanceled": {"shape": "IsCanceled", "flattened": false},
      "JobType": {"shape": "JobType", "flattened": false}
    },
    "flattened": false
  },
  "JobId": {"type": "string", "flattened": false},
  "JobIdList": {
    "type": "list",
    "member": {"shape": "GenericString"},
    "flattened": false
  },
  "JobType": {"type": "string", "flattened": false},
  "JobsList": {
    "type": "list",
    "member": {"shape": "Job"},
    "flattened": false
  },
  "ListJobsInput": {
    "type": "structure",
    "members": {
      "MaxJobs": {"shape": "MaxJobs", "flattened": false},
      "Marker": {"shape": "Marker", "flattened": false},
      "APIVersion": {"shape": "APIVersion", "flattened": false}
    },
    "flattened": false
  },
  "ListJobsOutput": {
    "type": "structure",
    "members": {
      "Jobs": {"shape": "JobsList", "flattened": false},
      "IsTruncated": {"shape": "IsTruncated", "flattened": false}
    },
    "flattened": false
  },
  "LocationCode": {"type": "string", "flattened": false},
  "LocationMessage": {"type": "string", "flattened": false},
  "LogBucket": {"type": "string", "flattened": false},
  "LogKey": {"type": "string", "flattened": false},
  "MalformedManifestException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "Manifest": {"type": "string", "flattened": false},
  "ManifestAddendum": {"type": "string", "flattened": false},
  "Marker": {"type": "string", "flattened": false},
  "MaxJobs": {"type": "integer", "flattened": false},
  "MissingCustomsException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "MissingManifestFieldException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "MissingParameterException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "MultipleRegionsException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "NoSuchBucketException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "ProgressCode": {"type": "string", "flattened": false},
  "ProgressMessage": {"type": "string", "flattened": false},
  "Signature": {"type": "string", "flattened": false},
  "SignatureFileContents": {"type": "string", "flattened": false},
  "Success": {"type": "boolean", "flattened": false},
  "TrackingNumber": {"type": "string", "flattened": false},
  "URL": {"type": "string", "flattened": false},
  "UnableToCancelJobIdException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "UnableToUpdateJobIdException": {
    "type": "structure",
    "members": {
      "message": {"shape": "ErrorMessage", "flattened": false}
    },
    "flattened": false
  },
  "UpdateJobInput": {
    "type": "structure",
    "members": {
      "JobId": {"shape": "JobId", "flattened": false},
      "Manifest": {"shape": "Manifest", "flattened": false},
      "JobType": {"shape": "JobType", "flattened": false},
      "ValidateOnly": {"shape": "ValidateOnly", "flattened": false},
      "APIVersion": {"shape": "APIVersion", "flattened": false}
    },
    "flattened": false
  },
  "UpdateJobOutput": {
    "type": "structure",
    "members": {
      "Success": {"shape": "Success", "flattened": false},
      "WarningMessage": {"shape": "WarningMessage", "flattened": false},
      "ArtifactList": {"shape": "ArtifactList", "flattened": false}
    },
    "flattened": false
  },
  "ValidateOnly": {"type": "boolean", "flattened": false},
  "WarningMessage": {"type": "string", "flattened": false},
  "city": {"type": "string", "flattened": false},
  "company": {"type": "string", "flattened": false},
  "country": {"type": "string", "flattened": false},
  "name": {"type": "string", "flattened": false},
  "phoneNumber": {"type": "string", "flattened": false},
  "postalCode": {"type": "string", "flattened": false},
  "stateOrProvince": {"type": "string", "flattened": false},
  "street1": {"type": "string", "flattened": false},
  "street2": {"type": "string", "flattened": false},
  "street3": {"type": "string", "flattened": false}
};

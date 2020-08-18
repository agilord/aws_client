// ignore_for_file: prefer_single_quotes
final testSuites = [
  {
    "description": "Scalar members",
    "metadata": {
      "protocol": "json",
      "jsonVersion": "1.1",
      "targetPrefix": "com.amazonaws.foo"
    },
    "shapes": {
      "InputShape": {
        "type": "structure",
        "members": {
          "Name": {"shape": "StringType"}
        }
      },
      "StringType": {"type": "string"}
    },
    "cases": [
      {
        "given": {
          "input": {"shape": "InputShape"},
          "name": "OperationName",
          "http": {"method": "POST"}
        },
        "params": {"Name": "myname"},
        "serialized": {
          "body": "{\"Name\": \"myname\"}",
          "headers": {
            "X-Amz-Target": "com.amazonaws.foo.OperationName",
            "Content-Type": "application/x-amz-json-1.1"
          },
          "uri": "/"
        }
      }
    ]
  },
  {
    "description": "Recursive shapes",
    "metadata": {
      "protocol": "json",
      "jsonVersion": "1.1",
      "targetPrefix": "com.amazonaws.foo"
    },
    "shapes": {
      "InputShape": {
        "type": "structure",
        "members": {
          "RecursiveStruct": {"shape": "RecursiveStructType"}
        }
      },
      "RecursiveStructType": {
        "type": "structure",
        "members": {
          "NoRecurse": {"shape": "StringType"},
          "RecursiveStruct": {"shape": "RecursiveStructType"},
          "RecursiveList": {"shape": "RecursiveListType"},
          "RecursiveMap": {"shape": "RecursiveMapType"}
        }
      },
      "RecursiveListType": {
        "type": "list",
        "member": {"shape": "RecursiveStructType"}
      },
      "RecursiveMapType": {
        "type": "map",
        "key": {"shape": "StringType"},
        "value": {"shape": "RecursiveStructType"}
      },
      "StringType": {"type": "string"}
    },
    "cases": [
      {
        "given": {
          "input": {"shape": "InputShape"},
          "name": "OperationName"
        },
        "params": {
          "RecursiveStruct": {"NoRecurse": "foo"}
        },
        "serialized": {
          "uri": "/",
          "headers": {
            "X-Amz-Target": "com.amazonaws.foo.OperationName",
            "Content-Type": "application/x-amz-json-1.1"
          },
          "body": "{\"RecursiveStruct\": {\"NoRecurse\": \"foo\"}}"
        }
      },
      {
        "given": {
          "input": {"shape": "InputShape"},
          "name": "OperationName"
        },
        "params": {
          "RecursiveStruct": {
            "RecursiveStruct": {"NoRecurse": "foo"}
          }
        },
        "serialized": {
          "uri": "/",
          "headers": {
            "X-Amz-Target": "com.amazonaws.foo.OperationName",
            "Content-Type": "application/x-amz-json-1.1"
          },
          "body":
              "{\"RecursiveStruct\": {\"RecursiveStruct\": {\"NoRecurse\": \"foo\"}}}"
        }
      },
      {
        "given": {
          "input": {"shape": "InputShape"},
          "name": "OperationName"
        },
        "params": {
          "RecursiveStruct": {
            "RecursiveStruct": {
              "RecursiveStruct": {
                "RecursiveStruct": {"NoRecurse": "foo"}
              }
            }
          }
        },
        "serialized": {
          "uri": "/",
          "headers": {
            "X-Amz-Target": "com.amazonaws.foo.OperationName",
            "Content-Type": "application/x-amz-json-1.1"
          },
          "body":
              "{\"RecursiveStruct\": {\"RecursiveStruct\": {\"RecursiveStruct\": {\"RecursiveStruct\": {\"NoRecurse\": \"foo\"}}}}}"
        }
      },
      {
        "given": {
          "input": {"shape": "InputShape"},
          "name": "OperationName"
        },
        "params": {
          "RecursiveStruct": {
            "RecursiveList": [
              {"NoRecurse": "foo"},
              {"NoRecurse": "bar"}
            ]
          }
        },
        "serialized": {
          "uri": "/",
          "headers": {
            "X-Amz-Target": "com.amazonaws.foo.OperationName",
            "Content-Type": "application/x-amz-json-1.1"
          },
          "body":
              "{\"RecursiveStruct\": {\"RecursiveList\": [{\"NoRecurse\": \"foo\"}, {\"NoRecurse\": \"bar\"}]}}"
        }
      },
      {
        "given": {
          "input": {"shape": "InputShape"},
          "name": "OperationName"
        },
        "params": {
          "RecursiveStruct": {
            "RecursiveList": [
              {"NoRecurse": "foo"},
              {
                "RecursiveStruct": {"NoRecurse": "bar"}
              }
            ]
          }
        },
        "serialized": {
          "uri": "/",
          "headers": {
            "X-Amz-Target": "com.amazonaws.foo.OperationName",
            "Content-Type": "application/x-amz-json-1.1"
          },
          "body":
              "{\"RecursiveStruct\": {\"RecursiveList\": [{\"NoRecurse\": \"foo\"}, {\"RecursiveStruct\": {\"NoRecurse\": \"bar\"}}]}}"
        }
      },
      {
        "given": {
          "input": {"shape": "InputShape"},
          "name": "OperationName"
        },
        "params": {
          "RecursiveStruct": {
            "RecursiveMap": {
              "foo": {"NoRecurse": "foo"},
              "bar": {"NoRecurse": "bar"}
            }
          }
        },
        "serialized": {
          "uri": "/",
          "headers": {
            "X-Amz-Target": "com.amazonaws.foo.OperationName",
            "Content-Type": "application/x-amz-json-1.1"
          },
          "body":
              "{\"RecursiveStruct\": {\"RecursiveMap\": {\"foo\": {\"NoRecurse\": \"foo\"}, \"bar\": {\"NoRecurse\": \"bar\"}}}}"
        }
      }
    ]
  },
  {
    "description": "Empty maps",
    "metadata": {
      "protocol": "json",
      "jsonVersion": "1.1",
      "targetPrefix": "com.amazonaws.foo"
    },
    "shapes": {
      "InputShape": {
        "type": "structure",
        "members": {
          "Map": {"shape": "MapType"}
        }
      },
      "MapType": {
        "type": "map",
        "key": {"shape": "StringType"},
        "value": {"shape": "StringType"}
      },
      "StringType": {"type": "string"}
    },
    "cases": [
      {
        "given": {
          "input": {"shape": "InputShape"},
          "name": "OperationName",
          "http": {"method": "POST"}
        },
        "params": {"Map": <String, String>{}},
        "serialized": {
          "body": "{\"Map\": {}}",
          "headers": {
            "X-Amz-Target": "com.amazonaws.foo.OperationName",
            "Content-Type": "application/x-amz-json-1.1"
          },
          "uri": "/"
        }
      }
    ]
  },
  {
    "description": "Idempotency token auto fill",
    "metadata": {"protocol": "json", "apiVersion": "2014-01-01"},
    "shapes": {
      "InputShape": {
        "type": "structure",
        "members": {
          "Token": {"shape": "StringType", "idempotencyToken": true}
        }
      },
      "StringType": {"type": "string"}
    },
    "cases": [
      {
        "given": {
          "input": {"shape": "InputShape"},
          "http": {"method": "POST"},
          "name": "OperationName"
        },
        "params": {"Token": "abc123"},
        "serialized": {
          "uri": "/",
          "headers": <String, String>{},
          "body": "{\"Token\": \"abc123\"}"
        }
      },
    ]
  },
  {
    "description": "Enum",
    "metadata": {"protocol": "json", "apiVersion": "2014-01-01"},
    "shapes": {
      "InputShape": {
        "type": "structure",
        "members": {
          "FooEnum": {"shape": "EnumType"},
          "ListEnums": {"shape": "EnumList"}
        }
      },
      "EnumType": {
        "type": "string",
        "enum": ["foo", "bar"]
      },
      "EnumList": {
        "type": "list",
        "member": {"shape": "EnumType"}
      }
    },
    "cases": [
      {
        "given": {
          "input": {"shape": "InputShape"},
          "http": {"method": "POST"},
          "name": "OperationName"
        },
        "params": {
          "FooEnum": "foo",
          "ListEnums": ["foo", "", "bar"]
        },
        "serialized": {
          "uri": "/",
          "headers": <String, String>{},
          "body":
              "{\"FooEnum\": \"foo\", \"ListEnums\": [\"foo\", \"\", \"bar\"]}"
        }
      },
      {
        "given": {
          "input": {"shape": "InputShape"},
          "http": {"method": "POST"},
          "name": "OperationName"
        },
        "params": <String, String>{},
        "serialized": {"uri": "/", "headers": <String, String>{}}
      }
    ]
  },
  {
    "description": "Endpoint host trait static prefix",
    "metadata": {
      "protocol": "json",
      "jsonVersion": "1.1",
      "targetPrefix": "com.amazonaws.foo"
    },
    "clientEndpoint": "https://service.region.amazonaws.com",
    "shapes": {
      "StaticInputShape": {
        "type": "structure",
        "members": {
          "Name": {"shape": "StringType"}
        }
      },
      "MemberRefInputShape": {
        "type": "structure",
        "members": {
          "Name": {"shape": "StringType", "hostLabel": true}
        }
      },
      "StringType": {"type": "string"}
    },
    "cases": [
      {
        "given": {
          "name": "StaticOp",
          "input": {"shape": "StaticInputShape"},
          "http": {"method": "POST"},
          "endpoint": {"hostPrefix": "data-"}
        },
        "params": {"Name": "myname"},
        "serialized": {
          "headers": {
            "X-Amz-Target": "com.amazonaws.foo.StaticOp",
            "Content-Type": "application/x-amz-json-1.1"
          },
          "uri": "/",
          "body": "{\"Name\": \"myname\"}",
          "host": "data-service.region.amazonaws.com"
        }
      },
      {
        "given": {
          "name": "MemberRefOp",
          "input": {"shape": "MemberRefInputShape"},
          "http": {"method": "POST"},
          "endpoint": {"hostPrefix": "foo-{Name}."}
        },
        "params": {"Name": "myname"},
        "serialized": {
          "headers": {
            "X-Amz-Target": "com.amazonaws.foo.MemberRefOp",
            "Content-Type": "application/x-amz-json-1.1"
          },
          "uri": "/",
          "body": "{\"Name\": \"myname\"}",
          "host": "foo-myname.service.region.amazonaws.com"
        }
      }
    ]
  }
];

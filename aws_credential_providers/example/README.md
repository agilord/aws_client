Use individual providers:
```dart
final example1 = DynamoDB(region: 'eu-west-1', credentialsProvider: fromEnvironment); 
final example2 = DynamoDB(region: 'eu-west-1', credentialsProvider: fromIni); 
```

Chain providers:
```dart
final ddb = DynamoDB(
    region: 'eu-west-1',
    credentialsProvider: ({Client? client}) async => 
        await fromEnvironment() ?? await fromIni(client: client),
); 
```

Cache credentials between service calls:
```dart
final ddb = DynamoDB(
   region: 'eu-west-1',
   credentialsProvider: CachedCredentialProvider(fromIni).cacheAndRefreshWhenNeeded,
);
```
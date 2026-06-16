import 'dart:convert';

import 'package:aws_client/lambda.dart';
import 'package:test/test.dart';

import 'harness.dart';

/// A minimal zip containing an `index.js` Node handler, so `createFunction`
/// receives a real (REST-JSON base64-encoded) code blob.
final _zip = base64Decode(
  'UEsDBBQAAAAIAHMAzVy7y3YKOgAAADgAAAAIAAAAaW5kZXguanNLrSjILyop1stIzEvJSS1SsFVI'
  'LK7MS1bQSNVUsLVT0KhWyM+2UigpKk3VUUhNzsi3UkhVqNW05gIAUEsBAhQDFAAAAAgAcwDNXLvL'
  'dgo6AAAAOAAAAAgAAAAAAAAAAAAAAIABAAAAAGluZGV4LmpzUEsFBgAAAAABAAEANgAAAGAAAAAA'
  'AA==',
);

void main() {
  late Lambda lambda;

  setUp(() => lambda = localClient(Lambda.new));
  tearDown(() => lambda.close());

  Future<String> createFn(String fnName) async {
    await lambda.createFunction(
      functionName: fnName,
      role: 'arn:aws:iam::000000000000:role/smoke-lambda',
      runtime: Runtime.nodejs18X,
      handler: 'index.handler',
      code: FunctionCode(zipFile: _zip),
      description: 'smoke-test function',
    );
    return fnName;
  }

  test('Lambda (rest-json): create, get and list a function', () async {
    final fnName = uniqueName('fn');

    final created = await lambda.createFunction(
      functionName: fnName,
      role: 'arn:aws:iam::000000000000:role/smoke-lambda',
      runtime: Runtime.nodejs18X,
      handler: 'index.handler',
      code: FunctionCode(zipFile: _zip),
      description: 'smoke-test function',
    );
    expect(created.functionName, equals(fnName));
    expect(created.handler, equals('index.handler'));

    final got = await lambda.getFunction(functionName: fnName);
    expect(got.configuration!.functionName, equals(fnName));
    expect(got.configuration!.runtime, equals(Runtime.nodejs18X));

    final listed = await lambda.listFunctions();
    expect(listed.functions!.map((f) => f.functionName), contains(fnName));

    // Note: deleteFunction / invoke are intentionally omitted — they require
    // LocalStack's Lambda executor (a mounted docker socket) which the CI
    // container does not provide. create/get/list already exercise the
    // REST-JSON code-blob (de)serialization, which is what matters for parity.
  });

  test('Lambda (rest-json): getFunctionConfiguration exposes enum fields',
      () async {
    final fnName = await createFn(uniqueName('fn'));

    final config = await lambda.getFunctionConfiguration(functionName: fnName);
    expect(config.functionName, equals(fnName));
    expect(config.runtime, equals(Runtime.nodejs18X));
    if (config.packageType != null) {
      expect(config.packageType, equals(PackageType.zip));
    }
    if (config.state != null) {
      expect(State.values, contains(config.state));
    }
  });

  test('Lambda (rest-json): publishVersion then list versions', () async {
    final fnName = await createFn(uniqueName('fn'));

    final published = await lambda.publishVersion(functionName: fnName);
    expect(published.version, isNot(equals(r'$LATEST')));

    final versions = await lambda.listVersionsByFunction(functionName: fnName);
    expect(versions.versions!.map((v) => v.version), contains(r'$LATEST'));
    expect(
      versions.versions!.map((v) => v.runtime),
      everyElement(equals(Runtime.nodejs18X)),
    );
  });

  test('Lambda (rest-json): alias lifecycle', () async {
    final fnName = await createFn(uniqueName('fn'));
    final published = await lambda.publishVersion(functionName: fnName);
    final aliasName = uniqueName('alias');

    final created = await lambda.createAlias(
      functionName: fnName,
      name: aliasName,
      functionVersion: published.version!,
    );
    expect(created.name, equals(aliasName));
    expect(created.functionVersion, equals(published.version));

    final got = await lambda.getAlias(functionName: fnName, name: aliasName);
    expect(got.aliasArn, equals(created.aliasArn));

    final aliases = await lambda.listAliases(functionName: fnName);
    expect(aliases.aliases!.map((a) => a.name), contains(aliasName));
  });
}

import 'package:aws_client/src/shared/src/protocol/endpoints/endpoint_functions.dart';
import 'package:test/test.dart';

void main() {
  test('getAttr reads a map key', () {
    expect(getAttr({'a': 1}, 'a'), 1);
  });

  test('getAttr reads a nested path', () {
    expect(
        getAttr({
          'a': {'b': 'x'}
        }, 'a.b'),
        'x');
  });

  test('getAttr reads a list index', () {
    expect(
        getAttr({
          'r': ['x', 'y']
        }, 'r[1]'),
        'y');
  });

  test('getAttr returns null for a missing key', () {
    expect(getAttr({'a': 1}, 'b'), isNull);
  });

  test('getAttr returns null for an out-of-range index', () {
    expect(
        getAttr({
          'r': ['x']
        }, 'r[5]'),
        isNull);
  });

  test('substring takes a forward slice', () {
    expect(substring('abcdef', 0, 3, false), 'abc');
  });

  test('substring takes a reverse slice', () {
    expect(substring('abcdef', 0, 3, true), 'def');
  });

  test('substring returns null when out of range', () {
    expect(substring('ab', 0, 5, false), isNull);
  });

  test('substring returns null for non-ascii input', () {
    expect(substring('té', 0, 2, false), isNull);
  });

  test('uriEncode keeps unreserved characters', () {
    expect(uriEncode('abcAZ09-_.~'), 'abcAZ09-_.~');
  });

  test('uriEncode percent-encodes reserved characters', () {
    expect(uriEncode('a/b c'), 'a%2Fb%20c');
  });

  test('isValidHostLabel accepts a simple label', () {
    expect(isValidHostLabel('abc', false), isTrue);
  });

  test('isValidHostLabel rejects dots without subdomains', () {
    expect(isValidHostLabel('a.b', false), isFalse);
  });

  test('isValidHostLabel accepts dotted labels with subdomains', () {
    expect(isValidHostLabel('a.b', true), isTrue);
  });

  test('elementOrNull returns the element in range', () {
    expect(elementOrNull(['a', 'b'], 1), 'b');
  });

  test('elementOrNull returns null out of range', () {
    expect(elementOrNull(['a'], 3), isNull);
  });

  test('parseArn parses a valid ARN', () {
    final arn = parseArn('arn:aws:s3:us-east-1:123:bucket/key')!;
    expect(arn.partition, 'aws');
    expect(arn.service, 's3');
    expect(arn.region, 'us-east-1');
    expect(arn.accountId, '123');
    expect(arn.resourceId, ['bucket', 'key']);
  });

  test('parseArn returns null for a non-ARN', () {
    expect(parseArn('not-an-arn'), isNull);
  });

  test('isVirtualHostableS3Bucket accepts a valid bucket', () {
    expect(isVirtualHostableS3Bucket('my-bucket', false), isTrue);
  });

  test('isVirtualHostableS3Bucket rejects uppercase', () {
    expect(isVirtualHostableS3Bucket('MyBucket', false), isFalse);
  });

  test('parseUrl extracts parts', () {
    final url = parseUrl('https://example.com/p')!;
    expect(url.scheme, 'https');
    expect(url.authority, 'example.com');
    expect(url.path, '/p');
    expect(url.isIp, isFalse);
  });

  test('parseUrl flags IP authorities', () {
    final url = parseUrl('https://127.0.0.1')!;
    expect(url.isIp, isTrue);
  });

  test('parseUrl returns null when a query string is present', () {
    expect(parseUrl('https://example.com?a=1'), isNull);
  });

  test('awsPartition resolves an explicit region', () {
    final p = awsPartition('us-east-1');
    expect(p.name, 'aws');
    expect(p.dnsSuffix, 'amazonaws.com');
  });

  test('awsPartition resolves the China partition', () {
    final p = awsPartition('cn-north-1');
    expect(p.name, 'aws-cn');
    expect(p.dnsSuffix, 'amazonaws.com.cn');
  });

  test('awsPartition resolves the GovCloud partition', () {
    final p = awsPartition('us-gov-west-1');
    expect(p.name, 'aws-us-gov');
  });

  test('awsPartition matches an unknown region by regex', () {
    final p = awsPartition('eu-imaginary-1');
    expect(p.name, 'aws');
  });

  test('awsPartition falls back to the default partition', () {
    final p = awsPartition('totally-made-up');
    expect(p.name, 'aws');
  });
}

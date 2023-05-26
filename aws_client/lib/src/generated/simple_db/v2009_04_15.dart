// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

import 'v2009_04_15.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon SimpleDB is a web service providing the core database functions of
/// data indexing and querying in the cloud. By offloading the time and effort
/// associated with building and operating a web-scale database, SimpleDB
/// provides developers the freedom to focus on application development.
/// A traditional, clustered relational database requires a sizable upfront
/// capital outlay, is complex to design, and often requires extensive and
/// repetitive database administration. Amazon SimpleDB is dramatically simpler,
/// requiring no schema, automatically indexing your data and providing a simple
/// API for storage and access. This approach eliminates the administrative
/// burden of data modeling, index maintenance, and performance tuning.
/// Developers gain access to this functionality within Amazon's proven
/// computing environment, are able to scale instantly, and pay only for what
/// they use.
///
/// Visit <a
/// href="http://aws.amazon.com/simpledb/">http://aws.amazon.com/simpledb/</a>
/// for more information.
class SimpleDB {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  SimpleDB({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sdb',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Performs multiple DeleteAttributes operations in a single call, which
  /// reduces round trips and latencies. This enables Amazon SimpleDB to
  /// optimize requests, which generally yields better throughput.
  /// <note>
  /// If you specify BatchDeleteAttributes without attributes or values, all the
  /// attributes for the item are deleted.
  ///
  /// BatchDeleteAttributes is an idempotent operation; running it multiple
  /// times on the same item or attribute doesn't result in an error.
  ///
  /// The BatchDeleteAttributes operation succeeds or fails in its entirety.
  /// There are no partial deletes. You can execute multiple
  /// BatchDeleteAttributes operations and other operations in parallel.
  /// However, large numbers of concurrent BatchDeleteAttributes calls can
  /// result in Service Unavailable (503) responses.
  ///
  /// This operation is vulnerable to exceeding the maximum URL size when making
  /// a REST request using the HTTP GET method.
  ///
  /// This operation does not support conditions using Expected.X.Name,
  /// Expected.X.Value, or Expected.X.Exists.
  /// </note>
  /// The following limitations are enforced for this operation:
  /// <ul>
  /// <li>1 MB request size</li>
  /// <li>25 item limit per BatchDeleteAttributes operation</li>
  /// </ul>
  ///
  /// Parameter [domainName] :
  /// The name of the domain in which the attributes are being deleted.
  ///
  /// Parameter [items] :
  /// A list of items on which to perform the operation.
  Future<void> batchDeleteAttributes({
    required String domainName,
    required List<DeletableItem> items,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['Items'] = items;
    await _protocol.send(
      $request,
      action: 'BatchDeleteAttributes',
      version: '2009-04-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['BatchDeleteAttributesRequest'],
      shapes: shapes,
    );
  }

  /// The <code>BatchPutAttributes</code> operation creates or replaces
  /// attributes within one or more items. By using this operation, the client
  /// can perform multiple <a>PutAttribute</a> operation with a single call.
  /// This helps yield savings in round trips and latencies, enabling Amazon
  /// SimpleDB to optimize requests and generally produce better throughput.
  ///
  /// The client may specify the item name with the <code>Item.X.ItemName</code>
  /// parameter. The client may specify new attributes using a combination of
  /// the <code>Item.X.Attribute.Y.Name</code> and
  /// <code>Item.X.Attribute.Y.Value</code> parameters. The client may specify
  /// the first attribute for the first item using the parameters
  /// <code>Item.0.Attribute.0.Name</code> and
  /// <code>Item.0.Attribute.0.Value</code>, and for the second attribute for
  /// the first item by the parameters <code>Item.0.Attribute.1.Name</code> and
  /// <code>Item.0.Attribute.1.Value</code>, and so on.
  ///
  /// Attributes are uniquely identified within an item by their name/value
  /// combination. For example, a single item can have the attributes <code>{
  /// "first_name", "first_value" }</code> and <code>{ "first_name",
  /// "second_value" }</code>. However, it cannot have two attribute instances
  /// where both the <code>Item.X.Attribute.Y.Name</code> and
  /// <code>Item.X.Attribute.Y.Value</code> are the same.
  ///
  /// Optionally, the requester can supply the <code>Replace</code> parameter
  /// for each individual value. Setting this value to <code>true</code> will
  /// cause the new attribute values to replace the existing attribute values.
  /// For example, if an item <code>I</code> has the attributes <code>{ 'a', '1'
  /// }, { 'b', '2'}</code> and <code>{ 'b', '3' }</code> and the requester does
  /// a BatchPutAttributes of <code>{'I', 'b', '4' }</code> with the Replace
  /// parameter set to true, the final attributes of the item will be <code>{
  /// 'a', '1' }</code> and <code>{ 'b', '4' }</code>, replacing the previous
  /// values of the 'b' attribute with the new value.
  /// <note> You cannot specify an empty string as an item or as an attribute
  /// name. The <code>BatchPutAttributes</code> operation succeeds or fails in
  /// its entirety. There are no partial puts. </note> <important> This
  /// operation is vulnerable to exceeding the maximum URL size when making a
  /// REST request using the HTTP GET method. This operation does not support
  /// conditions using <code>Expected.X.Name</code>,
  /// <code>Expected.X.Value</code>, or <code>Expected.X.Exists</code>.
  /// </important>
  /// You can execute multiple <code>BatchPutAttributes</code> operations and
  /// other operations in parallel. However, large numbers of concurrent
  /// <code>BatchPutAttributes</code> calls can result in Service Unavailable
  /// (503) responses.
  ///
  /// The following limitations are enforced for this operation:
  /// <ul>
  /// <li>256 attribute name-value pairs per item</li>
  /// <li>1 MB request size</li>
  /// <li>1 billion attributes per domain</li>
  /// <li>10 GB of total user data storage per domain</li>
  /// <li>25 item limit per <code>BatchPutAttributes</code> operation</li>
  /// </ul>
  ///
  /// May throw [DuplicateItemName].
  /// May throw [InvalidParameterValue].
  /// May throw [MissingParameter].
  /// May throw [NoSuchDomain].
  /// May throw [NumberItemAttributesExceeded].
  /// May throw [NumberDomainAttributesExceeded].
  /// May throw [NumberDomainBytesExceeded].
  /// May throw [NumberSubmittedItemsExceeded].
  /// May throw [NumberSubmittedAttributesExceeded].
  ///
  /// Parameter [domainName] :
  /// The name of the domain in which the attributes are being stored.
  ///
  /// Parameter [items] :
  /// A list of items on which to perform the operation.
  Future<void> batchPutAttributes({
    required String domainName,
    required List<ReplaceableItem> items,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['Items'] = items;
    await _protocol.send(
      $request,
      action: 'BatchPutAttributes',
      version: '2009-04-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['BatchPutAttributesRequest'],
      shapes: shapes,
    );
  }

  /// The <code>CreateDomain</code> operation creates a new domain. The domain
  /// name should be unique among the domains associated with the Access Key ID
  /// provided in the request. The <code>CreateDomain</code> operation may take
  /// 10 or more seconds to complete.
  /// <note> CreateDomain is an idempotent operation; running it multiple times
  /// using the same domain name will not result in an error response. </note>
  /// The client can create up to 100 domains per account.
  ///
  /// If the client requires additional domains, go to <a
  /// href="http://aws.amazon.com/contact-us/simpledb-limit-request/">
  /// http://aws.amazon.com/contact-us/simpledb-limit-request/</a>.
  ///
  /// May throw [InvalidParameterValue].
  /// May throw [MissingParameter].
  /// May throw [NumberDomainsExceeded].
  ///
  /// Parameter [domainName] :
  /// The name of the domain to create. The name can range between 3 and 255
  /// characters and can contain the following characters: a-z, A-Z, 0-9, '_',
  /// '-', and '.'.
  Future<void> createDomain({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    await _protocol.send(
      $request,
      action: 'CreateDomain',
      version: '2009-04-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDomainRequest'],
      shapes: shapes,
    );
  }

  /// Deletes one or more attributes associated with an item. If all attributes
  /// of the item are deleted, the item is deleted.
  /// <note> If <code>DeleteAttributes</code> is called without being passed any
  /// attributes or values specified, all the attributes for the item are
  /// deleted. </note>
  /// <code>DeleteAttributes</code> is an idempotent operation; running it
  /// multiple times on the same item or attribute does not result in an error
  /// response.
  ///
  /// Because Amazon SimpleDB makes multiple copies of item data and uses an
  /// eventual consistency update model, performing a <a>GetAttributes</a> or
  /// <a>Select</a> operation (read) immediately after a
  /// <code>DeleteAttributes</code> or <a>PutAttributes</a> operation (write)
  /// might not return updated item data.
  ///
  /// May throw [InvalidParameterValue].
  /// May throw [MissingParameter].
  /// May throw [NoSuchDomain].
  /// May throw [AttributeDoesNotExist].
  ///
  /// Parameter [domainName] :
  /// The name of the domain in which to perform the operation.
  ///
  /// Parameter [itemName] :
  /// The name of the item. Similar to rows on a spreadsheet, items represent
  /// individual objects that contain one or more value-attribute pairs.
  ///
  /// Parameter [attributes] :
  /// A list of Attributes. Similar to columns on a spreadsheet, attributes
  /// represent categories of data that can be assigned to items.
  ///
  /// Parameter [expected] :
  /// The update condition which, if specified, determines whether the specified
  /// attributes will be deleted or not. The update condition must be satisfied
  /// in order for this request to be processed and the attributes to be
  /// deleted.
  Future<void> deleteAttributes({
    required String domainName,
    required String itemName,
    List<DeletableAttribute>? attributes,
    UpdateCondition? expected,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['ItemName'] = itemName;
    attributes?.also((arg) => $request['Attributes'] = arg);
    expected?.also((arg) => $request['Expected'] = arg);
    await _protocol.send(
      $request,
      action: 'DeleteAttributes',
      version: '2009-04-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteAttributesRequest'],
      shapes: shapes,
    );
  }

  /// The <code>DeleteDomain</code> operation deletes a domain. Any items (and
  /// their attributes) in the domain are deleted as well. The
  /// <code>DeleteDomain</code> operation might take 10 or more seconds to
  /// complete.
  /// <note> Running <code>DeleteDomain</code> on a domain that does not exist
  /// or running the function multiple times using the same domain name will not
  /// result in an error response. </note>
  ///
  /// May throw [MissingParameter].
  ///
  /// Parameter [domainName] :
  /// The name of the domain to delete.
  Future<void> deleteDomain({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    await _protocol.send(
      $request,
      action: 'DeleteDomain',
      version: '2009-04-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDomainRequest'],
      shapes: shapes,
    );
  }

  /// Returns information about the domain, including when the domain was
  /// created, the number of items and attributes in the domain, and the size of
  /// the attribute names and values.
  ///
  /// May throw [MissingParameter].
  /// May throw [NoSuchDomain].
  ///
  /// Parameter [domainName] :
  /// The name of the domain for which to display the metadata of.
  Future<DomainMetadataResult> domainMetadata({
    required String domainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      action: 'DomainMetadata',
      version: '2009-04-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DomainMetadataRequest'],
      shapes: shapes,
      resultWrapper: 'DomainMetadataResult',
    );
    return DomainMetadataResult.fromXml($result);
  }

  /// Returns all of the attributes associated with the specified item.
  /// Optionally, the attributes returned can be limited to one or more
  /// attributes by specifying an attribute name parameter.
  ///
  /// If the item does not exist on the replica that was accessed for this
  /// operation, an empty set is returned. The system does not return an error
  /// as it cannot guarantee the item does not exist on other replicas.
  /// <note> If GetAttributes is called without being passed any attribute
  /// names, all the attributes for the item are returned. </note>
  ///
  /// May throw [InvalidParameterValue].
  /// May throw [MissingParameter].
  /// May throw [NoSuchDomain].
  ///
  /// Parameter [domainName] :
  /// The name of the domain in which to perform the operation.
  ///
  /// Parameter [itemName] :
  /// The name of the item.
  ///
  /// Parameter [attributeNames] :
  /// The names of the attributes.
  ///
  /// Parameter [consistentRead] :
  /// Determines whether or not strong consistency should be enforced when data
  /// is read from SimpleDB. If <code>true</code>, any data previously written
  /// to SimpleDB will be returned. Otherwise, results will be consistent
  /// eventually, and the client may not see data that was written immediately
  /// before your read.
  Future<GetAttributesResult> getAttributes({
    required String domainName,
    required String itemName,
    List<String>? attributeNames,
    bool? consistentRead,
  }) async {
    final $request = <String, dynamic>{};
    $request['DomainName'] = domainName;
    $request['ItemName'] = itemName;
    attributeNames?.also((arg) => $request['AttributeNames'] = arg);
    consistentRead?.also((arg) => $request['ConsistentRead'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetAttributes',
      version: '2009-04-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetAttributesRequest'],
      shapes: shapes,
      resultWrapper: 'GetAttributesResult',
    );
    return GetAttributesResult.fromXml($result);
  }

  /// The <code>ListDomains</code> operation lists all domains associated with
  /// the Access Key ID. It returns domain names up to the limit set by <a
  /// href="#MaxNumberOfDomains">MaxNumberOfDomains</a>. A <a
  /// href="#NextToken">NextToken</a> is returned if there are more than
  /// <code>MaxNumberOfDomains</code> domains. Calling <code>ListDomains</code>
  /// successive times with the <code>NextToken</code> provided by the operation
  /// returns up to <code>MaxNumberOfDomains</code> more domain names with each
  /// successive operation call.
  ///
  /// May throw [InvalidParameterValue].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [maxNumberOfDomains] :
  /// The maximum number of domain names you want returned. The range is 1 to
  /// 100. The default setting is 100.
  ///
  /// Parameter [nextToken] :
  /// A string informing Amazon SimpleDB where to start the next list of domain
  /// names.
  Future<ListDomainsResult> listDomains({
    int? maxNumberOfDomains,
    String? nextToken,
  }) async {
    final $request = <String, dynamic>{};
    maxNumberOfDomains?.also((arg) => $request['MaxNumberOfDomains'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListDomains',
      version: '2009-04-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListDomainsRequest'],
      shapes: shapes,
      resultWrapper: 'ListDomainsResult',
    );
    return ListDomainsResult.fromXml($result);
  }

  /// The PutAttributes operation creates or replaces attributes in an item. The
  /// client may specify new attributes using a combination of the
  /// <code>Attribute.X.Name</code> and <code>Attribute.X.Value</code>
  /// parameters. The client specifies the first attribute by the parameters
  /// <code>Attribute.0.Name</code> and <code>Attribute.0.Value</code>, the
  /// second attribute by the parameters <code>Attribute.1.Name</code> and
  /// <code>Attribute.1.Value</code>, and so on.
  ///
  /// Attributes are uniquely identified in an item by their name/value
  /// combination. For example, a single item can have the attributes <code>{
  /// "first_name", "first_value" }</code> and <code>{ "first_name",
  /// second_value" }</code>. However, it cannot have two attribute instances
  /// where both the <code>Attribute.X.Name</code> and
  /// <code>Attribute.X.Value</code> are the same.
  ///
  /// Optionally, the requestor can supply the <code>Replace</code> parameter
  /// for each individual attribute. Setting this value to <code>true</code>
  /// causes the new attribute value to replace the existing attribute value(s).
  /// For example, if an item has the attributes <code>{ 'a', '1' }</code>,
  /// <code>{ 'b', '2'}</code> and <code>{ 'b', '3' }</code> and the requestor
  /// calls <code>PutAttributes</code> using the attributes <code>{ 'b', '4'
  /// }</code> with the <code>Replace</code> parameter set to true, the final
  /// attributes of the item are changed to <code>{ 'a', '1' }</code> and
  /// <code>{ 'b', '4' }</code>, which replaces the previous values of the 'b'
  /// attribute with the new value.
  /// <note> Using <code>PutAttributes</code> to replace attribute values that
  /// do not exist will not result in an error response. </note>
  /// You cannot specify an empty string as an attribute name.
  ///
  /// Because Amazon SimpleDB makes multiple copies of client data and uses an
  /// eventual consistency update model, an immediate <a>GetAttributes</a> or
  /// <a>Select</a> operation (read) immediately after a <a>PutAttributes</a> or
  /// <a>DeleteAttributes</a> operation (write) might not return the updated
  /// data.
  ///
  /// The following limitations are enforced for this operation:
  /// <ul>
  /// <li>256 total attribute name-value pairs per item</li>
  /// <li>One billion attributes per domain</li>
  /// <li>10 GB of total user data storage per domain</li>
  /// </ul>
  ///
  /// May throw [InvalidParameterValue].
  /// May throw [MissingParameter].
  /// May throw [NoSuchDomain].
  /// May throw [NumberDomainAttributesExceeded].
  /// May throw [NumberDomainBytesExceeded].
  /// May throw [NumberItemAttributesExceeded].
  /// May throw [AttributeDoesNotExist].
  ///
  /// Parameter [attributes] :
  /// The list of attributes.
  ///
  /// Parameter [domainName] :
  /// The name of the domain in which to perform the operation.
  ///
  /// Parameter [itemName] :
  /// The name of the item.
  ///
  /// Parameter [expected] :
  /// The update condition which, if specified, determines whether the specified
  /// attributes will be updated or not. The update condition must be satisfied
  /// in order for this request to be processed and the attributes to be
  /// updated.
  Future<void> putAttributes({
    required List<ReplaceableAttribute> attributes,
    required String domainName,
    required String itemName,
    UpdateCondition? expected,
  }) async {
    final $request = <String, dynamic>{};
    $request['Attributes'] = attributes;
    $request['DomainName'] = domainName;
    $request['ItemName'] = itemName;
    expected?.also((arg) => $request['Expected'] = arg);
    await _protocol.send(
      $request,
      action: 'PutAttributes',
      version: '2009-04-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutAttributesRequest'],
      shapes: shapes,
    );
  }

  /// The <code>Select</code> operation returns a set of attributes for
  /// <code>ItemNames</code> that match the select expression.
  /// <code>Select</code> is similar to the standard SQL SELECT statement.
  ///
  /// The total size of the response cannot exceed 1 MB in total size. Amazon
  /// SimpleDB automatically adjusts the number of items returned per page to
  /// enforce this limit. For example, if the client asks to retrieve 2500
  /// items, but each individual item is 10 kB in size, the system returns 100
  /// items and an appropriate <code>NextToken</code> so the client can access
  /// the next page of results.
  ///
  /// For information on how to construct select expressions, see Using Select
  /// to Create Amazon SimpleDB Queries in the Developer Guide.
  ///
  /// May throw [InvalidParameterValue].
  /// May throw [InvalidNextToken].
  /// May throw [InvalidNumberPredicates].
  /// May throw [InvalidNumberValueTests].
  /// May throw [InvalidQueryExpression].
  /// May throw [MissingParameter].
  /// May throw [NoSuchDomain].
  /// May throw [RequestTimeout].
  /// May throw [TooManyRequestedAttributes].
  ///
  /// Parameter [selectExpression] :
  /// The expression used to query the domain.
  ///
  /// Parameter [consistentRead] :
  /// Determines whether or not strong consistency should be enforced when data
  /// is read from SimpleDB. If <code>true</code>, any data previously written
  /// to SimpleDB will be returned. Otherwise, results will be consistent
  /// eventually, and the client may not see data that was written immediately
  /// before your read.
  ///
  /// Parameter [nextToken] :
  /// A string informing Amazon SimpleDB where to start the next list of
  /// <code>ItemNames</code>.
  Future<SelectResult> select({
    required String selectExpression,
    bool? consistentRead,
    String? nextToken,
  }) async {
    final $request = <String, dynamic>{};
    $request['SelectExpression'] = selectExpression;
    consistentRead?.also((arg) => $request['ConsistentRead'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'Select',
      version: '2009-04-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SelectRequest'],
      shapes: shapes,
      resultWrapper: 'SelectResult',
    );
    return SelectResult.fromXml($result);
  }
}

///
class Attribute {
  /// The name of the attribute.
  final String name;

  /// The value of the attribute.
  final String value;

  ///
  final String? alternateNameEncoding;

  ///
  final String? alternateValueEncoding;

  Attribute({
    required this.name,
    required this.value,
    this.alternateNameEncoding,
    this.alternateValueEncoding,
  });
  factory Attribute.fromXml(_s.XmlElement elem) {
    return Attribute(
      name: _s.extractXmlStringValue(elem, 'Name')!,
      value: _s.extractXmlStringValue(elem, 'Value')!,
      alternateNameEncoding:
          _s.extractXmlStringValue(elem, 'AlternateNameEncoding'),
      alternateValueEncoding:
          _s.extractXmlStringValue(elem, 'AlternateValueEncoding'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    final alternateNameEncoding = this.alternateNameEncoding;
    final alternateValueEncoding = this.alternateValueEncoding;
    return {
      'Name': name,
      'Value': value,
      if (alternateNameEncoding != null)
        'AlternateNameEncoding': alternateNameEncoding,
      if (alternateValueEncoding != null)
        'AlternateValueEncoding': alternateValueEncoding,
    };
  }
}

/// The specified attribute does not exist.
class AttributeDoesNotExist implements _s.AwsException {
  final double? boxUsage;

  AttributeDoesNotExist({
    this.boxUsage,
  });
  factory AttributeDoesNotExist.fromXml(_s.XmlElement elem) {
    return AttributeDoesNotExist(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

///
class DeletableAttribute {
  /// The name of the attribute.
  final String name;

  /// The value of the attribute.
  final String? value;

  DeletableAttribute({
    required this.name,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

class DeletableItem {
  final String name;
  final List<DeletableAttribute>? attributes;

  DeletableItem({
    required this.name,
    this.attributes,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final attributes = this.attributes;
    return {
      'ItemName': name,
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

class DomainMetadataResult {
  /// The number of unique attribute names in the domain.
  final int? attributeNameCount;

  /// The total size of all unique attribute names in the domain, in bytes.
  final int? attributeNamesSizeBytes;

  /// The number of all attribute name/value pairs in the domain.
  final int? attributeValueCount;

  /// The total size of all attribute values in the domain, in bytes.
  final int? attributeValuesSizeBytes;

  /// The number of all items in the domain.
  final int? itemCount;

  /// The total size of all item names in the domain, in bytes.
  final int? itemNamesSizeBytes;

  /// The data and time when metadata was calculated, in Epoch (UNIX) seconds.
  final int? timestamp;

  DomainMetadataResult({
    this.attributeNameCount,
    this.attributeNamesSizeBytes,
    this.attributeValueCount,
    this.attributeValuesSizeBytes,
    this.itemCount,
    this.itemNamesSizeBytes,
    this.timestamp,
  });
  factory DomainMetadataResult.fromXml(_s.XmlElement elem) {
    return DomainMetadataResult(
      attributeNameCount: _s.extractXmlIntValue(elem, 'AttributeNameCount'),
      attributeNamesSizeBytes:
          _s.extractXmlIntValue(elem, 'AttributeNamesSizeBytes'),
      attributeValueCount: _s.extractXmlIntValue(elem, 'AttributeValueCount'),
      attributeValuesSizeBytes:
          _s.extractXmlIntValue(elem, 'AttributeValuesSizeBytes'),
      itemCount: _s.extractXmlIntValue(elem, 'ItemCount'),
      itemNamesSizeBytes: _s.extractXmlIntValue(elem, 'ItemNamesSizeBytes'),
      timestamp: _s.extractXmlIntValue(elem, 'Timestamp'),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeNameCount = this.attributeNameCount;
    final attributeNamesSizeBytes = this.attributeNamesSizeBytes;
    final attributeValueCount = this.attributeValueCount;
    final attributeValuesSizeBytes = this.attributeValuesSizeBytes;
    final itemCount = this.itemCount;
    final itemNamesSizeBytes = this.itemNamesSizeBytes;
    final timestamp = this.timestamp;
    return {
      if (attributeNameCount != null) 'AttributeNameCount': attributeNameCount,
      if (attributeNamesSizeBytes != null)
        'AttributeNamesSizeBytes': attributeNamesSizeBytes,
      if (attributeValueCount != null)
        'AttributeValueCount': attributeValueCount,
      if (attributeValuesSizeBytes != null)
        'AttributeValuesSizeBytes': attributeValuesSizeBytes,
      if (itemCount != null) 'ItemCount': itemCount,
      if (itemNamesSizeBytes != null) 'ItemNamesSizeBytes': itemNamesSizeBytes,
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

/// The item name was specified more than once.
class DuplicateItemName implements _s.AwsException {
  final double? boxUsage;

  DuplicateItemName({
    this.boxUsage,
  });
  factory DuplicateItemName.fromXml(_s.XmlElement elem) {
    return DuplicateItemName(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

class GetAttributesResult {
  /// The list of attributes returned by the operation.
  final List<Attribute>? attributes;

  GetAttributesResult({
    this.attributes,
  });
  factory GetAttributesResult.fromXml(_s.XmlElement elem) {
    return GetAttributesResult(
      attributes:
          elem.findElements('Attribute').map(Attribute.fromXml).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// The specified NextToken is not valid.
class InvalidNextToken implements _s.AwsException {
  final double? boxUsage;

  InvalidNextToken({
    this.boxUsage,
  });
  factory InvalidNextToken.fromXml(_s.XmlElement elem) {
    return InvalidNextToken(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

/// Too many predicates exist in the query expression.
class InvalidNumberPredicates implements _s.AwsException {
  final double? boxUsage;

  InvalidNumberPredicates({
    this.boxUsage,
  });
  factory InvalidNumberPredicates.fromXml(_s.XmlElement elem) {
    return InvalidNumberPredicates(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

/// Too many predicates exist in the query expression.
class InvalidNumberValueTests implements _s.AwsException {
  final double? boxUsage;

  InvalidNumberValueTests({
    this.boxUsage,
  });
  factory InvalidNumberValueTests.fromXml(_s.XmlElement elem) {
    return InvalidNumberValueTests(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

/// The value for a parameter is invalid.
class InvalidParameterValue implements _s.AwsException {
  final double? boxUsage;

  InvalidParameterValue({
    this.boxUsage,
  });
  factory InvalidParameterValue.fromXml(_s.XmlElement elem) {
    return InvalidParameterValue(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

/// The specified query expression syntax is not valid.
class InvalidQueryExpression implements _s.AwsException {
  final double? boxUsage;

  InvalidQueryExpression({
    this.boxUsage,
  });
  factory InvalidQueryExpression.fromXml(_s.XmlElement elem) {
    return InvalidQueryExpression(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

///
class Item {
  /// A list of attributes.
  final List<Attribute> attributes;

  /// The name of the item.
  final String name;

  ///
  final String? alternateNameEncoding;

  Item({
    required this.attributes,
    required this.name,
    this.alternateNameEncoding,
  });
  factory Item.fromXml(_s.XmlElement elem) {
    return Item(
      attributes:
          elem.findElements('Attribute').map(Attribute.fromXml).toList(),
      name: _s.extractXmlStringValue(elem, 'Name')!,
      alternateNameEncoding:
          _s.extractXmlStringValue(elem, 'AlternateNameEncoding'),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final name = this.name;
    final alternateNameEncoding = this.alternateNameEncoding;
    return {
      'Attributes': attributes,
      'Name': name,
      if (alternateNameEncoding != null)
        'AlternateNameEncoding': alternateNameEncoding,
    };
  }
}

class ListDomainsResult {
  /// A list of domain names that match the expression.
  final List<String>? domainNames;

  /// An opaque token indicating that there are more domains than the specified
  /// <code>MaxNumberOfDomains</code> still available.
  final String? nextToken;

  ListDomainsResult({
    this.domainNames,
    this.nextToken,
  });
  factory ListDomainsResult.fromXml(_s.XmlElement elem) {
    return ListDomainsResult(
      domainNames: _s.extractXmlStringListValues(elem, 'DomainName'),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final domainNames = this.domainNames;
    final nextToken = this.nextToken;
    return {
      if (domainNames != null) 'DomainNames': domainNames,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The request must contain the specified missing parameter.
class MissingParameter implements _s.AwsException {
  final double? boxUsage;

  MissingParameter({
    this.boxUsage,
  });
  factory MissingParameter.fromXml(_s.XmlElement elem) {
    return MissingParameter(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

/// The specified domain does not exist.
class NoSuchDomain implements _s.AwsException {
  final double? boxUsage;

  NoSuchDomain({
    this.boxUsage,
  });
  factory NoSuchDomain.fromXml(_s.XmlElement elem) {
    return NoSuchDomain(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

/// Too many attributes in this domain.
class NumberDomainAttributesExceeded implements _s.AwsException {
  final double? boxUsage;

  NumberDomainAttributesExceeded({
    this.boxUsage,
  });
  factory NumberDomainAttributesExceeded.fromXml(_s.XmlElement elem) {
    return NumberDomainAttributesExceeded(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

/// Too many bytes in this domain.
class NumberDomainBytesExceeded implements _s.AwsException {
  final double? boxUsage;

  NumberDomainBytesExceeded({
    this.boxUsage,
  });
  factory NumberDomainBytesExceeded.fromXml(_s.XmlElement elem) {
    return NumberDomainBytesExceeded(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

/// Too many domains exist per this account.
class NumberDomainsExceeded implements _s.AwsException {
  final double? boxUsage;

  NumberDomainsExceeded({
    this.boxUsage,
  });
  factory NumberDomainsExceeded.fromXml(_s.XmlElement elem) {
    return NumberDomainsExceeded(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

/// Too many attributes in this item.
class NumberItemAttributesExceeded implements _s.AwsException {
  final double? boxUsage;

  NumberItemAttributesExceeded({
    this.boxUsage,
  });
  factory NumberItemAttributesExceeded.fromXml(_s.XmlElement elem) {
    return NumberItemAttributesExceeded(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

/// Too many attributes exist in a single call.
class NumberSubmittedAttributesExceeded implements _s.AwsException {
  final double? boxUsage;

  NumberSubmittedAttributesExceeded({
    this.boxUsage,
  });
  factory NumberSubmittedAttributesExceeded.fromXml(_s.XmlElement elem) {
    return NumberSubmittedAttributesExceeded(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

/// Too many items exist in a single call.
class NumberSubmittedItemsExceeded implements _s.AwsException {
  final double? boxUsage;

  NumberSubmittedItemsExceeded({
    this.boxUsage,
  });
  factory NumberSubmittedItemsExceeded.fromXml(_s.XmlElement elem) {
    return NumberSubmittedItemsExceeded(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

///
class ReplaceableAttribute {
  /// The name of the replaceable attribute.
  final String name;

  /// The value of the replaceable attribute.
  final String value;

  /// A flag specifying whether or not to replace the attribute/value pair or to
  /// add a new attribute/value pair. The default setting is <code>false</code>.
  final bool? replace;

  ReplaceableAttribute({
    required this.name,
    required this.value,
    this.replace,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    final replace = this.replace;
    return {
      'Name': name,
      'Value': value,
      if (replace != null) 'Replace': replace,
    };
  }
}

///
class ReplaceableItem {
  /// The list of attributes for a replaceable item.
  final List<ReplaceableAttribute> attributes;

  /// The name of the replaceable item.
  final String name;

  ReplaceableItem({
    required this.attributes,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final name = this.name;
    return {
      'Attributes': attributes,
      'ItemName': name,
    };
  }
}

/// A timeout occurred when attempting to query the specified domain with
/// specified query expression.
class RequestTimeout implements _s.AwsException {
  final double? boxUsage;

  RequestTimeout({
    this.boxUsage,
  });
  factory RequestTimeout.fromXml(_s.XmlElement elem) {
    return RequestTimeout(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

class SelectResult {
  /// A list of items that match the select expression.
  final List<Item>? items;

  /// An opaque token indicating that more items than
  /// <code>MaxNumberOfItems</code> were matched, the response size exceeded 1
  /// megabyte, or the execution time exceeded 5 seconds.
  final String? nextToken;

  SelectResult({
    this.items,
    this.nextToken,
  });
  factory SelectResult.fromXml(_s.XmlElement elem) {
    return SelectResult(
      items: elem.findElements('Item').map(Item.fromXml).toList(),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Too many attributes requested.
class TooManyRequestedAttributes implements _s.AwsException {
  final double? boxUsage;

  TooManyRequestedAttributes({
    this.boxUsage,
  });
  factory TooManyRequestedAttributes.fromXml(_s.XmlElement elem) {
    return TooManyRequestedAttributes(
      boxUsage: _s.extractXmlDoubleValue(elem, 'BoxUsage'),
    );
  }

  Map<String, dynamic> toJson() {
    final boxUsage = this.boxUsage;
    return {
      if (boxUsage != null) 'BoxUsage': boxUsage,
    };
  }
}

/// Specifies the conditions under which data should be updated. If an update
/// condition is specified for a request, the data will only be updated if the
/// condition is satisfied. For example, if an attribute with a specific name
/// and value exists, or if a specific attribute doesn't exist.
class UpdateCondition {
  /// A value specifying whether or not the specified attribute must exist with
  /// the specified value in order for the update condition to be satisfied.
  /// Specify <code>true</code> if the attribute must exist for the update
  /// condition to be satisfied. Specify <code>false</code> if the attribute
  /// should not exist in order for the update condition to be satisfied.
  final bool? exists;

  /// The name of the attribute involved in the condition.
  final String? name;

  /// The value of an attribute. This value can only be specified when the
  /// <code>Exists</code> parameter is equal to <code>true</code>.
  final String? value;

  UpdateCondition({
    this.exists,
    this.name,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final exists = this.exists;
    final name = this.name;
    final value = this.value;
    return {
      if (exists != null) 'Exists': exists,
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AttributeDoesNotExist': (type, message) => AttributeDoesNotExist(),
  'DuplicateItemName': (type, message) => DuplicateItemName(),
  'InvalidNextToken': (type, message) => InvalidNextToken(),
  'InvalidNumberPredicates': (type, message) => InvalidNumberPredicates(),
  'InvalidNumberValueTests': (type, message) => InvalidNumberValueTests(),
  'InvalidParameterValue': (type, message) => InvalidParameterValue(),
  'InvalidQueryExpression': (type, message) => InvalidQueryExpression(),
  'MissingParameter': (type, message) => MissingParameter(),
  'NoSuchDomain': (type, message) => NoSuchDomain(),
  'NumberDomainAttributesExceeded': (type, message) =>
      NumberDomainAttributesExceeded(),
  'NumberDomainBytesExceeded': (type, message) => NumberDomainBytesExceeded(),
  'NumberDomainsExceeded': (type, message) => NumberDomainsExceeded(),
  'NumberItemAttributesExceeded': (type, message) =>
      NumberItemAttributesExceeded(),
  'NumberSubmittedAttributesExceeded': (type, message) =>
      NumberSubmittedAttributesExceeded(),
  'NumberSubmittedItemsExceeded': (type, message) =>
      NumberSubmittedItemsExceeded(),
  'RequestTimeout': (type, message) => RequestTimeout(),
  'TooManyRequestedAttributes': (type, message) => TooManyRequestedAttributes(),
};

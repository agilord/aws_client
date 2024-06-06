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

export '../../shared/shared.dart' show AwsClientCredentials;

/// You can use the tax setting API to programmatically set, modify, and delete
/// the tax registration number (TRN), associated business legal name, and
/// address (Collectively referred to as "TRN information"). You can also
/// programmatically view TRN information and tax addresses ("Tax profiles").
///
/// You can use this API to automate your TRN information settings instead of
/// manually using the console.
///
/// Service Endpoint
///
/// <ul>
/// <li>
/// https://tax.us-east-1.amazonaws.com
/// </li>
/// </ul>
class TaxSettings {
  final _s.RestJsonProtocol _protocol;
  TaxSettings({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'tax',
            signingName: 'tax',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Deletes tax registration for multiple accounts in batch. This can be used
  /// to delete tax registrations for up to five accounts in one batch.
  /// <note>
  /// This API operation can't be used to delete your tax registration in
  /// Brazil. Use the <a
  /// href="https://console.aws.amazon.com/billing/home#/paymentpreferences/paymentmethods">Payment
  /// preferences</a> page in the Billing and Cost Management console instead.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accountIds] :
  /// List of unique account identifiers.
  Future<BatchDeleteTaxRegistrationResponse> batchDeleteTaxRegistration({
    required List<String> accountIds,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchDeleteTaxRegistration',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteTaxRegistrationResponse.fromJson(response);
  }

  /// Adds or updates tax registration for multiple accounts in batch. This can
  /// be used to add or update tax registrations for up to five accounts in one
  /// batch. You can't set a TRN if there's a pending TRN. You'll need to delete
  /// the pending TRN first.
  ///
  /// To call this API operation for specific countries, see the following
  /// country-specific requirements.
  ///
  /// <b>Bangladesh</b>
  ///
  /// <ul>
  /// <li>
  /// You must specify the tax registration certificate document in the
  /// <code>taxRegistrationDocuments</code> field of the
  /// <code>VerificationDetails</code> object.
  /// </li>
  /// </ul>
  /// <b>Brazil</b>
  ///
  /// <ul>
  /// <li>
  /// You must complete the tax registration process in the <a
  /// href="https://console.aws.amazon.com/billing/home#/paymentpreferences/paymentmethods">Payment
  /// preferences</a> page in the Billing and Cost Management console. After
  /// your TRN and billing address are verified, you can call this API
  /// operation.
  /// </li>
  /// <li>
  /// For Amazon Web Services accounts created through Organizations, you can
  /// call this API operation when you don't have a billing address.
  /// </li>
  /// </ul>
  /// <b>Georgia</b>
  ///
  /// <ul>
  /// <li>
  /// The valid <code>personType</code> values are <code>Physical Person</code>
  /// and <code>Business</code>.
  /// </li>
  /// </ul>
  /// <b>Kenya</b>
  ///
  /// <ul>
  /// <li>
  /// You must specify the <code>personType</code> in the
  /// <code>kenyaAdditionalInfo</code> field of the
  /// <code>additionalTaxInformation</code> object.
  /// </li>
  /// <li>
  /// If the <code>personType</code> is <code>Physical Person</code>, you must
  /// specify the tax registration certificate document in the
  /// <code>taxRegistrationDocuments</code> field of the
  /// <code>VerificationDetails</code> object.
  /// </li>
  /// </ul>
  /// <b>Malaysia</b>
  ///
  /// <ul>
  /// <li>
  /// If you use this operation to set a tax registration number (TRN) in
  /// Malaysia, only resellers with a valid sales and service tax (SST) number
  /// are required to provide tax registration information.
  /// </li>
  /// <li>
  /// By using this API operation to set a TRN in Malaysia, Amazon Web Services
  /// will regard you as self-declaring that you're an authorized business
  /// reseller registered with the Royal Malaysia Customs Department (RMCD) and
  /// have a valid SST number.
  /// </li>
  /// <li>
  /// Amazon Web Services reserves the right to seek additional information
  /// and/or take other actions to support your self-declaration as appropriate.
  /// </li>
  /// <li>
  /// If you're not a reseller of Amazon Web Services, we don't recommend that
  /// you use this operation to set the TRN in Malaysia.
  /// </li>
  /// <li>
  /// Only use this API operation to upload the TRNs for accounts through which
  /// you're reselling Amazon Web Services.
  /// </li>
  /// <li>
  /// Amazon Web Services is currently registered under the following service
  /// tax codes. You must include at least one of the service tax codes in the
  /// service tax code strings to declare yourself as an authorized registered
  /// business reseller.
  ///
  /// Taxable service and service tax codes:
  ///
  /// Consultancy - 9907061674
  ///
  /// Training or coaching service - 9907071685
  ///
  /// IT service - 9907101676
  ///
  /// Digital services and electronic medium - 9907121690
  /// </li>
  /// </ul>
  /// <b>Nepal</b>
  ///
  /// <ul>
  /// <li>
  /// The sector valid values are <code>Business</code> and
  /// <code>Individual</code>.
  /// </li>
  /// </ul>
  /// <b>Saudi Arabia</b>
  ///
  /// <ul>
  /// <li>
  /// For <code>address</code>, you must specify <code>addressLine3</code>.
  /// </li>
  /// </ul>
  /// <b>South Korea</b>
  ///
  /// <ul>
  /// <li>
  /// You must specify the <code>certifiedEmailId</code> and
  /// <code>legalName</code> in the <code>TaxRegistrationEntry</code> object.
  /// Use Korean characters for <code>legalName</code>.
  /// </li>
  /// <li>
  /// You must specify the <code>businessRepresentativeName</code>,
  /// <code>itemOfBusiness</code>, and <code>lineOfBusiness</code> in the
  /// <code>southKoreaAdditionalInfo</code> field of the
  /// <code>additionalTaxInformation</code> object. Use Korean characters for
  /// these fields.
  /// </li>
  /// <li>
  /// You must specify the tax registration certificate document in the
  /// <code>taxRegistrationDocuments</code> field of the
  /// <code>VerificationDetails</code> object.
  /// </li>
  /// <li>
  /// For the <code>address</code> object, use Korean characters for
  /// <code>addressLine1</code>, <code>addressLine2</code> <code>city</code>,
  /// <code>postalCode</code>, and <code>stateOrRegion</code>.
  /// </li>
  /// </ul>
  /// <b>Spain</b>
  ///
  /// <ul>
  /// <li>
  /// You must specify the <code>registrationType</code> in the
  /// <code>spainAdditionalInfo</code> field of the
  /// <code>additionalTaxInformation</code> object.
  /// </li>
  /// <li>
  /// If the <code>registrationType</code> is <code>Local</code>, you must
  /// specify the tax registration certificate document in the
  /// <code>taxRegistrationDocuments</code> field of the
  /// <code>VerificationDetails</code> object.
  /// </li>
  /// </ul>
  /// <b>Turkey</b>
  ///
  /// <ul>
  /// <li>
  /// You must specify the <code>sector</code> in the
  /// <code>taxRegistrationEntry</code> object.
  /// </li>
  /// <li>
  /// If your <code>sector</code> is <code>Business</code>,
  /// <code>Individual</code>, or <code>Government</code>:
  ///
  /// <ul>
  /// <li>
  /// Specify the <code>taxOffice</code>. If your <code>sector</code> is
  /// <code>Individual</code>, don't enter this value.
  /// </li>
  /// <li>
  /// (Optional) Specify the <code>kepEmailId</code>. If your
  /// <code>sector</code> is <code>Individual</code>, don't enter this value.
  /// </li>
  /// <li>
  /// <b>Note:</b> In the <b>Tax Settings</b> page of the Billing console,
  /// <code>Government</code> appears as <b>Public institutions</b>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If your <code>sector</code> is <code>Business</code> and you're subject to
  /// KDV tax, you must specify your industry in the <code>industries</code>
  /// field.
  /// </li>
  /// <li>
  /// For <code>address</code>, you must specify <code>districtOrCounty</code>.
  /// </li>
  /// </ul>
  /// <b>Ukraine</b>
  ///
  /// <ul>
  /// <li>
  /// The sector valid values are <code>Business</code> and
  /// <code>Individual</code>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accountIds] :
  /// List of unique account identifiers.
  ///
  /// Parameter [taxRegistrationEntry] :
  /// Your TRN information that will be stored to the accounts mentioned in
  /// <code>putEntries</code>.
  Future<BatchPutTaxRegistrationResponse> batchPutTaxRegistration({
    required List<String> accountIds,
    required TaxRegistrationEntry taxRegistrationEntry,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
      'taxRegistrationEntry': taxRegistrationEntry,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchPutTaxRegistration',
      exceptionFnMap: _exceptionFns,
    );
    return BatchPutTaxRegistrationResponse.fromJson(response);
  }

  /// Deletes tax registration for a single account.
  /// <note>
  /// This API operation can't be used to delete your tax registration in
  /// Brazil. Use the <a
  /// href="https://console.aws.amazon.com/billing/home#/paymentpreferences/paymentmethods">Payment
  /// preferences</a> page in the Billing and Cost Management console instead.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accountId] :
  /// Unique account identifier for the TRN information that needs to be
  /// deleted. If this isn't passed, the account ID corresponding to the
  /// credentials of the API caller will be used for this parameter.
  Future<void> deleteTaxRegistration({
    String? accountId,
  }) async {
    final $payload = <String, dynamic>{
      if (accountId != null) 'accountId': accountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteTaxRegistration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves tax registration for a single account.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accountId] :
  /// Your unique account identifier.
  Future<GetTaxRegistrationResponse> getTaxRegistration({
    String? accountId,
  }) async {
    final $payload = <String, dynamic>{
      if (accountId != null) 'accountId': accountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetTaxRegistration',
      exceptionFnMap: _exceptionFns,
    );
    return GetTaxRegistrationResponse.fromJson(response);
  }

  /// Downloads your tax documents to the Amazon S3 bucket that you specify in
  /// your request.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [destinationS3Location] :
  /// The Amazon S3 bucket that you specify to download your tax documents to.
  ///
  /// Parameter [taxDocumentMetadata] :
  /// The metadata for your tax document.
  Future<GetTaxRegistrationDocumentResponse> getTaxRegistrationDocument({
    required DestinationS3Location destinationS3Location,
    required TaxDocumentMetadata taxDocumentMetadata,
  }) async {
    final $payload = <String, dynamic>{
      'destinationS3Location': destinationS3Location,
      'taxDocumentMetadata': taxDocumentMetadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetTaxRegistrationDocument',
      exceptionFnMap: _exceptionFns,
    );
    return GetTaxRegistrationDocumentResponse.fromJson(response);
  }

  /// Retrieves the tax registration of accounts listed in a consolidated
  /// billing family. This can be used to retrieve up to 100 accounts' tax
  /// registrations in one call (default 50).
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Number of <code>accountDetails</code> results you want in one response.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListTaxRegistrationsResponse> listTaxRegistrations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTaxRegistrations',
      exceptionFnMap: _exceptionFns,
    );
    return ListTaxRegistrationsResponse.fromJson(response);
  }

  /// Adds or updates tax registration for a single account. You can't set a TRN
  /// if there's a pending TRN. You'll need to delete the pending TRN first.
  ///
  /// To call this API operation for specific countries, see the following
  /// country-specific requirements.
  ///
  /// <b>Bangladesh</b>
  ///
  /// <ul>
  /// <li>
  /// You must specify the tax registration certificate document in the
  /// <code>taxRegistrationDocuments</code> field of the
  /// <code>VerificationDetails</code> object.
  /// </li>
  /// </ul>
  /// <b>Brazil</b>
  ///
  /// <ul>
  /// <li>
  /// You must complete the tax registration process in the <a
  /// href="https://console.aws.amazon.com/billing/home#/paymentpreferences/paymentmethods">Payment
  /// preferences</a> page in the Billing and Cost Management console. After
  /// your TRN and billing address are verified, you can call this API
  /// operation.
  /// </li>
  /// <li>
  /// For Amazon Web Services accounts created through Organizations, you can
  /// call this API operation when you don't have a billing address.
  /// </li>
  /// </ul>
  /// <b>Georgia</b>
  ///
  /// <ul>
  /// <li>
  /// The valid <code>personType</code> values are <code>Physical Person</code>
  /// and <code>Business</code>.
  /// </li>
  /// </ul>
  /// <b>Kenya</b>
  ///
  /// <ul>
  /// <li>
  /// You must specify the <code>personType</code> in the
  /// <code>kenyaAdditionalInfo</code> field of the
  /// <code>additionalTaxInformation</code> object.
  /// </li>
  /// <li>
  /// If the <code>personType</code> is <code>Physical Person</code>, you must
  /// specify the tax registration certificate document in the
  /// <code>taxRegistrationDocuments</code> field of the
  /// <code>VerificationDetails</code> object.
  /// </li>
  /// </ul>
  /// <b>Malaysia</b>
  ///
  /// <ul>
  /// <li>
  /// If you use this operation to set a tax registration number (TRN) in
  /// Malaysia, only resellers with a valid sales and service tax (SST) number
  /// are required to provide tax registration information.
  /// </li>
  /// <li>
  /// By using this API operation to set a TRN in Malaysia, Amazon Web Services
  /// will regard you as self-declaring that you're an authorized business
  /// reseller registered with the Royal Malaysia Customs Department (RMCD) and
  /// have a valid SST number.
  /// </li>
  /// <li>
  /// Amazon Web Services reserves the right to seek additional information
  /// and/or take other actions to support your self-declaration as appropriate.
  /// </li>
  /// <li>
  /// If you're not a reseller of Amazon Web Services, we don't recommend that
  /// you use this operation to set the TRN in Malaysia.
  /// </li>
  /// <li>
  /// Only use this API operation to upload the TRNs for accounts through which
  /// you're reselling Amazon Web Services.
  /// </li>
  /// <li>
  /// Amazon Web Services is currently registered under the following service
  /// tax codes. You must include at least one of the service tax codes in the
  /// service tax code strings to declare yourself as an authorized registered
  /// business reseller.
  ///
  /// Taxable service and service tax codes:
  ///
  /// Consultancy - 9907061674
  ///
  /// Training or coaching service - 9907071685
  ///
  /// IT service - 9907101676
  ///
  /// Digital services and electronic medium - 9907121690
  /// </li>
  /// </ul>
  /// <b>Nepal</b>
  ///
  /// <ul>
  /// <li>
  /// The sector valid values are <code>Business</code> and
  /// <code>Individual</code>.
  /// </li>
  /// </ul>
  /// <b>Saudi Arabia</b>
  ///
  /// <ul>
  /// <li>
  /// For <code>address</code>, you must specify <code>addressLine3</code>.
  /// </li>
  /// </ul>
  /// <b>South Korea</b>
  ///
  /// <ul>
  /// <li>
  /// You must specify the <code>certifiedEmailId</code> and
  /// <code>legalName</code> in the <code>TaxRegistrationEntry</code> object.
  /// Use Korean characters for <code>legalName</code>.
  /// </li>
  /// <li>
  /// You must specify the <code>businessRepresentativeName</code>,
  /// <code>itemOfBusiness</code>, and <code>lineOfBusiness</code> in the
  /// <code>southKoreaAdditionalInfo</code> field of the
  /// <code>additionalTaxInformation</code> object. Use Korean characters for
  /// these fields.
  /// </li>
  /// <li>
  /// You must specify the tax registration certificate document in the
  /// <code>taxRegistrationDocuments</code> field of the
  /// <code>VerificationDetails</code> object.
  /// </li>
  /// <li>
  /// For the <code>address</code> object, use Korean characters for
  /// <code>addressLine1</code>, <code>addressLine2</code> <code>city</code>,
  /// <code>postalCode</code>, and <code>stateOrRegion</code>.
  /// </li>
  /// </ul>
  /// <b>Spain</b>
  ///
  /// <ul>
  /// <li>
  /// You must specify the <code>registrationType</code> in the
  /// <code>spainAdditionalInfo</code> field of the
  /// <code>additionalTaxInformation</code> object.
  /// </li>
  /// <li>
  /// If the <code>registrationType</code> is <code>Local</code>, you must
  /// specify the tax registration certificate document in the
  /// <code>taxRegistrationDocuments</code> field of the
  /// <code>VerificationDetails</code> object.
  /// </li>
  /// </ul>
  /// <b>Turkey</b>
  ///
  /// <ul>
  /// <li>
  /// You must specify the <code>sector</code> in the
  /// <code>taxRegistrationEntry</code> object.
  /// </li>
  /// <li>
  /// If your <code>sector</code> is <code>Business</code>,
  /// <code>Individual</code>, or <code>Government</code>:
  ///
  /// <ul>
  /// <li>
  /// Specify the <code>taxOffice</code>. If your <code>sector</code> is
  /// <code>Individual</code>, don't enter this value.
  /// </li>
  /// <li>
  /// (Optional) Specify the <code>kepEmailId</code>. If your
  /// <code>sector</code> is <code>Individual</code>, don't enter this value.
  /// </li>
  /// <li>
  /// <b>Note:</b> In the <b>Tax Settings</b> page of the Billing console,
  /// <code>Government</code> appears as <b>Public institutions</b>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If your <code>sector</code> is <code>Business</code> and you're subject to
  /// KDV tax, you must specify your industry in the <code>industries</code>
  /// field.
  /// </li>
  /// <li>
  /// For <code>address</code>, you must specify <code>districtOrCounty</code>.
  /// </li>
  /// </ul>
  /// <b>Ukraine</b>
  ///
  /// <ul>
  /// <li>
  /// The sector valid values are <code>Business</code> and
  /// <code>Individual</code>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [taxRegistrationEntry] :
  /// Your TRN information that will be stored to the account mentioned in
  /// <code>accountId</code>.
  ///
  /// Parameter [accountId] :
  /// Your unique account identifier.
  Future<PutTaxRegistrationResponse> putTaxRegistration({
    required TaxRegistrationEntry taxRegistrationEntry,
    String? accountId,
  }) async {
    final $payload = <String, dynamic>{
      'taxRegistrationEntry': taxRegistrationEntry,
      if (accountId != null) 'accountId': accountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutTaxRegistration',
      exceptionFnMap: _exceptionFns,
    );
    return PutTaxRegistrationResponse.fromJson(response);
  }
}

/// An object with your <code>accountId</code> and TRN information.
class AccountDetails {
  /// List of unique account identifiers.
  final String? accountId;

  /// The meta data information associated with the account.
  final AccountMetaData? accountMetaData;

  /// Tax inheritance information associated with the account.
  final TaxInheritanceDetails? taxInheritanceDetails;

  /// Your TRN information. Instead of having full legal address, here TRN
  /// information will have jurisdiction details (for example, country code and
  /// state/region/province if applicable).
  final TaxRegistrationWithJurisdiction? taxRegistration;

  AccountDetails({
    this.accountId,
    this.accountMetaData,
    this.taxInheritanceDetails,
    this.taxRegistration,
  });

  factory AccountDetails.fromJson(Map<String, dynamic> json) {
    return AccountDetails(
      accountId: json['accountId'] as String?,
      accountMetaData: json['accountMetaData'] != null
          ? AccountMetaData.fromJson(
              json['accountMetaData'] as Map<String, dynamic>)
          : null,
      taxInheritanceDetails: json['taxInheritanceDetails'] != null
          ? TaxInheritanceDetails.fromJson(
              json['taxInheritanceDetails'] as Map<String, dynamic>)
          : null,
      taxRegistration: json['taxRegistration'] != null
          ? TaxRegistrationWithJurisdiction.fromJson(
              json['taxRegistration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final accountMetaData = this.accountMetaData;
    final taxInheritanceDetails = this.taxInheritanceDetails;
    final taxRegistration = this.taxRegistration;
    return {
      if (accountId != null) 'accountId': accountId,
      if (accountMetaData != null) 'accountMetaData': accountMetaData,
      if (taxInheritanceDetails != null)
        'taxInheritanceDetails': taxInheritanceDetails,
      if (taxRegistration != null) 'taxRegistration': taxRegistration,
    };
  }
}

/// The meta data information associated with the account.
class AccountMetaData {
  /// The Amazon Web Services accounts name.
  final String? accountName;
  final Address? address;

  /// Address roles associated with the account containing country code
  /// information.
  final Map<AddressRoleType, Jurisdiction>? addressRoleMap;

  /// The type of address associated with the legal profile.
  final AddressRoleType? addressType;

  /// Seller information associated with the account.
  final String? seller;

  AccountMetaData({
    this.accountName,
    this.address,
    this.addressRoleMap,
    this.addressType,
    this.seller,
  });

  factory AccountMetaData.fromJson(Map<String, dynamic> json) {
    return AccountMetaData(
      accountName: json['accountName'] as String?,
      address: json['address'] != null
          ? Address.fromJson(json['address'] as Map<String, dynamic>)
          : null,
      addressRoleMap: (json['addressRoleMap'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k.toAddressRoleType(),
              Jurisdiction.fromJson(e as Map<String, dynamic>))),
      addressType: (json['addressType'] as String?)?.toAddressRoleType(),
      seller: json['seller'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountName = this.accountName;
    final address = this.address;
    final addressRoleMap = this.addressRoleMap;
    final addressType = this.addressType;
    final seller = this.seller;
    return {
      if (accountName != null) 'accountName': accountName,
      if (address != null) 'address': address,
      if (addressRoleMap != null)
        'addressRoleMap':
            addressRoleMap.map((k, e) => MapEntry(k.toValue(), e)),
      if (addressType != null) 'addressType': addressType.toValue(),
      if (seller != null) 'seller': seller,
    };
  }
}

/// Additional tax information associated with your tax registration number
/// (TRN). Depending on the TRN for a specific country, you might need to
/// specify this information when you set your TRN.
///
/// You can only specify one of the following parameters and the value can't be
/// empty.
/// <note>
/// The parameter that you specify must match the country for the TRN, if
/// available. For example, if you set a TRN in Canada for specific provinces,
/// you must also specify the <code>canadaAdditionalInfo</code> parameter.
/// </note>
class AdditionalInfoRequest {
  /// Additional tax information associated with your TRN in Canada.
  final CanadaAdditionalInfo? canadaAdditionalInfo;

  /// Additional tax information to specify for a TRN in Estonia.
  final EstoniaAdditionalInfo? estoniaAdditionalInfo;

  /// Additional tax information to specify for a TRN in Georgia.
  final GeorgiaAdditionalInfo? georgiaAdditionalInfo;

  /// Additional tax information to specify for a TRN in Israel.
  final IsraelAdditionalInfo? israelAdditionalInfo;

  /// Additional tax information to specify for a TRN in Italy.
  final ItalyAdditionalInfo? italyAdditionalInfo;

  /// Additional tax information to specify for a TRN in Kenya.
  final KenyaAdditionalInfo? kenyaAdditionalInfo;

  /// Additional tax information to specify for a TRN in Malaysia.
  final MalaysiaAdditionalInfo? malaysiaAdditionalInfo;

  /// Additional tax information associated with your TRN in Poland.
  final PolandAdditionalInfo? polandAdditionalInfo;

  /// Additional tax information to specify for a TRN in Romania.
  final RomaniaAdditionalInfo? romaniaAdditionalInfo;

  /// Additional tax information associated with your TRN in Saudi Arabia.
  final SaudiArabiaAdditionalInfo? saudiArabiaAdditionalInfo;

  /// Additional tax information to specify for a TRN in South Korea.
  final SouthKoreaAdditionalInfo? southKoreaAdditionalInfo;

  /// Additional tax information to specify for a TRN in Spain.
  final SpainAdditionalInfo? spainAdditionalInfo;

  /// Additional tax information to specify for a TRN in Turkey.
  final TurkeyAdditionalInfo? turkeyAdditionalInfo;

  /// Additional tax information associated with your TRN in Ukraine.
  final UkraineAdditionalInfo? ukraineAdditionalInfo;

  AdditionalInfoRequest({
    this.canadaAdditionalInfo,
    this.estoniaAdditionalInfo,
    this.georgiaAdditionalInfo,
    this.israelAdditionalInfo,
    this.italyAdditionalInfo,
    this.kenyaAdditionalInfo,
    this.malaysiaAdditionalInfo,
    this.polandAdditionalInfo,
    this.romaniaAdditionalInfo,
    this.saudiArabiaAdditionalInfo,
    this.southKoreaAdditionalInfo,
    this.spainAdditionalInfo,
    this.turkeyAdditionalInfo,
    this.ukraineAdditionalInfo,
  });

  Map<String, dynamic> toJson() {
    final canadaAdditionalInfo = this.canadaAdditionalInfo;
    final estoniaAdditionalInfo = this.estoniaAdditionalInfo;
    final georgiaAdditionalInfo = this.georgiaAdditionalInfo;
    final israelAdditionalInfo = this.israelAdditionalInfo;
    final italyAdditionalInfo = this.italyAdditionalInfo;
    final kenyaAdditionalInfo = this.kenyaAdditionalInfo;
    final malaysiaAdditionalInfo = this.malaysiaAdditionalInfo;
    final polandAdditionalInfo = this.polandAdditionalInfo;
    final romaniaAdditionalInfo = this.romaniaAdditionalInfo;
    final saudiArabiaAdditionalInfo = this.saudiArabiaAdditionalInfo;
    final southKoreaAdditionalInfo = this.southKoreaAdditionalInfo;
    final spainAdditionalInfo = this.spainAdditionalInfo;
    final turkeyAdditionalInfo = this.turkeyAdditionalInfo;
    final ukraineAdditionalInfo = this.ukraineAdditionalInfo;
    return {
      if (canadaAdditionalInfo != null)
        'canadaAdditionalInfo': canadaAdditionalInfo,
      if (estoniaAdditionalInfo != null)
        'estoniaAdditionalInfo': estoniaAdditionalInfo,
      if (georgiaAdditionalInfo != null)
        'georgiaAdditionalInfo': georgiaAdditionalInfo,
      if (israelAdditionalInfo != null)
        'israelAdditionalInfo': israelAdditionalInfo,
      if (italyAdditionalInfo != null)
        'italyAdditionalInfo': italyAdditionalInfo,
      if (kenyaAdditionalInfo != null)
        'kenyaAdditionalInfo': kenyaAdditionalInfo,
      if (malaysiaAdditionalInfo != null)
        'malaysiaAdditionalInfo': malaysiaAdditionalInfo,
      if (polandAdditionalInfo != null)
        'polandAdditionalInfo': polandAdditionalInfo,
      if (romaniaAdditionalInfo != null)
        'romaniaAdditionalInfo': romaniaAdditionalInfo,
      if (saudiArabiaAdditionalInfo != null)
        'saudiArabiaAdditionalInfo': saudiArabiaAdditionalInfo,
      if (southKoreaAdditionalInfo != null)
        'southKoreaAdditionalInfo': southKoreaAdditionalInfo,
      if (spainAdditionalInfo != null)
        'spainAdditionalInfo': spainAdditionalInfo,
      if (turkeyAdditionalInfo != null)
        'turkeyAdditionalInfo': turkeyAdditionalInfo,
      if (ukraineAdditionalInfo != null)
        'ukraineAdditionalInfo': ukraineAdditionalInfo,
    };
  }
}

/// Additional tax information associated with your TRN. The Tax Settings API
/// returns country-specific information in the response when any additional
/// information is present with your TRN for the following countries.
class AdditionalInfoResponse {
  /// Additional tax information associated with your TRN in Brazil. The Tax
  /// Settings API returns this information in your response when any additional
  /// information is present with your TRN in Brazil.
  final BrazilAdditionalInfo? brazilAdditionalInfo;

  /// Additional tax information associated with your TRN in Canada.
  final CanadaAdditionalInfo? canadaAdditionalInfo;

  /// Additional tax information associated with your TRN in Estonia.
  final EstoniaAdditionalInfo? estoniaAdditionalInfo;

  /// Additional tax information associated with your TRN in Georgia.
  final GeorgiaAdditionalInfo? georgiaAdditionalInfo;

  /// Additional tax information in India.
  final IndiaAdditionalInfo? indiaAdditionalInfo;

  /// Additional tax information associated with your TRN in Israel.
  final IsraelAdditionalInfo? israelAdditionalInfo;

  /// Additional tax information associated with your TRN in Italy.
  final ItalyAdditionalInfo? italyAdditionalInfo;

  /// Additional tax information associated with your TRN in Kenya.
  final KenyaAdditionalInfo? kenyaAdditionalInfo;

  /// Additional tax information associated with your TRN in Malaysia.
  final MalaysiaAdditionalInfo? malaysiaAdditionalInfo;

  /// Additional tax information associated with your TRN in Poland.
  final PolandAdditionalInfo? polandAdditionalInfo;

  /// Additional tax information to specify for a TRN in Romania.
  final RomaniaAdditionalInfo? romaniaAdditionalInfo;

  /// Additional tax information associated with your TRN in Saudi Arabia.
  final SaudiArabiaAdditionalInfo? saudiArabiaAdditionalInfo;

  /// Additional tax information associated with your TRN in South Korea.
  final SouthKoreaAdditionalInfo? southKoreaAdditionalInfo;

  /// Additional tax information associated with your TRN in Spain.
  final SpainAdditionalInfo? spainAdditionalInfo;

  /// Additional tax information associated with your TRN in Turkey.
  final TurkeyAdditionalInfo? turkeyAdditionalInfo;

  /// Additional tax information associated with your TRN in Ukraine.
  final UkraineAdditionalInfo? ukraineAdditionalInfo;

  AdditionalInfoResponse({
    this.brazilAdditionalInfo,
    this.canadaAdditionalInfo,
    this.estoniaAdditionalInfo,
    this.georgiaAdditionalInfo,
    this.indiaAdditionalInfo,
    this.israelAdditionalInfo,
    this.italyAdditionalInfo,
    this.kenyaAdditionalInfo,
    this.malaysiaAdditionalInfo,
    this.polandAdditionalInfo,
    this.romaniaAdditionalInfo,
    this.saudiArabiaAdditionalInfo,
    this.southKoreaAdditionalInfo,
    this.spainAdditionalInfo,
    this.turkeyAdditionalInfo,
    this.ukraineAdditionalInfo,
  });

  factory AdditionalInfoResponse.fromJson(Map<String, dynamic> json) {
    return AdditionalInfoResponse(
      brazilAdditionalInfo: json['brazilAdditionalInfo'] != null
          ? BrazilAdditionalInfo.fromJson(
              json['brazilAdditionalInfo'] as Map<String, dynamic>)
          : null,
      canadaAdditionalInfo: json['canadaAdditionalInfo'] != null
          ? CanadaAdditionalInfo.fromJson(
              json['canadaAdditionalInfo'] as Map<String, dynamic>)
          : null,
      estoniaAdditionalInfo: json['estoniaAdditionalInfo'] != null
          ? EstoniaAdditionalInfo.fromJson(
              json['estoniaAdditionalInfo'] as Map<String, dynamic>)
          : null,
      georgiaAdditionalInfo: json['georgiaAdditionalInfo'] != null
          ? GeorgiaAdditionalInfo.fromJson(
              json['georgiaAdditionalInfo'] as Map<String, dynamic>)
          : null,
      indiaAdditionalInfo: json['indiaAdditionalInfo'] != null
          ? IndiaAdditionalInfo.fromJson(
              json['indiaAdditionalInfo'] as Map<String, dynamic>)
          : null,
      israelAdditionalInfo: json['israelAdditionalInfo'] != null
          ? IsraelAdditionalInfo.fromJson(
              json['israelAdditionalInfo'] as Map<String, dynamic>)
          : null,
      italyAdditionalInfo: json['italyAdditionalInfo'] != null
          ? ItalyAdditionalInfo.fromJson(
              json['italyAdditionalInfo'] as Map<String, dynamic>)
          : null,
      kenyaAdditionalInfo: json['kenyaAdditionalInfo'] != null
          ? KenyaAdditionalInfo.fromJson(
              json['kenyaAdditionalInfo'] as Map<String, dynamic>)
          : null,
      malaysiaAdditionalInfo: json['malaysiaAdditionalInfo'] != null
          ? MalaysiaAdditionalInfo.fromJson(
              json['malaysiaAdditionalInfo'] as Map<String, dynamic>)
          : null,
      polandAdditionalInfo: json['polandAdditionalInfo'] != null
          ? PolandAdditionalInfo.fromJson(
              json['polandAdditionalInfo'] as Map<String, dynamic>)
          : null,
      romaniaAdditionalInfo: json['romaniaAdditionalInfo'] != null
          ? RomaniaAdditionalInfo.fromJson(
              json['romaniaAdditionalInfo'] as Map<String, dynamic>)
          : null,
      saudiArabiaAdditionalInfo: json['saudiArabiaAdditionalInfo'] != null
          ? SaudiArabiaAdditionalInfo.fromJson(
              json['saudiArabiaAdditionalInfo'] as Map<String, dynamic>)
          : null,
      southKoreaAdditionalInfo: json['southKoreaAdditionalInfo'] != null
          ? SouthKoreaAdditionalInfo.fromJson(
              json['southKoreaAdditionalInfo'] as Map<String, dynamic>)
          : null,
      spainAdditionalInfo: json['spainAdditionalInfo'] != null
          ? SpainAdditionalInfo.fromJson(
              json['spainAdditionalInfo'] as Map<String, dynamic>)
          : null,
      turkeyAdditionalInfo: json['turkeyAdditionalInfo'] != null
          ? TurkeyAdditionalInfo.fromJson(
              json['turkeyAdditionalInfo'] as Map<String, dynamic>)
          : null,
      ukraineAdditionalInfo: json['ukraineAdditionalInfo'] != null
          ? UkraineAdditionalInfo.fromJson(
              json['ukraineAdditionalInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final brazilAdditionalInfo = this.brazilAdditionalInfo;
    final canadaAdditionalInfo = this.canadaAdditionalInfo;
    final estoniaAdditionalInfo = this.estoniaAdditionalInfo;
    final georgiaAdditionalInfo = this.georgiaAdditionalInfo;
    final indiaAdditionalInfo = this.indiaAdditionalInfo;
    final israelAdditionalInfo = this.israelAdditionalInfo;
    final italyAdditionalInfo = this.italyAdditionalInfo;
    final kenyaAdditionalInfo = this.kenyaAdditionalInfo;
    final malaysiaAdditionalInfo = this.malaysiaAdditionalInfo;
    final polandAdditionalInfo = this.polandAdditionalInfo;
    final romaniaAdditionalInfo = this.romaniaAdditionalInfo;
    final saudiArabiaAdditionalInfo = this.saudiArabiaAdditionalInfo;
    final southKoreaAdditionalInfo = this.southKoreaAdditionalInfo;
    final spainAdditionalInfo = this.spainAdditionalInfo;
    final turkeyAdditionalInfo = this.turkeyAdditionalInfo;
    final ukraineAdditionalInfo = this.ukraineAdditionalInfo;
    return {
      if (brazilAdditionalInfo != null)
        'brazilAdditionalInfo': brazilAdditionalInfo,
      if (canadaAdditionalInfo != null)
        'canadaAdditionalInfo': canadaAdditionalInfo,
      if (estoniaAdditionalInfo != null)
        'estoniaAdditionalInfo': estoniaAdditionalInfo,
      if (georgiaAdditionalInfo != null)
        'georgiaAdditionalInfo': georgiaAdditionalInfo,
      if (indiaAdditionalInfo != null)
        'indiaAdditionalInfo': indiaAdditionalInfo,
      if (israelAdditionalInfo != null)
        'israelAdditionalInfo': israelAdditionalInfo,
      if (italyAdditionalInfo != null)
        'italyAdditionalInfo': italyAdditionalInfo,
      if (kenyaAdditionalInfo != null)
        'kenyaAdditionalInfo': kenyaAdditionalInfo,
      if (malaysiaAdditionalInfo != null)
        'malaysiaAdditionalInfo': malaysiaAdditionalInfo,
      if (polandAdditionalInfo != null)
        'polandAdditionalInfo': polandAdditionalInfo,
      if (romaniaAdditionalInfo != null)
        'romaniaAdditionalInfo': romaniaAdditionalInfo,
      if (saudiArabiaAdditionalInfo != null)
        'saudiArabiaAdditionalInfo': saudiArabiaAdditionalInfo,
      if (southKoreaAdditionalInfo != null)
        'southKoreaAdditionalInfo': southKoreaAdditionalInfo,
      if (spainAdditionalInfo != null)
        'spainAdditionalInfo': spainAdditionalInfo,
      if (turkeyAdditionalInfo != null)
        'turkeyAdditionalInfo': turkeyAdditionalInfo,
      if (ukraineAdditionalInfo != null)
        'ukraineAdditionalInfo': ukraineAdditionalInfo,
    };
  }
}

/// The details of the address associated with the TRN information.
class Address {
  /// The first line of the address.
  final String addressLine1;

  /// The city that the address is in.
  final String city;

  /// The country code for the country that the address is in.
  final String countryCode;

  /// The postal code associated with the address.
  final String postalCode;

  /// The second line of the address, if applicable.
  final String? addressLine2;

  /// The third line of the address, if applicable. Currently, the Tax Settings
  /// API accepts the <code>addressLine3</code> parameter only for Saudi Arabia.
  /// When you specify a TRN in Saudi Arabia, you must enter the
  /// <code>addressLine3</code> and specify the building number for the address.
  /// For example, you might enter <code>1234</code>.
  final String? addressLine3;

  /// The district or county the address is located.
  /// <note>
  /// For addresses in Brazil, this parameter uses the name of the neighborhood.
  /// When you set a TRN in Brazil, use <code>districtOrCounty</code> for the
  /// neighborhood name.
  /// </note>
  final String? districtOrCounty;

  /// The state, region, or province that the address is located.
  ///
  /// If this is required for tax settings, use the same name as shown on the
  /// <b>Tax Settings</b> page.
  final String? stateOrRegion;

  Address({
    required this.addressLine1,
    required this.city,
    required this.countryCode,
    required this.postalCode,
    this.addressLine2,
    this.addressLine3,
    this.districtOrCounty,
    this.stateOrRegion,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressLine1: json['addressLine1'] as String,
      city: json['city'] as String,
      countryCode: json['countryCode'] as String,
      postalCode: json['postalCode'] as String,
      addressLine2: json['addressLine2'] as String?,
      addressLine3: json['addressLine3'] as String?,
      districtOrCounty: json['districtOrCounty'] as String?,
      stateOrRegion: json['stateOrRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addressLine1 = this.addressLine1;
    final city = this.city;
    final countryCode = this.countryCode;
    final postalCode = this.postalCode;
    final addressLine2 = this.addressLine2;
    final addressLine3 = this.addressLine3;
    final districtOrCounty = this.districtOrCounty;
    final stateOrRegion = this.stateOrRegion;
    return {
      'addressLine1': addressLine1,
      'city': city,
      'countryCode': countryCode,
      'postalCode': postalCode,
      if (addressLine2 != null) 'addressLine2': addressLine2,
      if (addressLine3 != null) 'addressLine3': addressLine3,
      if (districtOrCounty != null) 'districtOrCounty': districtOrCounty,
      if (stateOrRegion != null) 'stateOrRegion': stateOrRegion,
    };
  }
}

enum AddressRoleType {
  taxAddress,
  billingAddress,
  contactAddress,
}

extension AddressRoleTypeValueExtension on AddressRoleType {
  String toValue() {
    switch (this) {
      case AddressRoleType.taxAddress:
        return 'TaxAddress';
      case AddressRoleType.billingAddress:
        return 'BillingAddress';
      case AddressRoleType.contactAddress:
        return 'ContactAddress';
    }
  }
}

extension AddressRoleTypeFromString on String {
  AddressRoleType toAddressRoleType() {
    switch (this) {
      case 'TaxAddress':
        return AddressRoleType.taxAddress;
      case 'BillingAddress':
        return AddressRoleType.billingAddress;
      case 'ContactAddress':
        return AddressRoleType.contactAddress;
    }
    throw Exception('$this is not known in enum AddressRoleType');
  }
}

/// The error object for representing failures in the
/// <code>BatchDeleteTaxRegistration</code> operation.
class BatchDeleteTaxRegistrationError {
  /// The unique account identifier for the account whose tax registration
  /// couldn't be deleted during the <code>BatchDeleteTaxRegistration</code>
  /// operation.
  final String accountId;

  /// The error message for an individual failure in the
  /// <code>BatchDeleteTaxRegistration</code> operation.
  final String message;

  /// The error code for an individual failure in BatchDeleteTaxRegistration
  /// operation.
  final String? code;

  BatchDeleteTaxRegistrationError({
    required this.accountId,
    required this.message,
    this.code,
  });

  factory BatchDeleteTaxRegistrationError.fromJson(Map<String, dynamic> json) {
    return BatchDeleteTaxRegistrationError(
      accountId: json['accountId'] as String,
      message: json['message'] as String,
      code: json['code'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final message = this.message;
    final code = this.code;
    return {
      'accountId': accountId,
      'message': message,
      if (code != null) 'code': code,
    };
  }
}

class BatchDeleteTaxRegistrationResponse {
  /// The list of errors for the accounts the TRN information could not be deleted
  /// for.
  final List<BatchDeleteTaxRegistrationError> errors;

  BatchDeleteTaxRegistrationResponse({
    required this.errors,
  });

  factory BatchDeleteTaxRegistrationResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteTaxRegistrationResponse(
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => BatchDeleteTaxRegistrationError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'errors': errors,
    };
  }
}

/// The error object for representing failures in the
/// <code>BatchPutTaxRegistration</code> operation.
class BatchPutTaxRegistrationError {
  /// The unique account identifier for the account that the tax registration
  /// couldn't be added, or updated during the
  /// <code>BatchPutTaxRegistration</code> operation.
  final String accountId;

  /// The error message for an individual failure in the
  /// <code>BatchPutTaxRegistration</code> operation.
  final String message;

  /// The error code for an individual failure in the
  /// <code>BatchPutTaxRegistration</code> operation.
  final String? code;

  BatchPutTaxRegistrationError({
    required this.accountId,
    required this.message,
    this.code,
  });

  factory BatchPutTaxRegistrationError.fromJson(Map<String, dynamic> json) {
    return BatchPutTaxRegistrationError(
      accountId: json['accountId'] as String,
      message: json['message'] as String,
      code: json['code'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final message = this.message;
    final code = this.code;
    return {
      'accountId': accountId,
      'message': message,
      if (code != null) 'code': code,
    };
  }
}

class BatchPutTaxRegistrationResponse {
  /// List of errors for the accounts the TRN information could not be added or
  /// updated to.
  final List<BatchPutTaxRegistrationError> errors;

  /// The status of your TRN stored in the system after processing. Based on the
  /// validation occurring on the TRN, the status can be <code>Verified</code>,
  /// <code>Pending</code> or <code>Rejected</code>.
  final TaxRegistrationStatus? status;

  BatchPutTaxRegistrationResponse({
    required this.errors,
    this.status,
  });

  factory BatchPutTaxRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return BatchPutTaxRegistrationResponse(
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) =>
              BatchPutTaxRegistrationError.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toTaxRegistrationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final status = this.status;
    return {
      'errors': errors,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Additional tax information associated with your TRN in Brazil.
class BrazilAdditionalInfo {
  /// The Cadastro de Contribuintes Mobiliários (CCM) code for your TRN in Brazil.
  /// This only applies for a CNPJ tax type for the São Paulo municipality.
  final String? ccmCode;

  /// Legal nature of business, based on your TRN in Brazil. This only applies for
  /// a CNPJ tax type.
  final String? legalNatureCode;

  BrazilAdditionalInfo({
    this.ccmCode,
    this.legalNatureCode,
  });

  factory BrazilAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return BrazilAdditionalInfo(
      ccmCode: json['ccmCode'] as String?,
      legalNatureCode: json['legalNatureCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ccmCode = this.ccmCode;
    final legalNatureCode = this.legalNatureCode;
    return {
      if (ccmCode != null) 'ccmCode': ccmCode,
      if (legalNatureCode != null) 'legalNatureCode': legalNatureCode,
    };
  }
}

/// Additional tax information associated with your TRN in Canada .
class CanadaAdditionalInfo {
  /// The Quebec Sales Tax ID number. Leave blank if you do not have a Quebec
  /// Sales Tax ID number.
  final String? canadaQuebecSalesTaxNumber;

  /// Manitoba Retail Sales Tax ID number. Customers purchasing Amazon Web
  /// Services for resale in Manitoba must provide a valid Retail Sales Tax ID
  /// number for Manitoba. Leave this blank if you do not have a Retail Sales Tax
  /// ID number in Manitoba or are not purchasing Amazon Web Services for resale.
  final String? canadaRetailSalesTaxNumber;

  /// The value for this parameter must be <code>true</code> if the
  /// <code>provincialSalesTaxId</code> value is provided for a TRN in British
  /// Columbia, Saskatchewan, or Manitoba provinces.
  ///
  /// To claim a provincial sales tax (PST) and retail sales tax (RST) reseller
  /// exemption, you must confirm that purchases from this account were made for
  /// resale. Otherwise, remove the PST or RST number from the
  /// <code>provincialSalesTaxId</code> parameter from your request.
  final bool? isResellerAccount;

  /// The provincial sales tax ID for your TRN in Canada. This parameter can
  /// represent the following:
  ///
  /// <ul>
  /// <li>
  /// Provincial sales tax ID number for British Columbia and Saskatchewan
  /// provinces
  /// </li>
  /// <li>
  /// Manitoba retail sales tax ID number for Manitoba province
  /// </li>
  /// <li>
  /// Quebec sales tax ID number for Quebec province
  /// </li>
  /// </ul>
  /// The Tax Setting API only accepts this parameter if the TRN is specified for
  /// the previous provinces. For other provinces, the Tax Settings API doesn't
  /// accept this parameter.
  final String? provincialSalesTaxId;

  CanadaAdditionalInfo({
    this.canadaQuebecSalesTaxNumber,
    this.canadaRetailSalesTaxNumber,
    this.isResellerAccount,
    this.provincialSalesTaxId,
  });

  factory CanadaAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return CanadaAdditionalInfo(
      canadaQuebecSalesTaxNumber: json['canadaQuebecSalesTaxNumber'] as String?,
      canadaRetailSalesTaxNumber: json['canadaRetailSalesTaxNumber'] as String?,
      isResellerAccount: json['isResellerAccount'] as bool?,
      provincialSalesTaxId: json['provincialSalesTaxId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final canadaQuebecSalesTaxNumber = this.canadaQuebecSalesTaxNumber;
    final canadaRetailSalesTaxNumber = this.canadaRetailSalesTaxNumber;
    final isResellerAccount = this.isResellerAccount;
    final provincialSalesTaxId = this.provincialSalesTaxId;
    return {
      if (canadaQuebecSalesTaxNumber != null)
        'canadaQuebecSalesTaxNumber': canadaQuebecSalesTaxNumber,
      if (canadaRetailSalesTaxNumber != null)
        'canadaRetailSalesTaxNumber': canadaRetailSalesTaxNumber,
      if (isResellerAccount != null) 'isResellerAccount': isResellerAccount,
      if (provincialSalesTaxId != null)
        'provincialSalesTaxId': provincialSalesTaxId,
    };
  }
}

class DeleteTaxRegistrationResponse {
  DeleteTaxRegistrationResponse();

  factory DeleteTaxRegistrationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTaxRegistrationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The location of the Amazon S3 bucket that you specify to download your tax
/// documents to.
class DestinationS3Location {
  /// The name of your Amazon S3 bucket that you specify to download your tax
  /// documents to.
  final String bucket;

  /// The Amazon S3 object prefix that you specify for your tax document file.
  final String? prefix;

  DestinationS3Location({
    required this.bucket,
    this.prefix,
  });

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      'bucket': bucket,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Additional tax information associated with your TRN in Estonia.
class EstoniaAdditionalInfo {
  /// Registry commercial code (RCC) for your TRN in Estonia. This value is an
  /// eight-numeric string, such as <code>12345678</code>.
  final String registryCommercialCode;

  EstoniaAdditionalInfo({
    required this.registryCommercialCode,
  });

  factory EstoniaAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return EstoniaAdditionalInfo(
      registryCommercialCode: json['registryCommercialCode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final registryCommercialCode = this.registryCommercialCode;
    return {
      'registryCommercialCode': registryCommercialCode,
    };
  }
}

/// Additional tax information associated with your TRN in Georgia.
class GeorgiaAdditionalInfo {
  /// The legal person or physical person assigned to this TRN in Georgia.
  final PersonType personType;

  GeorgiaAdditionalInfo({
    required this.personType,
  });

  factory GeorgiaAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return GeorgiaAdditionalInfo(
      personType: (json['personType'] as String).toPersonType(),
    );
  }

  Map<String, dynamic> toJson() {
    final personType = this.personType;
    return {
      'personType': personType.toValue(),
    };
  }
}

class GetTaxRegistrationDocumentResponse {
  /// The file path of the Amazon S3 bucket where you want to download your tax
  /// document to.
  final String? destinationFilePath;

  GetTaxRegistrationDocumentResponse({
    this.destinationFilePath,
  });

  factory GetTaxRegistrationDocumentResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTaxRegistrationDocumentResponse(
      destinationFilePath: json['destinationFilePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationFilePath = this.destinationFilePath;
    return {
      if (destinationFilePath != null)
        'destinationFilePath': destinationFilePath,
    };
  }
}

class GetTaxRegistrationResponse {
  /// TRN information of the account mentioned in the request.
  final TaxRegistration? taxRegistration;

  GetTaxRegistrationResponse({
    this.taxRegistration,
  });

  factory GetTaxRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return GetTaxRegistrationResponse(
      taxRegistration: json['taxRegistration'] != null
          ? TaxRegistration.fromJson(
              json['taxRegistration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final taxRegistration = this.taxRegistration;
    return {
      if (taxRegistration != null) 'taxRegistration': taxRegistration,
    };
  }
}

/// Additional tax information in India.
class IndiaAdditionalInfo {
  /// India pan information associated with the account.
  final String? pan;

  IndiaAdditionalInfo({
    this.pan,
  });

  factory IndiaAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return IndiaAdditionalInfo(
      pan: json['pan'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pan = this.pan;
    return {
      if (pan != null) 'pan': pan,
    };
  }
}

enum Industries {
  circulatingOrg,
  professionalOrg,
  banks,
  insurance,
  pensionAndBenefitFunds,
  developmentAgencies,
}

extension IndustriesValueExtension on Industries {
  String toValue() {
    switch (this) {
      case Industries.circulatingOrg:
        return 'CirculatingOrg';
      case Industries.professionalOrg:
        return 'ProfessionalOrg';
      case Industries.banks:
        return 'Banks';
      case Industries.insurance:
        return 'Insurance';
      case Industries.pensionAndBenefitFunds:
        return 'PensionAndBenefitFunds';
      case Industries.developmentAgencies:
        return 'DevelopmentAgencies';
    }
  }
}

extension IndustriesFromString on String {
  Industries toIndustries() {
    switch (this) {
      case 'CirculatingOrg':
        return Industries.circulatingOrg;
      case 'ProfessionalOrg':
        return Industries.professionalOrg;
      case 'Banks':
        return Industries.banks;
      case 'Insurance':
        return Industries.insurance;
      case 'PensionAndBenefitFunds':
        return Industries.pensionAndBenefitFunds;
      case 'DevelopmentAgencies':
        return Industries.developmentAgencies;
    }
    throw Exception('$this is not known in enum Industries');
  }
}

/// Additional tax information associated with your TRN in Israel.
class IsraelAdditionalInfo {
  /// Customer type for your TRN in Israel. The value can be <code>Business</code>
  /// or <code>Individual</code>. Use <code>Business</code>for entities such as
  /// not-for-profit and financial institutions.
  final IsraelCustomerType customerType;

  /// Dealer type for your TRN in Israel. If you're not a local authorized dealer
  /// with an Israeli VAT ID, specify your tax identification number so that
  /// Amazon Web Services can send you a compliant tax invoice.
  final IsraelDealerType dealerType;

  IsraelAdditionalInfo({
    required this.customerType,
    required this.dealerType,
  });

  factory IsraelAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return IsraelAdditionalInfo(
      customerType: (json['customerType'] as String).toIsraelCustomerType(),
      dealerType: (json['dealerType'] as String).toIsraelDealerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final customerType = this.customerType;
    final dealerType = this.dealerType;
    return {
      'customerType': customerType.toValue(),
      'dealerType': dealerType.toValue(),
    };
  }
}

enum IsraelCustomerType {
  business,
  individual,
}

extension IsraelCustomerTypeValueExtension on IsraelCustomerType {
  String toValue() {
    switch (this) {
      case IsraelCustomerType.business:
        return 'Business';
      case IsraelCustomerType.individual:
        return 'Individual';
    }
  }
}

extension IsraelCustomerTypeFromString on String {
  IsraelCustomerType toIsraelCustomerType() {
    switch (this) {
      case 'Business':
        return IsraelCustomerType.business;
      case 'Individual':
        return IsraelCustomerType.individual;
    }
    throw Exception('$this is not known in enum IsraelCustomerType');
  }
}

enum IsraelDealerType {
  authorized,
  nonAuthorized,
}

extension IsraelDealerTypeValueExtension on IsraelDealerType {
  String toValue() {
    switch (this) {
      case IsraelDealerType.authorized:
        return 'Authorized';
      case IsraelDealerType.nonAuthorized:
        return 'Non-authorized';
    }
  }
}

extension IsraelDealerTypeFromString on String {
  IsraelDealerType toIsraelDealerType() {
    switch (this) {
      case 'Authorized':
        return IsraelDealerType.authorized;
      case 'Non-authorized':
        return IsraelDealerType.nonAuthorized;
    }
    throw Exception('$this is not known in enum IsraelDealerType');
  }
}

/// Additional tax information associated with your TRN in Italy.
class ItalyAdditionalInfo {
  /// The tender procedure identification code.
  final String? cigNumber;

  /// Additional tax information to specify for a TRN in Italy. This is managed by
  /// the Interministerial Committee for Economic Planning (CIPE) which
  /// characterizes every public investment project (Individual Project Code).
  final String? cupNumber;

  /// Additional tax information to specify for a TRN in Italy. Use
  /// CodiceDestinatario to receive your invoices via web service (API) or FTP.
  final String? sdiAccountId;

  /// List of service tax codes for your TRN in Italy. You can use your customer
  /// tax code as part of a VAT Group.
  final String? taxCode;

  ItalyAdditionalInfo({
    this.cigNumber,
    this.cupNumber,
    this.sdiAccountId,
    this.taxCode,
  });

  factory ItalyAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return ItalyAdditionalInfo(
      cigNumber: json['cigNumber'] as String?,
      cupNumber: json['cupNumber'] as String?,
      sdiAccountId: json['sdiAccountId'] as String?,
      taxCode: json['taxCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cigNumber = this.cigNumber;
    final cupNumber = this.cupNumber;
    final sdiAccountId = this.sdiAccountId;
    final taxCode = this.taxCode;
    return {
      if (cigNumber != null) 'cigNumber': cigNumber,
      if (cupNumber != null) 'cupNumber': cupNumber,
      if (sdiAccountId != null) 'sdiAccountId': sdiAccountId,
      if (taxCode != null) 'taxCode': taxCode,
    };
  }
}

/// The jurisdiction details of the TRN information of the customers. This
/// doesn't contain full legal address, and contains only country code and
/// state/region/province.
class Jurisdiction {
  /// The country code of the jurisdiction.
  final String countryCode;

  /// The state, region, or province associated with the country of the
  /// jurisdiction, if applicable.
  final String? stateOrRegion;

  Jurisdiction({
    required this.countryCode,
    this.stateOrRegion,
  });

  factory Jurisdiction.fromJson(Map<String, dynamic> json) {
    return Jurisdiction(
      countryCode: json['countryCode'] as String,
      stateOrRegion: json['stateOrRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final countryCode = this.countryCode;
    final stateOrRegion = this.stateOrRegion;
    return {
      'countryCode': countryCode,
      if (stateOrRegion != null) 'stateOrRegion': stateOrRegion,
    };
  }
}

/// Additional tax information associated with your TRN in Kenya.
class KenyaAdditionalInfo {
  /// The legal person or physical person assigned to this TRN in Kenya.
  final PersonType personType;

  KenyaAdditionalInfo({
    required this.personType,
  });

  factory KenyaAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return KenyaAdditionalInfo(
      personType: (json['personType'] as String).toPersonType(),
    );
  }

  Map<String, dynamic> toJson() {
    final personType = this.personType;
    return {
      'personType': personType.toValue(),
    };
  }
}

class ListTaxRegistrationsResponse {
  /// The list of account details. This contains account Ids and TRN Information
  /// for each of the linked accounts.
  final List<AccountDetails> accountDetails;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListTaxRegistrationsResponse({
    required this.accountDetails,
    this.nextToken,
  });

  factory ListTaxRegistrationsResponse.fromJson(Map<String, dynamic> json) {
    return ListTaxRegistrationsResponse(
      accountDetails: (json['accountDetails'] as List)
          .whereNotNull()
          .map((e) => AccountDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountDetails = this.accountDetails;
    final nextToken = this.nextToken;
    return {
      'accountDetails': accountDetails,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Additional tax information associated with your TRN in Malaysia.
class MalaysiaAdditionalInfo {
  /// List of service tax codes for your TRN in Malaysia.
  final List<MalaysiaServiceTaxCode> serviceTaxCodes;

  MalaysiaAdditionalInfo({
    required this.serviceTaxCodes,
  });

  factory MalaysiaAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return MalaysiaAdditionalInfo(
      serviceTaxCodes: (json['serviceTaxCodes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toMalaysiaServiceTaxCode())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceTaxCodes = this.serviceTaxCodes;
    return {
      'serviceTaxCodes': serviceTaxCodes.map((e) => e.toValue()).toList(),
    };
  }
}

enum MalaysiaServiceTaxCode {
  consultancy,
  digitalServiceAndElectronicMedium,
  itServices,
  trainingOrCoaching,
}

extension MalaysiaServiceTaxCodeValueExtension on MalaysiaServiceTaxCode {
  String toValue() {
    switch (this) {
      case MalaysiaServiceTaxCode.consultancy:
        return 'Consultancy';
      case MalaysiaServiceTaxCode.digitalServiceAndElectronicMedium:
        return 'Digital Service And Electronic Medium';
      case MalaysiaServiceTaxCode.itServices:
        return 'IT Services';
      case MalaysiaServiceTaxCode.trainingOrCoaching:
        return 'Training Or Coaching';
    }
  }
}

extension MalaysiaServiceTaxCodeFromString on String {
  MalaysiaServiceTaxCode toMalaysiaServiceTaxCode() {
    switch (this) {
      case 'Consultancy':
        return MalaysiaServiceTaxCode.consultancy;
      case 'Digital Service And Electronic Medium':
        return MalaysiaServiceTaxCode.digitalServiceAndElectronicMedium;
      case 'IT Services':
        return MalaysiaServiceTaxCode.itServices;
      case 'Training Or Coaching':
        return MalaysiaServiceTaxCode.trainingOrCoaching;
    }
    throw Exception('$this is not known in enum MalaysiaServiceTaxCode');
  }
}

enum PersonType {
  legalPerson,
  physicalPerson,
  business,
}

extension PersonTypeValueExtension on PersonType {
  String toValue() {
    switch (this) {
      case PersonType.legalPerson:
        return 'Legal Person';
      case PersonType.physicalPerson:
        return 'Physical Person';
      case PersonType.business:
        return 'Business';
    }
  }
}

extension PersonTypeFromString on String {
  PersonType toPersonType() {
    switch (this) {
      case 'Legal Person':
        return PersonType.legalPerson;
      case 'Physical Person':
        return PersonType.physicalPerson;
      case 'Business':
        return PersonType.business;
    }
    throw Exception('$this is not known in enum PersonType');
  }
}

/// Additional tax information associated with your TRN in Poland.
class PolandAdditionalInfo {
  /// The individual tax registration number (NIP). Individual NIP is valid for
  /// other taxes excluding VAT purposes.
  final String? individualRegistrationNumber;

  /// True if your business is a member of a VAT group with a NIP active for VAT
  /// purposes. Otherwise, this is false.
  final bool? isGroupVatEnabled;

  PolandAdditionalInfo({
    this.individualRegistrationNumber,
    this.isGroupVatEnabled,
  });

  factory PolandAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return PolandAdditionalInfo(
      individualRegistrationNumber:
          json['individualRegistrationNumber'] as String?,
      isGroupVatEnabled: json['isGroupVatEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final individualRegistrationNumber = this.individualRegistrationNumber;
    final isGroupVatEnabled = this.isGroupVatEnabled;
    return {
      if (individualRegistrationNumber != null)
        'individualRegistrationNumber': individualRegistrationNumber,
      if (isGroupVatEnabled != null) 'isGroupVatEnabled': isGroupVatEnabled,
    };
  }
}

class PutTaxRegistrationResponse {
  /// The status of your TRN stored in the system after processing. Based on the
  /// validation occurring on the TRN, the status can be <code>Verified</code>,
  /// <code>Pending</code> or <code>Rejected</code>.
  final TaxRegistrationStatus? status;

  PutTaxRegistrationResponse({
    this.status,
  });

  factory PutTaxRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return PutTaxRegistrationResponse(
      status: (json['status'] as String?)?.toTaxRegistrationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum RegistrationType {
  intraEu,
  local,
}

extension RegistrationTypeValueExtension on RegistrationType {
  String toValue() {
    switch (this) {
      case RegistrationType.intraEu:
        return 'Intra-EU';
      case RegistrationType.local:
        return 'Local';
    }
  }
}

extension RegistrationTypeFromString on String {
  RegistrationType toRegistrationType() {
    switch (this) {
      case 'Intra-EU':
        return RegistrationType.intraEu;
      case 'Local':
        return RegistrationType.local;
    }
    throw Exception('$this is not known in enum RegistrationType');
  }
}

/// Additional tax information to specify for a TRN in Romania.
class RomaniaAdditionalInfo {
  /// The tax registration number type. The value can be
  /// <code>TaxRegistrationNumber</code> or <code>LocalRegistrationNumber</code>.
  final TaxRegistrationNumberType taxRegistrationNumberType;

  RomaniaAdditionalInfo({
    required this.taxRegistrationNumberType,
  });

  factory RomaniaAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return RomaniaAdditionalInfo(
      taxRegistrationNumberType: (json['taxRegistrationNumberType'] as String)
          .toTaxRegistrationNumberType(),
    );
  }

  Map<String, dynamic> toJson() {
    final taxRegistrationNumberType = this.taxRegistrationNumberType;
    return {
      'taxRegistrationNumberType': taxRegistrationNumberType.toValue(),
    };
  }
}

/// Additional tax information associated with your TRN in Saudi Arabia.
class SaudiArabiaAdditionalInfo {
  /// The tax registration number type.
  final SaudiArabiaTaxRegistrationNumberType? taxRegistrationNumberType;

  SaudiArabiaAdditionalInfo({
    this.taxRegistrationNumberType,
  });

  factory SaudiArabiaAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return SaudiArabiaAdditionalInfo(
      taxRegistrationNumberType: (json['taxRegistrationNumberType'] as String?)
          ?.toSaudiArabiaTaxRegistrationNumberType(),
    );
  }

  Map<String, dynamic> toJson() {
    final taxRegistrationNumberType = this.taxRegistrationNumberType;
    return {
      if (taxRegistrationNumberType != null)
        'taxRegistrationNumberType': taxRegistrationNumberType.toValue(),
    };
  }
}

enum SaudiArabiaTaxRegistrationNumberType {
  taxRegistrationNumber,
  taxIdentificationNumber,
  commercialRegistrationNumber,
}

extension SaudiArabiaTaxRegistrationNumberTypeValueExtension
    on SaudiArabiaTaxRegistrationNumberType {
  String toValue() {
    switch (this) {
      case SaudiArabiaTaxRegistrationNumberType.taxRegistrationNumber:
        return 'TaxRegistrationNumber';
      case SaudiArabiaTaxRegistrationNumberType.taxIdentificationNumber:
        return 'TaxIdentificationNumber';
      case SaudiArabiaTaxRegistrationNumberType.commercialRegistrationNumber:
        return 'CommercialRegistrationNumber';
    }
  }
}

extension SaudiArabiaTaxRegistrationNumberTypeFromString on String {
  SaudiArabiaTaxRegistrationNumberType
      toSaudiArabiaTaxRegistrationNumberType() {
    switch (this) {
      case 'TaxRegistrationNumber':
        return SaudiArabiaTaxRegistrationNumberType.taxRegistrationNumber;
      case 'TaxIdentificationNumber':
        return SaudiArabiaTaxRegistrationNumberType.taxIdentificationNumber;
      case 'CommercialRegistrationNumber':
        return SaudiArabiaTaxRegistrationNumberType
            .commercialRegistrationNumber;
    }
    throw Exception(
        '$this is not known in enum SaudiArabiaTaxRegistrationNumberType');
  }
}

enum Sector {
  business,
  individual,
  government,
}

extension SectorValueExtension on Sector {
  String toValue() {
    switch (this) {
      case Sector.business:
        return 'Business';
      case Sector.individual:
        return 'Individual';
      case Sector.government:
        return 'Government';
    }
  }
}

extension SectorFromString on String {
  Sector toSector() {
    switch (this) {
      case 'Business':
        return Sector.business;
      case 'Individual':
        return Sector.individual;
      case 'Government':
        return Sector.government;
    }
    throw Exception('$this is not known in enum Sector');
  }
}

/// The Amazon S3 bucket in your account where your tax document is located.
class SourceS3Location {
  /// The name of your Amazon S3 bucket that your tax document is located.
  final String bucket;

  /// The object key of your tax document object in Amazon S3.
  final String key;

  SourceS3Location({
    required this.bucket,
    required this.key,
  });

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      'bucket': bucket,
      'key': key,
    };
  }
}

/// Additional tax information associated with your TRN in South Korea.
class SouthKoreaAdditionalInfo {
  /// The business legal name based on the most recently uploaded tax registration
  /// certificate.
  final String businessRepresentativeName;

  /// Item of business based on the most recently uploaded tax registration
  /// certificate.
  final String itemOfBusiness;

  /// Line of business based on the most recently uploaded tax registration
  /// certificate.
  final String lineOfBusiness;

  SouthKoreaAdditionalInfo({
    required this.businessRepresentativeName,
    required this.itemOfBusiness,
    required this.lineOfBusiness,
  });

  factory SouthKoreaAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return SouthKoreaAdditionalInfo(
      businessRepresentativeName: json['businessRepresentativeName'] as String,
      itemOfBusiness: json['itemOfBusiness'] as String,
      lineOfBusiness: json['lineOfBusiness'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final businessRepresentativeName = this.businessRepresentativeName;
    final itemOfBusiness = this.itemOfBusiness;
    final lineOfBusiness = this.lineOfBusiness;
    return {
      'businessRepresentativeName': businessRepresentativeName,
      'itemOfBusiness': itemOfBusiness,
      'lineOfBusiness': lineOfBusiness,
    };
  }
}

/// Additional tax information associated with your TRN in Spain.
class SpainAdditionalInfo {
  /// The registration type in Spain.
  final RegistrationType registrationType;

  SpainAdditionalInfo({
    required this.registrationType,
  });

  factory SpainAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return SpainAdditionalInfo(
      registrationType:
          (json['registrationType'] as String).toRegistrationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final registrationType = this.registrationType;
    return {
      'registrationType': registrationType.toValue(),
    };
  }
}

/// The metadata for your tax document.
class TaxDocumentMetadata {
  /// The tax document access token, which contains information that the Tax
  /// Settings API uses to locate the tax document.
  /// <note>
  /// If you update your tax registration, the existing
  /// <code>taxDocumentAccessToken</code> won't be valid. To get the latest token,
  /// call the <code>GetTaxRegistration</code> or
  /// <code>ListTaxRegistrations</code> API operation. This token is valid for 24
  /// hours.
  /// </note>
  final String taxDocumentAccessToken;

  /// The name of your tax document.
  final String taxDocumentName;

  TaxDocumentMetadata({
    required this.taxDocumentAccessToken,
    required this.taxDocumentName,
  });

  factory TaxDocumentMetadata.fromJson(Map<String, dynamic> json) {
    return TaxDocumentMetadata(
      taxDocumentAccessToken: json['taxDocumentAccessToken'] as String,
      taxDocumentName: json['taxDocumentName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final taxDocumentAccessToken = this.taxDocumentAccessToken;
    final taxDocumentName = this.taxDocumentName;
    return {
      'taxDocumentAccessToken': taxDocumentAccessToken,
      'taxDocumentName': taxDocumentName,
    };
  }
}

/// Tax inheritance information associated with the account.
class TaxInheritanceDetails {
  /// Tax inheritance reason information associated with the account.
  final String? inheritanceObtainedReason;

  /// Tax inheritance parent account information associated with the account.
  final String? parentEntityId;

  TaxInheritanceDetails({
    this.inheritanceObtainedReason,
    this.parentEntityId,
  });

  factory TaxInheritanceDetails.fromJson(Map<String, dynamic> json) {
    return TaxInheritanceDetails(
      inheritanceObtainedReason: json['inheritanceObtainedReason'] as String?,
      parentEntityId: json['parentEntityId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inheritanceObtainedReason = this.inheritanceObtainedReason;
    final parentEntityId = this.parentEntityId;
    return {
      if (inheritanceObtainedReason != null)
        'inheritanceObtainedReason': inheritanceObtainedReason,
      if (parentEntityId != null) 'parentEntityId': parentEntityId,
    };
  }
}

/// Your TRN information.
class TaxRegistration {
  /// The legal address associated with your TRN registration.
  final Address legalAddress;

  /// The legal name associated with your TRN registration.
  final String legalName;

  /// Your tax registration unique identifier.
  final String registrationId;

  /// Type of your tax registration. This can be either <code>VAT</code> or
  /// <code>GST</code>.
  final TaxRegistrationType registrationType;

  /// The status of your TRN. This can be either <code>Verified</code>,
  /// <code>Pending</code>, <code>Deleted</code>, or <code>Rejected</code>.
  final TaxRegistrationStatus status;

  /// Additional tax information associated with your TRN.
  final AdditionalInfoResponse? additionalTaxInformation;

  /// The email address to receive VAT invoices.
  final String? certifiedEmailId;

  /// The industry that describes your business. For business-to-business (B2B)
  /// customers, specify Business. For business-to-consumer (B2C) customers,
  /// specify Individual. For business-to-government (B2G), specify Government.
  /// Note that certain values may not applicable for the request country. Please
  /// refer to country specific information in API document.
  final Sector? sector;

  /// The metadata for your tax document.
  final List<TaxDocumentMetadata>? taxDocumentMetadatas;

  TaxRegistration({
    required this.legalAddress,
    required this.legalName,
    required this.registrationId,
    required this.registrationType,
    required this.status,
    this.additionalTaxInformation,
    this.certifiedEmailId,
    this.sector,
    this.taxDocumentMetadatas,
  });

  factory TaxRegistration.fromJson(Map<String, dynamic> json) {
    return TaxRegistration(
      legalAddress:
          Address.fromJson(json['legalAddress'] as Map<String, dynamic>),
      legalName: json['legalName'] as String,
      registrationId: json['registrationId'] as String,
      registrationType:
          (json['registrationType'] as String).toTaxRegistrationType(),
      status: (json['status'] as String).toTaxRegistrationStatus(),
      additionalTaxInformation: json['additionalTaxInformation'] != null
          ? AdditionalInfoResponse.fromJson(
              json['additionalTaxInformation'] as Map<String, dynamic>)
          : null,
      certifiedEmailId: json['certifiedEmailId'] as String?,
      sector: (json['sector'] as String?)?.toSector(),
      taxDocumentMetadatas: (json['taxDocumentMetadatas'] as List?)
          ?.whereNotNull()
          .map((e) => TaxDocumentMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final legalAddress = this.legalAddress;
    final legalName = this.legalName;
    final registrationId = this.registrationId;
    final registrationType = this.registrationType;
    final status = this.status;
    final additionalTaxInformation = this.additionalTaxInformation;
    final certifiedEmailId = this.certifiedEmailId;
    final sector = this.sector;
    final taxDocumentMetadatas = this.taxDocumentMetadatas;
    return {
      'legalAddress': legalAddress,
      'legalName': legalName,
      'registrationId': registrationId,
      'registrationType': registrationType.toValue(),
      'status': status.toValue(),
      if (additionalTaxInformation != null)
        'additionalTaxInformation': additionalTaxInformation,
      if (certifiedEmailId != null) 'certifiedEmailId': certifiedEmailId,
      if (sector != null) 'sector': sector.toValue(),
      if (taxDocumentMetadatas != null)
        'taxDocumentMetadatas': taxDocumentMetadatas,
    };
  }
}

/// Tax registration document information.
class TaxRegistrationDocument {
  /// The Amazon S3 location where your tax registration document is stored.
  final SourceS3Location s3Location;

  TaxRegistrationDocument({
    required this.s3Location,
  });

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      's3Location': s3Location,
    };
  }
}

/// The TRN information you provide when you add a new TRN, or update.
class TaxRegistrationEntry {
  /// Your tax registration unique identifier.
  final String registrationId;

  /// Your tax registration type. This can be either <code>VAT</code> or
  /// <code>GST</code>.
  final TaxRegistrationType registrationType;

  /// Additional tax information associated with your TRN. You only need to
  /// specify this parameter if Amazon Web Services collects any additional
  /// information for your country within <a>AdditionalInfoRequest</a>.
  final AdditionalInfoRequest? additionalTaxInformation;

  /// The email address to receive VAT invoices.
  final String? certifiedEmailId;

  /// The legal address associated with your TRN.
  /// <note>
  /// If you're setting a TRN in Brazil for the CNPJ tax type, you don't need to
  /// specify the legal address.
  ///
  /// For TRNs in other countries and for CPF tax types Brazil, you must specify
  /// the legal address.
  /// </note>
  final Address? legalAddress;

  /// The legal name associated with your TRN.
  /// <note>
  /// If you're setting a TRN in Brazil, you don't need to specify the legal name.
  /// For TRNs in other countries, you must specify the legal name.
  /// </note>
  final String? legalName;

  /// The industry that describes your business. For business-to-business (B2B)
  /// customers, specify Business. For business-to-consumer (B2C) customers,
  /// specify Individual. For business-to-government (B2G), specify
  /// Government.Note that certain values may not applicable for the request
  /// country. Please refer to country specific information in API document.
  final Sector? sector;

  /// Additional details needed to verify your TRN information in Brazil. You only
  /// need to specify this parameter when you set a TRN in Brazil that is the CPF
  /// tax type.
  /// <note>
  /// Don't specify this parameter to set a TRN in Brazil of the CNPJ tax type or
  /// to set a TRN for another country.
  /// </note>
  final VerificationDetails? verificationDetails;

  TaxRegistrationEntry({
    required this.registrationId,
    required this.registrationType,
    this.additionalTaxInformation,
    this.certifiedEmailId,
    this.legalAddress,
    this.legalName,
    this.sector,
    this.verificationDetails,
  });

  Map<String, dynamic> toJson() {
    final registrationId = this.registrationId;
    final registrationType = this.registrationType;
    final additionalTaxInformation = this.additionalTaxInformation;
    final certifiedEmailId = this.certifiedEmailId;
    final legalAddress = this.legalAddress;
    final legalName = this.legalName;
    final sector = this.sector;
    final verificationDetails = this.verificationDetails;
    return {
      'registrationId': registrationId,
      'registrationType': registrationType.toValue(),
      if (additionalTaxInformation != null)
        'additionalTaxInformation': additionalTaxInformation,
      if (certifiedEmailId != null) 'certifiedEmailId': certifiedEmailId,
      if (legalAddress != null) 'legalAddress': legalAddress,
      if (legalName != null) 'legalName': legalName,
      if (sector != null) 'sector': sector.toValue(),
      if (verificationDetails != null)
        'verificationDetails': verificationDetails,
    };
  }
}

enum TaxRegistrationNumberType {
  taxRegistrationNumber,
  localRegistrationNumber,
}

extension TaxRegistrationNumberTypeValueExtension on TaxRegistrationNumberType {
  String toValue() {
    switch (this) {
      case TaxRegistrationNumberType.taxRegistrationNumber:
        return 'TaxRegistrationNumber';
      case TaxRegistrationNumberType.localRegistrationNumber:
        return 'LocalRegistrationNumber';
    }
  }
}

extension TaxRegistrationNumberTypeFromString on String {
  TaxRegistrationNumberType toTaxRegistrationNumberType() {
    switch (this) {
      case 'TaxRegistrationNumber':
        return TaxRegistrationNumberType.taxRegistrationNumber;
      case 'LocalRegistrationNumber':
        return TaxRegistrationNumberType.localRegistrationNumber;
    }
    throw Exception('$this is not known in enum TaxRegistrationNumberType');
  }
}

enum TaxRegistrationStatus {
  verified,
  pending,
  deleted,
  rejected,
}

extension TaxRegistrationStatusValueExtension on TaxRegistrationStatus {
  String toValue() {
    switch (this) {
      case TaxRegistrationStatus.verified:
        return 'Verified';
      case TaxRegistrationStatus.pending:
        return 'Pending';
      case TaxRegistrationStatus.deleted:
        return 'Deleted';
      case TaxRegistrationStatus.rejected:
        return 'Rejected';
    }
  }
}

extension TaxRegistrationStatusFromString on String {
  TaxRegistrationStatus toTaxRegistrationStatus() {
    switch (this) {
      case 'Verified':
        return TaxRegistrationStatus.verified;
      case 'Pending':
        return TaxRegistrationStatus.pending;
      case 'Deleted':
        return TaxRegistrationStatus.deleted;
      case 'Rejected':
        return TaxRegistrationStatus.rejected;
    }
    throw Exception('$this is not known in enum TaxRegistrationStatus');
  }
}

enum TaxRegistrationType {
  vat,
  gst,
  cpf,
  cnpj,
  sst,
}

extension TaxRegistrationTypeValueExtension on TaxRegistrationType {
  String toValue() {
    switch (this) {
      case TaxRegistrationType.vat:
        return 'VAT';
      case TaxRegistrationType.gst:
        return 'GST';
      case TaxRegistrationType.cpf:
        return 'CPF';
      case TaxRegistrationType.cnpj:
        return 'CNPJ';
      case TaxRegistrationType.sst:
        return 'SST';
    }
  }
}

extension TaxRegistrationTypeFromString on String {
  TaxRegistrationType toTaxRegistrationType() {
    switch (this) {
      case 'VAT':
        return TaxRegistrationType.vat;
      case 'GST':
        return TaxRegistrationType.gst;
      case 'CPF':
        return TaxRegistrationType.cpf;
      case 'CNPJ':
        return TaxRegistrationType.cnpj;
      case 'SST':
        return TaxRegistrationType.sst;
    }
    throw Exception('$this is not known in enum TaxRegistrationType');
  }
}

/// Your TRN information with jurisdiction details. This doesn't contain the
/// full legal address associated with the TRN information.
class TaxRegistrationWithJurisdiction {
  /// The jurisdiction associated with your TRN information.
  final Jurisdiction jurisdiction;

  /// The legal name associated with your TRN information.
  final String legalName;

  /// Your tax registration unique identifier.
  final String registrationId;

  /// The type of your tax registration. This can be either <code>VAT</code> or
  /// <code>GST</code>.
  final TaxRegistrationType registrationType;

  /// The status of your TRN. This can be either <code>Verified</code>,
  /// <code>Pending</code>, <code>Deleted</code>, or <code>Rejected</code>.
  final TaxRegistrationStatus status;

  /// Additional tax information associated with your TRN.
  final AdditionalInfoResponse? additionalTaxInformation;

  /// The email address to receive VAT invoices.
  final String? certifiedEmailId;

  /// The industry that describes your business. For business-to-business (B2B)
  /// customers, specify Business. For business-to-consumer (B2C) customers,
  /// specify Individual. For business-to-government (B2G), specify
  /// Government.Note that certain values may not applicable for the request
  /// country. Please refer to country specific information in API document.
  final Sector? sector;

  /// The metadata for your tax document.
  final List<TaxDocumentMetadata>? taxDocumentMetadatas;

  TaxRegistrationWithJurisdiction({
    required this.jurisdiction,
    required this.legalName,
    required this.registrationId,
    required this.registrationType,
    required this.status,
    this.additionalTaxInformation,
    this.certifiedEmailId,
    this.sector,
    this.taxDocumentMetadatas,
  });

  factory TaxRegistrationWithJurisdiction.fromJson(Map<String, dynamic> json) {
    return TaxRegistrationWithJurisdiction(
      jurisdiction:
          Jurisdiction.fromJson(json['jurisdiction'] as Map<String, dynamic>),
      legalName: json['legalName'] as String,
      registrationId: json['registrationId'] as String,
      registrationType:
          (json['registrationType'] as String).toTaxRegistrationType(),
      status: (json['status'] as String).toTaxRegistrationStatus(),
      additionalTaxInformation: json['additionalTaxInformation'] != null
          ? AdditionalInfoResponse.fromJson(
              json['additionalTaxInformation'] as Map<String, dynamic>)
          : null,
      certifiedEmailId: json['certifiedEmailId'] as String?,
      sector: (json['sector'] as String?)?.toSector(),
      taxDocumentMetadatas: (json['taxDocumentMetadatas'] as List?)
          ?.whereNotNull()
          .map((e) => TaxDocumentMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jurisdiction = this.jurisdiction;
    final legalName = this.legalName;
    final registrationId = this.registrationId;
    final registrationType = this.registrationType;
    final status = this.status;
    final additionalTaxInformation = this.additionalTaxInformation;
    final certifiedEmailId = this.certifiedEmailId;
    final sector = this.sector;
    final taxDocumentMetadatas = this.taxDocumentMetadatas;
    return {
      'jurisdiction': jurisdiction,
      'legalName': legalName,
      'registrationId': registrationId,
      'registrationType': registrationType.toValue(),
      'status': status.toValue(),
      if (additionalTaxInformation != null)
        'additionalTaxInformation': additionalTaxInformation,
      if (certifiedEmailId != null) 'certifiedEmailId': certifiedEmailId,
      if (sector != null) 'sector': sector.toValue(),
      if (taxDocumentMetadatas != null)
        'taxDocumentMetadatas': taxDocumentMetadatas,
    };
  }
}

/// Additional tax information associated with your TRN in Turkey.
class TurkeyAdditionalInfo {
  /// The industry information that tells the Tax Settings API if you're subject
  /// to additional withholding taxes. This information required for
  /// business-to-business (B2B) customers. This information is conditionally
  /// mandatory for B2B customers who are subject to KDV tax.
  final Industries? industries;

  /// The Registered Electronic Mail (REM) that is used to send notarized
  /// communication. This parameter is optional for business-to-business (B2B) and
  /// business-to-government (B2G) customers. It's not required for
  /// business-to-consumer (B2C) customers.
  final String? kepEmailId;

  /// Secondary tax ID (“harcama birimi VKN”si”). If one isn't provided, we will
  /// use your VKN as the secondary ID.
  final String? secondaryTaxId;

  /// The tax office where you're registered. You can enter this information as a
  /// string. The Tax Settings API will add this information to your invoice. This
  /// parameter is required for business-to-business (B2B) and
  /// business-to-government customers. It's not required for business-to-consumer
  /// (B2C) customers.
  final String? taxOffice;

  TurkeyAdditionalInfo({
    this.industries,
    this.kepEmailId,
    this.secondaryTaxId,
    this.taxOffice,
  });

  factory TurkeyAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return TurkeyAdditionalInfo(
      industries: (json['industries'] as String?)?.toIndustries(),
      kepEmailId: json['kepEmailId'] as String?,
      secondaryTaxId: json['secondaryTaxId'] as String?,
      taxOffice: json['taxOffice'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final industries = this.industries;
    final kepEmailId = this.kepEmailId;
    final secondaryTaxId = this.secondaryTaxId;
    final taxOffice = this.taxOffice;
    return {
      if (industries != null) 'industries': industries.toValue(),
      if (kepEmailId != null) 'kepEmailId': kepEmailId,
      if (secondaryTaxId != null) 'secondaryTaxId': secondaryTaxId,
      if (taxOffice != null) 'taxOffice': taxOffice,
    };
  }
}

/// Additional tax information associated with your TRN in Ukraine.
class UkraineAdditionalInfo {
  /// The tax registration type.
  final UkraineTrnType ukraineTrnType;

  UkraineAdditionalInfo({
    required this.ukraineTrnType,
  });

  factory UkraineAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return UkraineAdditionalInfo(
      ukraineTrnType: (json['ukraineTrnType'] as String).toUkraineTrnType(),
    );
  }

  Map<String, dynamic> toJson() {
    final ukraineTrnType = this.ukraineTrnType;
    return {
      'ukraineTrnType': ukraineTrnType.toValue(),
    };
  }
}

enum UkraineTrnType {
  business,
  individual,
}

extension UkraineTrnTypeValueExtension on UkraineTrnType {
  String toValue() {
    switch (this) {
      case UkraineTrnType.business:
        return 'Business';
      case UkraineTrnType.individual:
        return 'Individual';
    }
  }
}

extension UkraineTrnTypeFromString on String {
  UkraineTrnType toUkraineTrnType() {
    switch (this) {
      case 'Business':
        return UkraineTrnType.business;
      case 'Individual':
        return UkraineTrnType.individual;
    }
    throw Exception('$this is not known in enum UkraineTrnType');
  }
}

/// Required information to verify your TRN.
class VerificationDetails {
  /// Date of birth to verify your submitted TRN. Use the <code>YYYY-MM-DD</code>
  /// format.
  final String? dateOfBirth;

  /// The tax registration document, which is required for specific countries such
  /// as Bangladesh, Kenya, South Korea and Spain.
  final List<TaxRegistrationDocument>? taxRegistrationDocuments;

  VerificationDetails({
    this.dateOfBirth,
    this.taxRegistrationDocuments,
  });

  Map<String, dynamic> toJson() {
    final dateOfBirth = this.dateOfBirth;
    final taxRegistrationDocuments = this.taxRegistrationDocuments;
    return {
      if (dateOfBirth != null) 'dateOfBirth': dateOfBirth,
      if (taxRegistrationDocuments != null)
        'taxRegistrationDocuments': taxRegistrationDocuments,
    };
  }
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};

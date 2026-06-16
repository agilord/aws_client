// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
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

  /// Get the active tax exemptions for a given list of accounts. The IAM action
  /// is <code>tax:GetExemptions</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// List of unique account identifiers.
  Future<BatchGetTaxExemptionsResponse> batchGetTaxExemptions({
    required List<String> accountIds,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetTaxExemptions',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetTaxExemptionsResponse.fromJson(response);
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
  /// <b>Indonesia</b>
  ///
  /// <ul>
  /// <li>
  /// <code>PutTaxRegistration</code>: The use of this operation to submit tax
  /// information is subject to the <a
  /// href="http://aws.amazon.com/service-terms/">Amazon Web Services service
  /// terms</a>. By submitting, you’re providing consent for Amazon Web Services
  /// to validate NIK, NPWP, and NITKU data, provided by you with the
  /// Directorate General of Taxes of Indonesia in accordance with the Minister
  /// of Finance Regulation (PMK) Number 112/PMK.03/2022.
  /// </li>
  /// <li>
  /// <code>BatchPutTaxRegistration</code>: The use of this operation to submit
  /// tax information is subject to the <a
  /// href="http://aws.amazon.com/service-terms/">Amazon Web Services service
  /// terms</a>. By submitting, you’re providing consent for Amazon Web Services
  /// to validate NIK, NPWP, and NITKU data, provided by you with the
  /// Directorate General of Taxes of Indonesia in accordance with the Minister
  /// of Finance Regulation (PMK) Number 112/PMK.03/2022, through our
  /// third-party partner PT Achilles Advanced Management (OnlinePajak).
  /// </li>
  /// <li>
  /// You must specify the <code>taxRegistrationNumberType</code> in the
  /// <code>indonesiaAdditionalInfo</code> field of the
  /// <code>additionalTaxInformation</code> object.
  /// </li>
  /// <li>
  /// If you specify <code>decisionNumber</code>, you must specify the
  /// <code>ppnExceptionDesignationCode</code> in the
  /// <code>indonesiaAdditionalInfo</code> field of the
  /// <code>additionalTaxInformation</code> object. If the
  /// <code>taxRegistrationNumberType</code> is set to NPWP or NITKU, valid
  /// values for <code>ppnExceptionDesignationCode</code> are either
  /// <code>01</code>, <code>02</code>, <code>03</code>, <code>07</code>, or
  /// <code>08</code>.
  ///
  /// For other <code>taxRegistrationNumberType</code> values,
  /// <code>ppnExceptionDesignationCode</code> must be either <code>01</code>,
  /// <code>07</code>, or <code>08</code>.
  /// </li>
  /// <li>
  /// If <code>ppnExceptionDesignationCode</code> is <code>07</code>, you must
  /// specify the <code>decisionNumber</code> in the
  /// <code>indonesiaAdditionalInfo</code> field of the
  /// <code>additionalTaxInformation</code> object.
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
  /// The sector valid values are <code>Business</code> and
  /// <code>Individual</code>.
  /// </li>
  /// <li>
  /// <code>RegistrationType</code> valid values are <code>NRIC</code> for
  /// individual, and TIN and sales and service tax (SST) for Business.
  /// </li>
  /// <li>
  /// For individual, you can specify the <code>taxInformationNumber</code> in
  /// <code>MalaysiaAdditionalInfo</code> with NRIC type, and a valid
  /// <code>MyKad</code> or NRIC number.
  /// </li>
  /// <li>
  /// For business, you must specify a <code>businessRegistrationNumber</code>
  /// in <code>MalaysiaAdditionalInfo</code> with a TIN type and tax
  /// identification number.
  /// </li>
  /// <li>
  /// For business resellers, you must specify a
  /// <code>businessRegistrationNumber</code> and
  /// <code>taxInformationNumber</code> in <code>MalaysiaAdditionalInfo</code>
  /// with a sales and service tax (SST) type and a valid SST number.
  /// </li>
  /// <li>
  /// For business resellers with service codes, you must specify
  /// <code>businessRegistrationNumber</code>,
  /// <code>taxInformationNumber</code>, and distinct
  /// <code>serviceTaxCodes</code> in <code>MalaysiaAdditionalInfo</code> with a
  /// SST type and valid sales and service tax (SST) number. By using this API
  /// operation, Amazon Web Services registers your self-declaration that you’re
  /// an authorized business reseller registered with the Royal Malaysia Customs
  /// Department (RMCD), and have a valid SST number.
  /// </li>
  /// <li>
  /// Amazon Web Services reserves the right to seek additional information
  /// and/or take other actions to support your self-declaration as appropriate.
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
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

  /// Deletes a supplemental tax registration for a single account.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [authorityId] :
  /// The unique authority Id for the supplemental TRN information that needs to
  /// be deleted.
  Future<void> deleteSupplementalTaxRegistration({
    required String authorityId,
  }) async {
    final $payload = <String, dynamic>{
      'authorityId': authorityId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteSupplementalTaxRegistration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes tax registration for a single account.
  /// <note>
  /// This API operation can't be used to delete your tax registration in
  /// Brazil. Use the <a
  /// href="https://console.aws.amazon.com/billing/home#/paymentpreferences/paymentmethods">Payment
  /// preferences</a> page in the Billing and Cost Management console instead.
  /// </note>
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Get supported tax exemption types. The IAM action is
  /// <code>tax:GetExemptions</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<GetTaxExemptionTypesResponse> getTaxExemptionTypes() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/GetTaxExemptionTypes',
      exceptionFnMap: _exceptionFns,
    );
    return GetTaxExemptionTypesResponse.fromJson(response);
  }

  /// The get account tax inheritance status.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<GetTaxInheritanceResponse> getTaxInheritance() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/GetTaxInheritance',
      exceptionFnMap: _exceptionFns,
    );
    return GetTaxInheritanceResponse.fromJson(response);
  }

  /// Retrieves tax registration for a single account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [taxDocumentMetadata] :
  /// The metadata for your tax document.
  ///
  /// Parameter [destinationS3Location] :
  /// The Amazon S3 bucket that you specify to download your tax documents to.
  Future<GetTaxRegistrationDocumentResponse> getTaxRegistrationDocument({
    required TaxDocumentMetadata taxDocumentMetadata,
    DestinationS3Location? destinationS3Location,
  }) async {
    final $payload = <String, dynamic>{
      'taxDocumentMetadata': taxDocumentMetadata,
      if (destinationS3Location != null)
        'destinationS3Location': destinationS3Location,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetTaxRegistrationDocument',
      exceptionFnMap: _exceptionFns,
    );
    return GetTaxRegistrationDocumentResponse.fromJson(response);
  }

  /// Retrieves supplemental tax registrations for a single account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The number of <code>taxRegistrations</code> results you want in one
  /// response.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListSupplementalTaxRegistrationsResponse>
      listSupplementalTaxRegistrations({
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
      requestUri: '/ListSupplementalTaxRegistrations',
      exceptionFnMap: _exceptionFns,
    );
    return ListSupplementalTaxRegistrationsResponse.fromJson(response);
  }

  /// Retrieves the tax exemption of accounts listed in a consolidated billing
  /// family. The IAM action is <code>tax:GetExemptions</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The number of results you want in one response.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListTaxExemptionsResponse> listTaxExemptions({
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
      requestUri: '/ListTaxExemptions',
      exceptionFnMap: _exceptionFns,
    );
    return ListTaxExemptionsResponse.fromJson(response);
  }

  /// Retrieves the tax registration of accounts listed in a consolidated
  /// billing family. This can be used to retrieve up to 100 accounts' tax
  /// registrations in one call (default 50).
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Stores supplemental tax registration for a single account.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [taxRegistrationEntry] :
  /// The supplemental TRN information that will be stored for the caller
  /// account ID.
  Future<PutSupplementalTaxRegistrationResponse>
      putSupplementalTaxRegistration({
    required SupplementalTaxRegistrationEntry taxRegistrationEntry,
  }) async {
    final $payload = <String, dynamic>{
      'taxRegistrationEntry': taxRegistrationEntry,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutSupplementalTaxRegistration',
      exceptionFnMap: _exceptionFns,
    );
    return PutSupplementalTaxRegistrationResponse.fromJson(response);
  }

  /// Adds the tax exemption for a single account or all accounts listed in a
  /// consolidated billing family. The IAM action is
  /// <code>tax:UpdateExemptions</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AttachmentUploadException].
  /// May throw [CaseCreationLimitExceededException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The list of unique account identifiers.
  ///
  /// Parameter [exemptionType] :
  /// The exemption type. Use the supported tax exemption type description.
  Future<PutTaxExemptionResponse> putTaxExemption({
    required List<String> accountIds,
    required Authority authority,
    required ExemptionCertificate exemptionCertificate,
    required String exemptionType,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
      'authority': authority,
      'exemptionCertificate': exemptionCertificate,
      'exemptionType': exemptionType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutTaxExemption',
      exceptionFnMap: _exceptionFns,
    );
    return PutTaxExemptionResponse.fromJson(response);
  }

  /// The updated tax inheritance status.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [heritageStatus] :
  /// The tax inheritance status.
  Future<void> putTaxInheritance({
    HeritageStatus? heritageStatus,
  }) async {
    final $payload = <String, dynamic>{
      if (heritageStatus != null) 'heritageStatus': heritageStatus.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutTaxInheritance',
      exceptionFnMap: _exceptionFns,
    );
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
  /// <b>Indonesia</b>
  ///
  /// <ul>
  /// <li>
  /// <code>PutTaxRegistration</code>: The use of this operation to submit tax
  /// information is subject to the <a
  /// href="http://aws.amazon.com/service-terms/">Amazon Web Services service
  /// terms</a>. By submitting, you’re providing consent for Amazon Web Services
  /// to validate NIK, NPWP, and NITKU data, provided by you with the
  /// Directorate General of Taxes of Indonesia in accordance with the Minister
  /// of Finance Regulation (PMK) Number 112/PMK.03/2022.
  /// </li>
  /// <li>
  /// <code>BatchPutTaxRegistration</code>: The use of this operation to submit
  /// tax information is subject to the <a
  /// href="http://aws.amazon.com/service-terms/">Amazon Web Services service
  /// terms</a>. By submitting, you’re providing consent for Amazon Web Services
  /// to validate NIK, NPWP, and NITKU data, provided by you with the
  /// Directorate General of Taxes of Indonesia in accordance with the Minister
  /// of Finance Regulation (PMK) Number 112/PMK.03/2022, through our
  /// third-party partner PT Achilles Advanced Management (OnlinePajak).
  /// </li>
  /// <li>
  /// You must specify the <code>taxRegistrationNumberType</code> in the
  /// <code>indonesiaAdditionalInfo</code> field of the
  /// <code>additionalTaxInformation</code> object.
  /// </li>
  /// <li>
  /// If you specify <code>decisionNumber</code>, you must specify the
  /// <code>ppnExceptionDesignationCode</code> in the
  /// <code>indonesiaAdditionalInfo</code> field of the
  /// <code>additionalTaxInformation</code> object. If the
  /// <code>taxRegistrationNumberType</code> is set to NPWP or NITKU, valid
  /// values for <code>ppnExceptionDesignationCode</code> are either
  /// <code>01</code>, <code>02</code>, <code>03</code>, <code>07</code>, or
  /// <code>08</code>.
  ///
  /// For other <code>taxRegistrationNumberType</code> values,
  /// <code>ppnExceptionDesignationCode</code> must be either <code>01</code>,
  /// <code>07</code>, or <code>08</code>.
  /// </li>
  /// <li>
  /// If <code>ppnExceptionDesignationCode</code> is <code>07</code>, you must
  /// specify the <code>decisionNumber</code> in the
  /// <code>indonesiaAdditionalInfo</code> field of the
  /// <code>additionalTaxInformation</code> object.
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
  /// The sector valid values are <code>Business</code> and
  /// <code>Individual</code>.
  /// </li>
  /// <li>
  /// <code>RegistrationType</code> valid values are <code>NRIC</code> for
  /// individual, and TIN and sales and service tax (SST) for Business.
  /// </li>
  /// <li>
  /// For individual, you can specify the <code>taxInformationNumber</code> in
  /// <code>MalaysiaAdditionalInfo</code> with NRIC type, and a valid
  /// <code>MyKad</code> or NRIC number.
  /// </li>
  /// <li>
  /// For business, you must specify a <code>businessRegistrationNumber</code>
  /// in <code>MalaysiaAdditionalInfo</code> with a TIN type and tax
  /// identification number.
  /// </li>
  /// <li>
  /// For business resellers, you must specify a
  /// <code>businessRegistrationNumber</code> and
  /// <code>taxInformationNumber</code> in <code>MalaysiaAdditionalInfo</code>
  /// with a sales and service tax (SST) type and a valid SST number.
  /// </li>
  /// <li>
  /// For business resellers with service codes, you must specify
  /// <code>businessRegistrationNumber</code>,
  /// <code>taxInformationNumber</code>, and distinct
  /// <code>serviceTaxCodes</code> in <code>MalaysiaAdditionalInfo</code> with a
  /// SST type and valid sales and service tax (SST) number. By using this API
  /// operation, Amazon Web Services registers your self-declaration that you’re
  /// an authorized business reseller registered with the Royal Malaysia Customs
  /// Department (RMCD), and have a valid SST number.
  /// </li>
  /// <li>
  /// Amazon Web Services reserves the right to seek additional information
  /// and/or take other actions to support your self-declaration as appropriate.
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
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
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
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

class BatchGetTaxExemptionsResponse {
  /// The list of accounts that failed to get tax exemptions.
  final List<String>? failedAccounts;

  /// The tax exemption details map of accountId and tax exemption details.
  final Map<String, TaxExemptionDetails>? taxExemptionDetailsMap;

  BatchGetTaxExemptionsResponse({
    this.failedAccounts,
    this.taxExemptionDetailsMap,
  });

  factory BatchGetTaxExemptionsResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetTaxExemptionsResponse(
      failedAccounts: (json['failedAccounts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      taxExemptionDetailsMap:
          (json['taxExemptionDetailsMap'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                  k, TaxExemptionDetails.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final failedAccounts = this.failedAccounts;
    final taxExemptionDetailsMap = this.taxExemptionDetailsMap;
    return {
      if (failedAccounts != null) 'failedAccounts': failedAccounts,
      if (taxExemptionDetailsMap != null)
        'taxExemptionDetailsMap': taxExemptionDetailsMap,
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
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BatchPutTaxRegistrationError.fromJson(e as Map<String, dynamic>))
          .toList(),
      status:
          (json['status'] as String?)?.let(TaxRegistrationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final status = this.status;
    return {
      'errors': errors,
      if (status != null) 'status': status.value,
    };
  }
}

class DeleteSupplementalTaxRegistrationResponse {
  DeleteSupplementalTaxRegistrationResponse();

  factory DeleteSupplementalTaxRegistrationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteSupplementalTaxRegistrationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class GetTaxExemptionTypesResponse {
  /// The supported types of tax exemptions.
  final List<TaxExemptionType>? taxExemptionTypes;

  GetTaxExemptionTypesResponse({
    this.taxExemptionTypes,
  });

  factory GetTaxExemptionTypesResponse.fromJson(Map<String, dynamic> json) {
    return GetTaxExemptionTypesResponse(
      taxExemptionTypes: (json['taxExemptionTypes'] as List?)
          ?.nonNulls
          .map((e) => TaxExemptionType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final taxExemptionTypes = this.taxExemptionTypes;
    return {
      if (taxExemptionTypes != null) 'taxExemptionTypes': taxExemptionTypes,
    };
  }
}

class GetTaxInheritanceResponse {
  /// The tax inheritance status.
  final HeritageStatus? heritageStatus;

  GetTaxInheritanceResponse({
    this.heritageStatus,
  });

  factory GetTaxInheritanceResponse.fromJson(Map<String, dynamic> json) {
    return GetTaxInheritanceResponse(
      heritageStatus:
          (json['heritageStatus'] as String?)?.let(HeritageStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final heritageStatus = this.heritageStatus;
    return {
      if (heritageStatus != null) 'heritageStatus': heritageStatus.value,
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

class GetTaxRegistrationDocumentResponse {
  /// The file path of the Amazon S3 bucket where you want to download your tax
  /// document to.
  final String? destinationFilePath;

  /// The Amazon S3 presigned URL of the tax registration document.
  final String? presignedS3Url;

  GetTaxRegistrationDocumentResponse({
    this.destinationFilePath,
    this.presignedS3Url,
  });

  factory GetTaxRegistrationDocumentResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTaxRegistrationDocumentResponse(
      destinationFilePath: json['destinationFilePath'] as String?,
      presignedS3Url: json['presignedS3Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationFilePath = this.destinationFilePath;
    final presignedS3Url = this.presignedS3Url;
    return {
      if (destinationFilePath != null)
        'destinationFilePath': destinationFilePath,
      if (presignedS3Url != null) 'presignedS3Url': presignedS3Url,
    };
  }
}

class ListSupplementalTaxRegistrationsResponse {
  /// The list of supplemental tax registrations.
  final List<SupplementalTaxRegistration> taxRegistrations;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListSupplementalTaxRegistrationsResponse({
    required this.taxRegistrations,
    this.nextToken,
  });

  factory ListSupplementalTaxRegistrationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSupplementalTaxRegistrationsResponse(
      taxRegistrations: ((json['taxRegistrations'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              SupplementalTaxRegistration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taxRegistrations = this.taxRegistrations;
    final nextToken = this.nextToken;
    return {
      'taxRegistrations': taxRegistrations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTaxExemptionsResponse {
  /// The token to retrieve the next set of results.
  final String? nextToken;

  /// The tax exemption details map of <code>accountId</code> and tax exemption
  /// details.
  final Map<String, TaxExemptionDetails>? taxExemptionDetailsMap;

  ListTaxExemptionsResponse({
    this.nextToken,
    this.taxExemptionDetailsMap,
  });

  factory ListTaxExemptionsResponse.fromJson(Map<String, dynamic> json) {
    return ListTaxExemptionsResponse(
      nextToken: json['nextToken'] as String?,
      taxExemptionDetailsMap:
          (json['taxExemptionDetailsMap'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                  k, TaxExemptionDetails.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taxExemptionDetailsMap = this.taxExemptionDetailsMap;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (taxExemptionDetailsMap != null)
        'taxExemptionDetailsMap': taxExemptionDetailsMap,
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
      accountDetails: ((json['accountDetails'] as List?) ?? const [])
          .nonNulls
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

class PutSupplementalTaxRegistrationResponse {
  /// Unique authority ID for the supplemental TRN information that was stored.
  final String authorityId;

  /// The status of the supplemental TRN stored in the system after processing.
  /// Based on the validation occurring on the TRN, the status can be
  /// <code>Verified</code>, <code>Pending</code>, <code>Rejected</code>, or
  /// <code>Deleted</code>.
  final TaxRegistrationStatus status;

  PutSupplementalTaxRegistrationResponse({
    required this.authorityId,
    required this.status,
  });

  factory PutSupplementalTaxRegistrationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutSupplementalTaxRegistrationResponse(
      authorityId: (json['authorityId'] as String?) ?? '',
      status:
          TaxRegistrationStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final authorityId = this.authorityId;
    final status = this.status;
    return {
      'authorityId': authorityId,
      'status': status.value,
    };
  }
}

class PutTaxExemptionResponse {
  /// The customer support case ID.
  final String? caseId;

  PutTaxExemptionResponse({
    this.caseId,
  });

  factory PutTaxExemptionResponse.fromJson(Map<String, dynamic> json) {
    return PutTaxExemptionResponse(
      caseId: json['caseId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final caseId = this.caseId;
    return {
      if (caseId != null) 'caseId': caseId,
    };
  }
}

class PutTaxInheritanceResponse {
  PutTaxInheritanceResponse();

  factory PutTaxInheritanceResponse.fromJson(Map<String, dynamic> _) {
    return PutTaxInheritanceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
      status:
          (json['status'] as String?)?.let(TaxRegistrationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.value,
    };
  }
}

class TaxRegistrationStatus {
  static const verified = TaxRegistrationStatus._('Verified');
  static const pending = TaxRegistrationStatus._('Pending');
  static const deleted = TaxRegistrationStatus._('Deleted');
  static const rejected = TaxRegistrationStatus._('Rejected');

  final String value;

  const TaxRegistrationStatus._(this.value);

  static const values = [verified, pending, deleted, rejected];

  static TaxRegistrationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaxRegistrationStatus._(value));

  @override
  bool operator ==(other) =>
      other is TaxRegistrationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      'registrationType': registrationType.value,
      if (additionalTaxInformation != null)
        'additionalTaxInformation': additionalTaxInformation,
      if (certifiedEmailId != null) 'certifiedEmailId': certifiedEmailId,
      if (legalAddress != null) 'legalAddress': legalAddress,
      if (legalName != null) 'legalName': legalName,
      if (sector != null) 'sector': sector.value,
      if (verificationDetails != null)
        'verificationDetails': verificationDetails,
    };
  }
}

class TaxRegistrationType {
  static const vat = TaxRegistrationType._('VAT');
  static const gst = TaxRegistrationType._('GST');
  static const cpf = TaxRegistrationType._('CPF');
  static const cnpj = TaxRegistrationType._('CNPJ');
  static const sst = TaxRegistrationType._('SST');
  static const tin = TaxRegistrationType._('TIN');
  static const nric = TaxRegistrationType._('NRIC');

  final String value;

  const TaxRegistrationType._(this.value);

  static const values = [vat, gst, cpf, cnpj, sst, tin, nric];

  static TaxRegistrationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaxRegistrationType._(value));

  @override
  bool operator ==(other) =>
      other is TaxRegistrationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

  /// The state, region, or province that the address is located. This field is
  /// only required for Canada, India, United Arab Emirates, Romania, and Brazil
  /// (CPF). It is optional for all other countries.
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
      addressLine1: (json['addressLine1'] as String?) ?? '',
      city: (json['city'] as String?) ?? '',
      countryCode: (json['countryCode'] as String?) ?? '',
      postalCode: (json['postalCode'] as String?) ?? '',
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

class Sector {
  static const business = Sector._('Business');
  static const individual = Sector._('Individual');
  static const government = Sector._('Government');

  final String value;

  const Sector._(this.value);

  static const values = [business, individual, government];

  static Sector fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Sector._(value));

  @override
  bool operator ==(other) => other is Sector && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

  /// Additional tax information to specify for a TRN in Egypt.
  final EgyptAdditionalInfo? egyptAdditionalInfo;

  /// Additional tax information to specify for a TRN in Estonia.
  final EstoniaAdditionalInfo? estoniaAdditionalInfo;

  /// Additional tax information to specify for a TRN in Georgia.
  final GeorgiaAdditionalInfo? georgiaAdditionalInfo;

  /// Additional tax information to specify for a TRN in Greece.
  final GreeceAdditionalInfo? greeceAdditionalInfo;

  ///
  final IndonesiaAdditionalInfo? indonesiaAdditionalInfo;

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

  /// Additional tax information to specify for a TRN in Uzbekistan.
  final UzbekistanAdditionalInfo? uzbekistanAdditionalInfo;

  /// Additional tax information to specify for a TRN in Vietnam.
  final VietnamAdditionalInfo? vietnamAdditionalInfo;

  AdditionalInfoRequest({
    this.canadaAdditionalInfo,
    this.egyptAdditionalInfo,
    this.estoniaAdditionalInfo,
    this.georgiaAdditionalInfo,
    this.greeceAdditionalInfo,
    this.indonesiaAdditionalInfo,
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
    this.uzbekistanAdditionalInfo,
    this.vietnamAdditionalInfo,
  });

  Map<String, dynamic> toJson() {
    final canadaAdditionalInfo = this.canadaAdditionalInfo;
    final egyptAdditionalInfo = this.egyptAdditionalInfo;
    final estoniaAdditionalInfo = this.estoniaAdditionalInfo;
    final georgiaAdditionalInfo = this.georgiaAdditionalInfo;
    final greeceAdditionalInfo = this.greeceAdditionalInfo;
    final indonesiaAdditionalInfo = this.indonesiaAdditionalInfo;
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
    final uzbekistanAdditionalInfo = this.uzbekistanAdditionalInfo;
    final vietnamAdditionalInfo = this.vietnamAdditionalInfo;
    return {
      if (canadaAdditionalInfo != null)
        'canadaAdditionalInfo': canadaAdditionalInfo,
      if (egyptAdditionalInfo != null)
        'egyptAdditionalInfo': egyptAdditionalInfo,
      if (estoniaAdditionalInfo != null)
        'estoniaAdditionalInfo': estoniaAdditionalInfo,
      if (georgiaAdditionalInfo != null)
        'georgiaAdditionalInfo': georgiaAdditionalInfo,
      if (greeceAdditionalInfo != null)
        'greeceAdditionalInfo': greeceAdditionalInfo,
      if (indonesiaAdditionalInfo != null)
        'indonesiaAdditionalInfo': indonesiaAdditionalInfo,
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
      if (uzbekistanAdditionalInfo != null)
        'uzbekistanAdditionalInfo': uzbekistanAdditionalInfo,
      if (vietnamAdditionalInfo != null)
        'vietnamAdditionalInfo': vietnamAdditionalInfo,
    };
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

/// Tax registration document information.
class TaxRegistrationDocument {
  /// The tax registration document.
  final TaxRegistrationDocFile? file;

  /// The Amazon S3 location where your tax registration document is stored.
  final SourceS3Location? s3Location;

  TaxRegistrationDocument({
    this.file,
    this.s3Location,
  });

  Map<String, dynamic> toJson() {
    final file = this.file;
    final s3Location = this.s3Location;
    return {
      if (file != null) 'file': file,
      if (s3Location != null) 's3Location': s3Location,
    };
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

/// The tax registration document.
class TaxRegistrationDocFile {
  /// The tax registration document content.
  final Uint8List fileContent;

  /// The tax registration document name.
  final String fileName;

  TaxRegistrationDocFile({
    required this.fileContent,
    required this.fileName,
  });

  Map<String, dynamic> toJson() {
    final fileContent = this.fileContent;
    final fileName = this.fileName;
    return {
      'fileContent': base64Encode(fileContent),
      'fileName': fileName,
    };
  }
}

/// Additional tax information associated with your TRN in Malaysia.
class MalaysiaAdditionalInfo {
  /// The tax registration number (TRN) in Malaysia.
  ///
  /// For individual, you can specify the <code>taxInformationNumber</code> in
  /// <code>MalaysiaAdditionalInfo</code> with NRIC type, and a valid MyKad or
  /// NRIC number. For business, you must specify a
  /// <code>businessRegistrationNumber</code> in
  /// <code>MalaysiaAdditionalInfo</code> with a TIN type and tax identification
  /// number. For business resellers, you must specify a
  /// <code>businessRegistrationNumber</code> and
  /// <code>taxInformationNumber</code> in <code>MalaysiaAdditionalInfo</code>
  /// with a sales and service tax (SST) type and a valid SST number.
  ///
  /// For business resellers with service codes, you must specify
  /// <code>businessRegistrationNumber</code>, <code>taxInformationNumber</code>,
  /// and distinct <code>serviceTaxCodes</code> in
  /// <code>MalaysiaAdditionalInfo</code> with a SST type and valid sales and
  /// service tax (SST) number. By using this API operation, Amazon Web Services
  /// registers your self-declaration that you’re an authorized business reseller
  /// registered with the Royal Malaysia Customs Department (RMCD), and have a
  /// valid SST number.
  final String? businessRegistrationNumber;

  /// List of service tax codes for your TRN in Malaysia.
  final List<MalaysiaServiceTaxCode>? serviceTaxCodes;

  /// The tax information number in Malaysia.
  ///
  /// For individual, you can specify the <code>taxInformationNumber</code> in
  /// <code>MalaysiaAdditionalInfo</code> with NRIC type, and a valid MyKad or
  /// NRIC number. For business resellers, you must specify a
  /// <code>businessRegistrationNumber</code> and
  /// <code>taxInformationNumber</code> in <code>MalaysiaAdditionalInfo</code>
  /// with a sales and service tax (SST) type and a valid SST number.
  ///
  /// For business resellers with service codes, you must specify
  /// <code>businessRegistrationNumber</code>, <code>taxInformationNumber</code>,
  /// and distinct <code>serviceTaxCodes</code> in
  /// <code>MalaysiaAdditionalInfo</code> with a SST type and valid sales and
  /// service tax (SST) number. By using this API operation, Amazon Web Services
  /// registers your self-declaration that you’re an authorized business reseller
  /// registered with the Royal Malaysia Customs Department (RMCD), and have a
  /// valid SST number.
  final String? taxInformationNumber;

  MalaysiaAdditionalInfo({
    this.businessRegistrationNumber,
    this.serviceTaxCodes,
    this.taxInformationNumber,
  });

  factory MalaysiaAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return MalaysiaAdditionalInfo(
      businessRegistrationNumber: json['businessRegistrationNumber'] as String?,
      serviceTaxCodes: (json['serviceTaxCodes'] as List?)
          ?.nonNulls
          .map((e) => MalaysiaServiceTaxCode.fromString((e as String)))
          .toList(),
      taxInformationNumber: json['taxInformationNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final businessRegistrationNumber = this.businessRegistrationNumber;
    final serviceTaxCodes = this.serviceTaxCodes;
    final taxInformationNumber = this.taxInformationNumber;
    return {
      if (businessRegistrationNumber != null)
        'businessRegistrationNumber': businessRegistrationNumber,
      if (serviceTaxCodes != null)
        'serviceTaxCodes': serviceTaxCodes.map((e) => e.value).toList(),
      if (taxInformationNumber != null)
        'taxInformationNumber': taxInformationNumber,
    };
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
      customerType: IsraelCustomerType.fromString(
          (json['customerType'] as String?) ?? ''),
      dealerType:
          IsraelDealerType.fromString((json['dealerType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final customerType = this.customerType;
    final dealerType = this.dealerType;
    return {
      'customerType': customerType.value,
      'dealerType': dealerType.value,
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
      registryCommercialCode: (json['registryCommercialCode'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final registryCommercialCode = this.registryCommercialCode;
    return {
      'registryCommercialCode': registryCommercialCode,
    };
  }
}

/// Additional tax information associated with your TRN in Canada .
class CanadaAdditionalInfo {
  /// The Quebec Sales Tax ID number. Leave blank if you do not have a Quebec
  /// Sales Tax ID number.
  final String? canadaQuebecSalesTaxNumber;

  /// Manitoba Retail Sales Tax ID number. Customers purchasing Amazon Web
  /// Services services for resale in Manitoba must provide a valid Retail Sales
  /// Tax ID number for Manitoba. Leave this blank if you do not have a Retail
  /// Sales Tax ID number in Manitoba or are not purchasing Amazon Web Services
  /// services for resale.
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

/// Additional tax information associated with your TRN in Spain.
class SpainAdditionalInfo {
  /// The registration type in Spain.
  final RegistrationType registrationType;

  SpainAdditionalInfo({
    required this.registrationType,
  });

  factory SpainAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return SpainAdditionalInfo(
      registrationType: RegistrationType.fromString(
          (json['registrationType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final registrationType = this.registrationType;
    return {
      'registrationType': registrationType.value,
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
      personType: PersonType.fromString((json['personType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final personType = this.personType;
    return {
      'personType': personType.value,
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
      businessRepresentativeName:
          (json['businessRepresentativeName'] as String?) ?? '',
      itemOfBusiness: (json['itemOfBusiness'] as String?) ?? '',
      lineOfBusiness: (json['lineOfBusiness'] as String?) ?? '',
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
      industries: (json['industries'] as String?)?.let(Industries.fromString),
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
      if (industries != null) 'industries': industries.value,
      if (kepEmailId != null) 'kepEmailId': kepEmailId,
      if (secondaryTaxId != null) 'secondaryTaxId': secondaryTaxId,
      if (taxOffice != null) 'taxOffice': taxOffice,
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
      personType: PersonType.fromString((json['personType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final personType = this.personType;
    return {
      'personType': personType.value,
    };
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
      taxRegistrationNumberType: TaxRegistrationNumberType.fromString(
          (json['taxRegistrationNumberType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final taxRegistrationNumberType = this.taxRegistrationNumberType;
    return {
      'taxRegistrationNumberType': taxRegistrationNumberType.value,
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
      ukraineTrnType:
          UkraineTrnType.fromString((json['ukraineTrnType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final ukraineTrnType = this.ukraineTrnType;
    return {
      'ukraineTrnType': ukraineTrnType.value,
    };
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
          ?.let(SaudiArabiaTaxRegistrationNumberType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final taxRegistrationNumberType = this.taxRegistrationNumberType;
    return {
      if (taxRegistrationNumberType != null)
        'taxRegistrationNumberType': taxRegistrationNumberType.value,
    };
  }
}

/// Additional tax information associated with your TRN in Indonesia.
class IndonesiaAdditionalInfo {
  /// VAT-exempt customers have a Directorate General of Taxation (DGT) exemption
  /// letter or certificate (Surat Keterangan Bebas) decision number.
  /// Non-collected VAT have a DGT letter or certificate (Surat Keterangan Tidak
  /// Dipungut).
  final String? decisionNumber;

  /// Exception code if you are designated by Directorate General of Taxation
  /// (DGT) as a VAT collector, non-collected VAT, or VAT-exempt customer.
  final String? ppnExceptionDesignationCode;

  /// The tax registration number type.
  final IndonesiaTaxRegistrationNumberType? taxRegistrationNumberType;

  IndonesiaAdditionalInfo({
    this.decisionNumber,
    this.ppnExceptionDesignationCode,
    this.taxRegistrationNumberType,
  });

  factory IndonesiaAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return IndonesiaAdditionalInfo(
      decisionNumber: json['decisionNumber'] as String?,
      ppnExceptionDesignationCode:
          json['ppnExceptionDesignationCode'] as String?,
      taxRegistrationNumberType: (json['taxRegistrationNumberType'] as String?)
          ?.let(IndonesiaTaxRegistrationNumberType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final decisionNumber = this.decisionNumber;
    final ppnExceptionDesignationCode = this.ppnExceptionDesignationCode;
    final taxRegistrationNumberType = this.taxRegistrationNumberType;
    return {
      if (decisionNumber != null) 'decisionNumber': decisionNumber,
      if (ppnExceptionDesignationCode != null)
        'ppnExceptionDesignationCode': ppnExceptionDesignationCode,
      if (taxRegistrationNumberType != null)
        'taxRegistrationNumberType': taxRegistrationNumberType.value,
    };
  }
}

/// Additional tax information to specify for a TRN in Vietnam.
class VietnamAdditionalInfo {
  /// The electronic transaction code number on the tax return document. This
  /// field must be provided for successful API operation.
  final String? electronicTransactionCodeNumber;

  /// The enterprise identification number for tax registration. This field must
  /// be provided for successful API operation.
  final String? enterpriseIdentificationNumber;

  /// The payment voucher number on the tax return payment document. This field
  /// must be provided for successful API operation.
  final String? paymentVoucherNumber;

  /// The date on the tax return payment document. This field must be provided for
  /// successful API operation.
  final String? paymentVoucherNumberDate;

  VietnamAdditionalInfo({
    this.electronicTransactionCodeNumber,
    this.enterpriseIdentificationNumber,
    this.paymentVoucherNumber,
    this.paymentVoucherNumberDate,
  });

  factory VietnamAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return VietnamAdditionalInfo(
      electronicTransactionCodeNumber:
          json['electronicTransactionCodeNumber'] as String?,
      enterpriseIdentificationNumber:
          json['enterpriseIdentificationNumber'] as String?,
      paymentVoucherNumber: json['paymentVoucherNumber'] as String?,
      paymentVoucherNumberDate: json['paymentVoucherNumberDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final electronicTransactionCodeNumber =
        this.electronicTransactionCodeNumber;
    final enterpriseIdentificationNumber = this.enterpriseIdentificationNumber;
    final paymentVoucherNumber = this.paymentVoucherNumber;
    final paymentVoucherNumberDate = this.paymentVoucherNumberDate;
    return {
      if (electronicTransactionCodeNumber != null)
        'electronicTransactionCodeNumber': electronicTransactionCodeNumber,
      if (enterpriseIdentificationNumber != null)
        'enterpriseIdentificationNumber': enterpriseIdentificationNumber,
      if (paymentVoucherNumber != null)
        'paymentVoucherNumber': paymentVoucherNumber,
      if (paymentVoucherNumberDate != null)
        'paymentVoucherNumberDate': paymentVoucherNumberDate,
    };
  }
}

/// Additional tax information to specify for a TRN in Egypt.
class EgyptAdditionalInfo {
  /// The unique identification number provided by the Egypt Tax Authority.
  final String? uniqueIdentificationNumber;

  /// The expiration date of the unique identification number provided by the
  /// Egypt Tax Authority.
  final String? uniqueIdentificationNumberExpirationDate;

  EgyptAdditionalInfo({
    this.uniqueIdentificationNumber,
    this.uniqueIdentificationNumberExpirationDate,
  });

  factory EgyptAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return EgyptAdditionalInfo(
      uniqueIdentificationNumber: json['uniqueIdentificationNumber'] as String?,
      uniqueIdentificationNumberExpirationDate:
          json['uniqueIdentificationNumberExpirationDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final uniqueIdentificationNumber = this.uniqueIdentificationNumber;
    final uniqueIdentificationNumberExpirationDate =
        this.uniqueIdentificationNumberExpirationDate;
    return {
      if (uniqueIdentificationNumber != null)
        'uniqueIdentificationNumber': uniqueIdentificationNumber,
      if (uniqueIdentificationNumberExpirationDate != null)
        'uniqueIdentificationNumberExpirationDate':
            uniqueIdentificationNumberExpirationDate,
    };
  }
}

/// Additional tax information to specify for a TRN in Greece.
class GreeceAdditionalInfo {
  /// The code of contracting authority for e-invoicing.
  final String? contractingAuthorityCode;

  GreeceAdditionalInfo({
    this.contractingAuthorityCode,
  });

  factory GreeceAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return GreeceAdditionalInfo(
      contractingAuthorityCode: json['contractingAuthorityCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contractingAuthorityCode = this.contractingAuthorityCode;
    return {
      if (contractingAuthorityCode != null)
        'contractingAuthorityCode': contractingAuthorityCode,
    };
  }
}

/// Additional tax information to specify for a TRN in Uzbekistan.
class UzbekistanAdditionalInfo {
  /// The tax registration number type. The tax registration number type valid
  /// values are <code>Business</code> and <code>Individual</code>.
  final UzbekistanTaxRegistrationNumberType? taxRegistrationNumberType;

  /// The unique 12-digit number issued to identify VAT-registered identities in
  /// Uzbekistan.
  final String? vatRegistrationNumber;

  UzbekistanAdditionalInfo({
    this.taxRegistrationNumberType,
    this.vatRegistrationNumber,
  });

  factory UzbekistanAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return UzbekistanAdditionalInfo(
      taxRegistrationNumberType: (json['taxRegistrationNumberType'] as String?)
          ?.let(UzbekistanTaxRegistrationNumberType.fromString),
      vatRegistrationNumber: json['vatRegistrationNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taxRegistrationNumberType = this.taxRegistrationNumberType;
    final vatRegistrationNumber = this.vatRegistrationNumber;
    return {
      if (taxRegistrationNumberType != null)
        'taxRegistrationNumberType': taxRegistrationNumberType.value,
      if (vatRegistrationNumber != null)
        'vatRegistrationNumber': vatRegistrationNumber,
    };
  }
}

class UzbekistanTaxRegistrationNumberType {
  static const business = UzbekistanTaxRegistrationNumberType._('Business');
  static const individual = UzbekistanTaxRegistrationNumberType._('Individual');

  final String value;

  const UzbekistanTaxRegistrationNumberType._(this.value);

  static const values = [business, individual];

  static UzbekistanTaxRegistrationNumberType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UzbekistanTaxRegistrationNumberType._(value));

  @override
  bool operator ==(other) =>
      other is UzbekistanTaxRegistrationNumberType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class IndonesiaTaxRegistrationNumberType {
  static const nik = IndonesiaTaxRegistrationNumberType._('NIK');
  static const passportNumber =
      IndonesiaTaxRegistrationNumberType._('PassportNumber');
  static const npwp = IndonesiaTaxRegistrationNumberType._('NPWP');
  static const nitku = IndonesiaTaxRegistrationNumberType._('NITKU');

  final String value;

  const IndonesiaTaxRegistrationNumberType._(this.value);

  static const values = [nik, passportNumber, npwp, nitku];

  static IndonesiaTaxRegistrationNumberType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IndonesiaTaxRegistrationNumberType._(value));

  @override
  bool operator ==(other) =>
      other is IndonesiaTaxRegistrationNumberType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SaudiArabiaTaxRegistrationNumberType {
  static const taxRegistrationNumber =
      SaudiArabiaTaxRegistrationNumberType._('TaxRegistrationNumber');
  static const taxIdentificationNumber =
      SaudiArabiaTaxRegistrationNumberType._('TaxIdentificationNumber');
  static const commercialRegistrationNumber =
      SaudiArabiaTaxRegistrationNumberType._('CommercialRegistrationNumber');

  final String value;

  const SaudiArabiaTaxRegistrationNumberType._(this.value);

  static const values = [
    taxRegistrationNumber,
    taxIdentificationNumber,
    commercialRegistrationNumber
  ];

  static SaudiArabiaTaxRegistrationNumberType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SaudiArabiaTaxRegistrationNumberType._(value));

  @override
  bool operator ==(other) =>
      other is SaudiArabiaTaxRegistrationNumberType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class UkraineTrnType {
  static const business = UkraineTrnType._('Business');
  static const individual = UkraineTrnType._('Individual');

  final String value;

  const UkraineTrnType._(this.value);

  static const values = [business, individual];

  static UkraineTrnType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UkraineTrnType._(value));

  @override
  bool operator ==(other) => other is UkraineTrnType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class TaxRegistrationNumberType {
  static const taxRegistrationNumber =
      TaxRegistrationNumberType._('TaxRegistrationNumber');
  static const localRegistrationNumber =
      TaxRegistrationNumberType._('LocalRegistrationNumber');

  final String value;

  const TaxRegistrationNumberType._(this.value);

  static const values = [taxRegistrationNumber, localRegistrationNumber];

  static TaxRegistrationNumberType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaxRegistrationNumberType._(value));

  @override
  bool operator ==(other) =>
      other is TaxRegistrationNumberType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PersonType {
  static const legalPerson = PersonType._('Legal Person');
  static const physicalPerson = PersonType._('Physical Person');
  static const business = PersonType._('Business');

  final String value;

  const PersonType._(this.value);

  static const values = [legalPerson, physicalPerson, business];

  static PersonType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PersonType._(value));

  @override
  bool operator ==(other) => other is PersonType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Industries {
  static const circulatingOrg = Industries._('CirculatingOrg');
  static const professionalOrg = Industries._('ProfessionalOrg');
  static const banks = Industries._('Banks');
  static const insurance = Industries._('Insurance');
  static const pensionAndBenefitFunds = Industries._('PensionAndBenefitFunds');
  static const developmentAgencies = Industries._('DevelopmentAgencies');

  final String value;

  const Industries._(this.value);

  static const values = [
    circulatingOrg,
    professionalOrg,
    banks,
    insurance,
    pensionAndBenefitFunds,
    developmentAgencies
  ];

  static Industries fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Industries._(value));

  @override
  bool operator ==(other) => other is Industries && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class RegistrationType {
  static const intraEu = RegistrationType._('Intra-EU');
  static const local = RegistrationType._('Local');

  final String value;

  const RegistrationType._(this.value);

  static const values = [intraEu, local];

  static RegistrationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistrationType._(value));

  @override
  bool operator ==(other) => other is RegistrationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class IsraelDealerType {
  static const authorized = IsraelDealerType._('Authorized');
  static const nonAuthorized = IsraelDealerType._('Non-authorized');

  final String value;

  const IsraelDealerType._(this.value);

  static const values = [authorized, nonAuthorized];

  static IsraelDealerType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IsraelDealerType._(value));

  @override
  bool operator ==(other) => other is IsraelDealerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class IsraelCustomerType {
  static const business = IsraelCustomerType._('Business');
  static const individual = IsraelCustomerType._('Individual');

  final String value;

  const IsraelCustomerType._(this.value);

  static const values = [business, individual];

  static IsraelCustomerType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IsraelCustomerType._(value));

  @override
  bool operator ==(other) =>
      other is IsraelCustomerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class MalaysiaServiceTaxCode {
  static const consultancy = MalaysiaServiceTaxCode._('Consultancy');
  static const digitalServiceAndElectronicMedium =
      MalaysiaServiceTaxCode._('Digital Service And Electronic Medium');
  static const itServices = MalaysiaServiceTaxCode._('IT Services');
  static const trainingOrCoaching =
      MalaysiaServiceTaxCode._('Training Or Coaching');

  final String value;

  const MalaysiaServiceTaxCode._(this.value);

  static const values = [
    consultancy,
    digitalServiceAndElectronicMedium,
    itServices,
    trainingOrCoaching
  ];

  static MalaysiaServiceTaxCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MalaysiaServiceTaxCode._(value));

  @override
  bool operator ==(other) =>
      other is MalaysiaServiceTaxCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class HeritageStatus {
  static const optIn = HeritageStatus._('OptIn');
  static const optOut = HeritageStatus._('OptOut');

  final String value;

  const HeritageStatus._(this.value);

  static const values = [optIn, optOut];

  static HeritageStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HeritageStatus._(value));

  @override
  bool operator ==(other) => other is HeritageStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The address domain associate with the tax information.
class Authority {
  /// The country code for the country that the address is in.
  final String country;

  /// The state that the address is located.
  final String? state;

  Authority({
    required this.country,
    this.state,
  });

  factory Authority.fromJson(Map<String, dynamic> json) {
    return Authority(
      country: (json['country'] as String?) ?? '',
      state: json['state'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final country = this.country;
    final state = this.state;
    return {
      'country': country,
      if (state != null) 'state': state,
    };
  }
}

/// The exemption certificate.
class ExemptionCertificate {
  /// The exemption certificate file content.
  final Uint8List documentFile;

  /// The exemption certificate file name.
  final String documentName;

  ExemptionCertificate({
    required this.documentFile,
    required this.documentName,
  });

  Map<String, dynamic> toJson() {
    final documentFile = this.documentFile;
    final documentName = this.documentName;
    return {
      'documentFile': base64Encode(documentFile),
      'documentName': documentName,
    };
  }
}

/// The supplemental TRN information to provide when adding or updating a
/// supplemental TRN.
class SupplementalTaxRegistrationEntry {
  final Address address;

  /// The legal name associated with your TRN registration.
  final String legalName;

  /// The supplemental TRN unique identifier.
  final String registrationId;

  /// Type of supplemental TRN. Currently, this can only be VAT.
  final SupplementalTaxRegistrationType registrationType;

  SupplementalTaxRegistrationEntry({
    required this.address,
    required this.legalName,
    required this.registrationId,
    required this.registrationType,
  });

  Map<String, dynamic> toJson() {
    final address = this.address;
    final legalName = this.legalName;
    final registrationId = this.registrationId;
    final registrationType = this.registrationType;
    return {
      'address': address,
      'legalName': legalName,
      'registrationId': registrationId,
      'registrationType': registrationType.value,
    };
  }
}

class SupplementalTaxRegistrationType {
  static const vat = SupplementalTaxRegistrationType._('VAT');

  final String value;

  const SupplementalTaxRegistrationType._(this.value);

  static const values = [vat];

  static SupplementalTaxRegistrationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SupplementalTaxRegistrationType._(value));

  @override
  bool operator ==(other) =>
      other is SupplementalTaxRegistrationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      jurisdiction: Jurisdiction.fromJson(
          (json['jurisdiction'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      legalName: (json['legalName'] as String?) ?? '',
      registrationId: (json['registrationId'] as String?) ?? '',
      registrationType: TaxRegistrationType.fromString(
          (json['registrationType'] as String?) ?? ''),
      status:
          TaxRegistrationStatus.fromString((json['status'] as String?) ?? ''),
      additionalTaxInformation: json['additionalTaxInformation'] != null
          ? AdditionalInfoResponse.fromJson(
              json['additionalTaxInformation'] as Map<String, dynamic>)
          : null,
      certifiedEmailId: json['certifiedEmailId'] as String?,
      sector: (json['sector'] as String?)?.let(Sector.fromString),
      taxDocumentMetadatas: (json['taxDocumentMetadatas'] as List?)
          ?.nonNulls
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
      'registrationType': registrationType.value,
      'status': status.value,
      if (additionalTaxInformation != null)
        'additionalTaxInformation': additionalTaxInformation,
      if (certifiedEmailId != null) 'certifiedEmailId': certifiedEmailId,
      if (sector != null) 'sector': sector.value,
      if (taxDocumentMetadatas != null)
        'taxDocumentMetadatas': taxDocumentMetadatas,
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
          (k, e) => MapEntry(AddressRoleType.fromString(k),
              Jurisdiction.fromJson(e as Map<String, dynamic>))),
      addressType:
          (json['addressType'] as String?)?.let(AddressRoleType.fromString),
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
        'addressRoleMap': addressRoleMap.map((k, e) => MapEntry(k.value, e)),
      if (addressType != null) 'addressType': addressType.value,
      if (seller != null) 'seller': seller,
    };
  }
}

class AddressRoleType {
  static const taxAddress = AddressRoleType._('TaxAddress');
  static const billingAddress = AddressRoleType._('BillingAddress');
  static const contactAddress = AddressRoleType._('ContactAddress');

  final String value;

  const AddressRoleType._(this.value);

  static const values = [taxAddress, billingAddress, contactAddress];

  static AddressRoleType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AddressRoleType._(value));

  @override
  bool operator ==(other) => other is AddressRoleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      countryCode: (json['countryCode'] as String?) ?? '',
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

  /// Additional tax information to specify for a TRN in Egypt.
  final EgyptAdditionalInfo? egyptAdditionalInfo;

  /// Additional tax information associated with your TRN in Estonia.
  final EstoniaAdditionalInfo? estoniaAdditionalInfo;

  /// Additional tax information associated with your TRN in Georgia.
  final GeorgiaAdditionalInfo? georgiaAdditionalInfo;

  /// Additional tax information to specify for a TRN in Greece.
  final GreeceAdditionalInfo? greeceAdditionalInfo;

  /// Additional tax information in India.
  final IndiaAdditionalInfo? indiaAdditionalInfo;

  /// Additional tax information associated with your TRN in Indonesia.
  final IndonesiaAdditionalInfo? indonesiaAdditionalInfo;

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

  /// Additional tax information associated with your TRN in Uzbekistan.
  final UzbekistanAdditionalInfo? uzbekistanAdditionalInfo;

  /// Additional tax information to specify for a TRN in Vietnam.
  final VietnamAdditionalInfo? vietnamAdditionalInfo;

  AdditionalInfoResponse({
    this.brazilAdditionalInfo,
    this.canadaAdditionalInfo,
    this.egyptAdditionalInfo,
    this.estoniaAdditionalInfo,
    this.georgiaAdditionalInfo,
    this.greeceAdditionalInfo,
    this.indiaAdditionalInfo,
    this.indonesiaAdditionalInfo,
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
    this.uzbekistanAdditionalInfo,
    this.vietnamAdditionalInfo,
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
      egyptAdditionalInfo: json['egyptAdditionalInfo'] != null
          ? EgyptAdditionalInfo.fromJson(
              json['egyptAdditionalInfo'] as Map<String, dynamic>)
          : null,
      estoniaAdditionalInfo: json['estoniaAdditionalInfo'] != null
          ? EstoniaAdditionalInfo.fromJson(
              json['estoniaAdditionalInfo'] as Map<String, dynamic>)
          : null,
      georgiaAdditionalInfo: json['georgiaAdditionalInfo'] != null
          ? GeorgiaAdditionalInfo.fromJson(
              json['georgiaAdditionalInfo'] as Map<String, dynamic>)
          : null,
      greeceAdditionalInfo: json['greeceAdditionalInfo'] != null
          ? GreeceAdditionalInfo.fromJson(
              json['greeceAdditionalInfo'] as Map<String, dynamic>)
          : null,
      indiaAdditionalInfo: json['indiaAdditionalInfo'] != null
          ? IndiaAdditionalInfo.fromJson(
              json['indiaAdditionalInfo'] as Map<String, dynamic>)
          : null,
      indonesiaAdditionalInfo: json['indonesiaAdditionalInfo'] != null
          ? IndonesiaAdditionalInfo.fromJson(
              json['indonesiaAdditionalInfo'] as Map<String, dynamic>)
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
      uzbekistanAdditionalInfo: json['uzbekistanAdditionalInfo'] != null
          ? UzbekistanAdditionalInfo.fromJson(
              json['uzbekistanAdditionalInfo'] as Map<String, dynamic>)
          : null,
      vietnamAdditionalInfo: json['vietnamAdditionalInfo'] != null
          ? VietnamAdditionalInfo.fromJson(
              json['vietnamAdditionalInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final brazilAdditionalInfo = this.brazilAdditionalInfo;
    final canadaAdditionalInfo = this.canadaAdditionalInfo;
    final egyptAdditionalInfo = this.egyptAdditionalInfo;
    final estoniaAdditionalInfo = this.estoniaAdditionalInfo;
    final georgiaAdditionalInfo = this.georgiaAdditionalInfo;
    final greeceAdditionalInfo = this.greeceAdditionalInfo;
    final indiaAdditionalInfo = this.indiaAdditionalInfo;
    final indonesiaAdditionalInfo = this.indonesiaAdditionalInfo;
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
    final uzbekistanAdditionalInfo = this.uzbekistanAdditionalInfo;
    final vietnamAdditionalInfo = this.vietnamAdditionalInfo;
    return {
      if (brazilAdditionalInfo != null)
        'brazilAdditionalInfo': brazilAdditionalInfo,
      if (canadaAdditionalInfo != null)
        'canadaAdditionalInfo': canadaAdditionalInfo,
      if (egyptAdditionalInfo != null)
        'egyptAdditionalInfo': egyptAdditionalInfo,
      if (estoniaAdditionalInfo != null)
        'estoniaAdditionalInfo': estoniaAdditionalInfo,
      if (georgiaAdditionalInfo != null)
        'georgiaAdditionalInfo': georgiaAdditionalInfo,
      if (greeceAdditionalInfo != null)
        'greeceAdditionalInfo': greeceAdditionalInfo,
      if (indiaAdditionalInfo != null)
        'indiaAdditionalInfo': indiaAdditionalInfo,
      if (indonesiaAdditionalInfo != null)
        'indonesiaAdditionalInfo': indonesiaAdditionalInfo,
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
      if (uzbekistanAdditionalInfo != null)
        'uzbekistanAdditionalInfo': uzbekistanAdditionalInfo,
      if (vietnamAdditionalInfo != null)
        'vietnamAdditionalInfo': vietnamAdditionalInfo,
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
      taxDocumentAccessToken: (json['taxDocumentAccessToken'] as String?) ?? '',
      taxDocumentName: (json['taxDocumentName'] as String?) ?? '',
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

/// The tax exemption details.
class TaxExemptionDetails {
  /// The indicator if the tax exemption is inherited from the consolidated
  /// billing family management account.
  final bool? heritageObtainedDetails;

  /// The consolidated billing family management account the tax exemption
  /// inherited from.
  final String? heritageObtainedParentEntity;

  /// The reason of the heritage inheritance.
  final String? heritageObtainedReason;

  /// Tax exemptions.
  final List<TaxExemption>? taxExemptions;

  TaxExemptionDetails({
    this.heritageObtainedDetails,
    this.heritageObtainedParentEntity,
    this.heritageObtainedReason,
    this.taxExemptions,
  });

  factory TaxExemptionDetails.fromJson(Map<String, dynamic> json) {
    return TaxExemptionDetails(
      heritageObtainedDetails: json['heritageObtainedDetails'] as bool?,
      heritageObtainedParentEntity:
          json['heritageObtainedParentEntity'] as String?,
      heritageObtainedReason: json['heritageObtainedReason'] as String?,
      taxExemptions: (json['taxExemptions'] as List?)
          ?.nonNulls
          .map((e) => TaxExemption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final heritageObtainedDetails = this.heritageObtainedDetails;
    final heritageObtainedParentEntity = this.heritageObtainedParentEntity;
    final heritageObtainedReason = this.heritageObtainedReason;
    final taxExemptions = this.taxExemptions;
    return {
      if (heritageObtainedDetails != null)
        'heritageObtainedDetails': heritageObtainedDetails,
      if (heritageObtainedParentEntity != null)
        'heritageObtainedParentEntity': heritageObtainedParentEntity,
      if (heritageObtainedReason != null)
        'heritageObtainedReason': heritageObtainedReason,
      if (taxExemptions != null) 'taxExemptions': taxExemptions,
    };
  }
}

/// The tax exemption.
class TaxExemption {
  /// The address domain associate with tax exemption.
  final Authority authority;

  /// The tax exemption type.
  final TaxExemptionType taxExemptionType;

  /// The tax exemption effective date.
  final DateTime? effectiveDate;

  /// The tax exemption expiration date.
  final DateTime? expirationDate;

  /// The tax exemption status.
  final EntityExemptionAccountStatus? status;

  /// The tax exemption recording time in the <code>TaxSettings</code> system.
  final DateTime? systemEffectiveDate;

  TaxExemption({
    required this.authority,
    required this.taxExemptionType,
    this.effectiveDate,
    this.expirationDate,
    this.status,
    this.systemEffectiveDate,
  });

  factory TaxExemption.fromJson(Map<String, dynamic> json) {
    return TaxExemption(
      authority: Authority.fromJson(
          (json['authority'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      taxExemptionType: TaxExemptionType.fromJson(
          (json['taxExemptionType'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      effectiveDate: timeStampFromJson(json['effectiveDate']),
      expirationDate: timeStampFromJson(json['expirationDate']),
      status: (json['status'] as String?)
          ?.let(EntityExemptionAccountStatus.fromString),
      systemEffectiveDate: timeStampFromJson(json['systemEffectiveDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final authority = this.authority;
    final taxExemptionType = this.taxExemptionType;
    final effectiveDate = this.effectiveDate;
    final expirationDate = this.expirationDate;
    final status = this.status;
    final systemEffectiveDate = this.systemEffectiveDate;
    return {
      'authority': authority,
      'taxExemptionType': taxExemptionType,
      if (effectiveDate != null)
        'effectiveDate': unixTimestampToJson(effectiveDate),
      if (expirationDate != null)
        'expirationDate': unixTimestampToJson(expirationDate),
      if (status != null) 'status': status.value,
      if (systemEffectiveDate != null)
        'systemEffectiveDate': unixTimestampToJson(systemEffectiveDate),
    };
  }
}

/// The tax exemption type.
class TaxExemptionType {
  /// The tax exemption's applicable jurisdictions.
  final List<Authority>? applicableJurisdictions;

  /// The tax exemption's type description.
  final String? description;

  /// The tax exemption's type display name.
  final String? displayName;

  TaxExemptionType({
    this.applicableJurisdictions,
    this.description,
    this.displayName,
  });

  factory TaxExemptionType.fromJson(Map<String, dynamic> json) {
    return TaxExemptionType(
      applicableJurisdictions: (json['applicableJurisdictions'] as List?)
          ?.nonNulls
          .map((e) => Authority.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicableJurisdictions = this.applicableJurisdictions;
    final description = this.description;
    final displayName = this.displayName;
    return {
      if (applicableJurisdictions != null)
        'applicableJurisdictions': applicableJurisdictions,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
    };
  }
}

class EntityExemptionAccountStatus {
  static const none = EntityExemptionAccountStatus._('None');
  static const valid = EntityExemptionAccountStatus._('Valid');
  static const expired = EntityExemptionAccountStatus._('Expired');
  static const pending = EntityExemptionAccountStatus._('Pending');

  final String value;

  const EntityExemptionAccountStatus._(this.value);

  static const values = [none, valid, expired, pending];

  static EntityExemptionAccountStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EntityExemptionAccountStatus._(value));

  @override
  bool operator ==(other) =>
      other is EntityExemptionAccountStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Supplemental TRN details.
class SupplementalTaxRegistration {
  final Address address;

  /// Unique authority ID for the supplemental TRN.
  final String authorityId;

  /// The legal name associated with your TRN registration.
  final String legalName;

  /// The supplemental TRN unique identifier.
  final String registrationId;

  /// Type of supplemental TRN. Currently, this can only be VAT.
  final SupplementalTaxRegistrationType registrationType;

  /// The status of your TRN.
  final TaxRegistrationStatus status;

  SupplementalTaxRegistration({
    required this.address,
    required this.authorityId,
    required this.legalName,
    required this.registrationId,
    required this.registrationType,
    required this.status,
  });

  factory SupplementalTaxRegistration.fromJson(Map<String, dynamic> json) {
    return SupplementalTaxRegistration(
      address: Address.fromJson((json['address'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      authorityId: (json['authorityId'] as String?) ?? '',
      legalName: (json['legalName'] as String?) ?? '',
      registrationId: (json['registrationId'] as String?) ?? '',
      registrationType: SupplementalTaxRegistrationType.fromString(
          (json['registrationType'] as String?) ?? ''),
      status:
          TaxRegistrationStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final authorityId = this.authorityId;
    final legalName = this.legalName;
    final registrationId = this.registrationId;
    final registrationType = this.registrationType;
    final status = this.status;
    return {
      'address': address,
      'authorityId': authorityId,
      'legalName': legalName,
      'registrationId': registrationId,
      'registrationType': registrationType.value,
      'status': status.value,
    };
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

/// Your TRN information.
class TaxRegistration {
  /// The legal address associated with your TRN registration.
  final Address legalAddress;

  /// The legal name associated with your TRN registration.
  final String legalName;

  /// Your tax registration unique identifier.
  final String registrationId;

  /// Type of your tax registration.
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
      legalAddress: Address.fromJson(
          (json['legalAddress'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      legalName: (json['legalName'] as String?) ?? '',
      registrationId: (json['registrationId'] as String?) ?? '',
      registrationType: TaxRegistrationType.fromString(
          (json['registrationType'] as String?) ?? ''),
      status:
          TaxRegistrationStatus.fromString((json['status'] as String?) ?? ''),
      additionalTaxInformation: json['additionalTaxInformation'] != null
          ? AdditionalInfoResponse.fromJson(
              json['additionalTaxInformation'] as Map<String, dynamic>)
          : null,
      certifiedEmailId: json['certifiedEmailId'] as String?,
      sector: (json['sector'] as String?)?.let(Sector.fromString),
      taxDocumentMetadatas: (json['taxDocumentMetadatas'] as List?)
          ?.nonNulls
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
      'registrationType': registrationType.value,
      'status': status.value,
      if (additionalTaxInformation != null)
        'additionalTaxInformation': additionalTaxInformation,
      if (certifiedEmailId != null) 'certifiedEmailId': certifiedEmailId,
      if (sector != null) 'sector': sector.value,
      if (taxDocumentMetadatas != null)
        'taxDocumentMetadatas': taxDocumentMetadatas,
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
      accountId: (json['accountId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
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
      accountId: (json['accountId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AttachmentUploadException extends _s.GenericAwsException {
  AttachmentUploadException({String? type, String? message})
      : super(type: type, code: 'AttachmentUploadException', message: message);
}

class CaseCreationLimitExceededException extends _s.GenericAwsException {
  CaseCreationLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'CaseCreationLimitExceededException',
            message: message);
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
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AttachmentUploadException': (type, message) =>
      AttachmentUploadException(type: type, message: message),
  'CaseCreationLimitExceededException': (type, message) =>
      CaseCreationLimitExceededException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};

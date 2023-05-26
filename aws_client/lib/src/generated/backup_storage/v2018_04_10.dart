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

/// The frontend service for Cryo Storage.
class BackupStorage {
  final _s.RestJsonProtocol _protocol;
  BackupStorage({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'backupstorage',
            signingName: 'backup-storage',
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

  /// Delete Object from the incremental base Backup.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceInternalException].
  /// May throw [RetryableException].
  /// May throw [IllegalArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [backupJobId] :
  /// Backup job Id for the in-progress backup.
  ///
  /// Parameter [objectName] :
  /// The name of the Object.
  Future<void> deleteObject({
    required String backupJobId,
    required String objectName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/backup-jobs/${Uri.encodeComponent(backupJobId)}/object/${Uri.encodeComponent(objectName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the specified object's chunk.
  ///
  /// May throw [IllegalArgumentException].
  /// May throw [RetryableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceInternalException].
  /// May throw [ThrottlingException].
  /// May throw [KMSInvalidKeyUsageException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [chunkToken] :
  /// Chunk token
  ///
  /// Parameter [storageJobId] :
  /// Storage job id
  Future<GetChunkOutput> getChunk({
    required String chunkToken,
    required String storageJobId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/restore-jobs/${Uri.encodeComponent(storageJobId)}/chunk/${Uri.encodeComponent(chunkToken)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetChunkOutput(
      data: await response.stream.toBytes(),
      checksum:
          _s.extractHeaderStringValue(response.headers, 'x-amz-checksum')!,
      checksumAlgorithm: (_s
          .extractHeaderStringValue(
              response.headers, 'x-amz-checksum-algorithm')
          ?.toDataChecksumAlgorithm())!,
      length: _s.extractHeaderIntValue(response.headers, 'x-amz-data-length')!,
    );
  }

  /// Get metadata associated with an Object.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceInternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RetryableException].
  /// May throw [IllegalArgumentException].
  /// May throw [ThrottlingException].
  /// May throw [KMSInvalidKeyUsageException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [objectToken] :
  /// Object token.
  ///
  /// Parameter [storageJobId] :
  /// Backup job id for the in-progress backup.
  Future<GetObjectMetadataOutput> getObjectMetadata({
    required String objectToken,
    required String storageJobId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/restore-jobs/${Uri.encodeComponent(storageJobId)}/object/${Uri.encodeComponent(objectToken)}/metadata',
      exceptionFnMap: _exceptionFns,
    );
    return GetObjectMetadataOutput(
      metadataBlob: await response.stream.toBytes(),
      metadataBlobChecksum:
          _s.extractHeaderStringValue(response.headers, 'x-amz-checksum'),
      metadataBlobChecksumAlgorithm: _s
          .extractHeaderStringValue(
              response.headers, 'x-amz-checksum-algorithm')
          ?.toDataChecksumAlgorithm(),
      metadataBlobLength:
          _s.extractHeaderIntValue(response.headers, 'x-amz-data-length'),
      metadataString: _s.extractHeaderStringValue(
          response.headers, 'x-amz-metadata-string'),
    );
  }

  /// List chunks in a given Object
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceInternalException].
  /// May throw [RetryableException].
  /// May throw [IllegalArgumentException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [objectToken] :
  /// Object token
  ///
  /// Parameter [storageJobId] :
  /// Storage job id
  ///
  /// Parameter [maxResults] :
  /// Maximum number of chunks
  ///
  /// Parameter [nextToken] :
  /// Pagination token
  Future<ListChunksOutput> listChunks({
    required String objectToken,
    required String storageJobId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restore-jobs/${Uri.encodeComponent(storageJobId)}/chunks/${Uri.encodeComponent(objectToken)}/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChunksOutput.fromJson(response);
  }

  /// List all Objects in a given Backup.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceInternalException].
  /// May throw [RetryableException].
  /// May throw [IllegalArgumentException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [KMSInvalidKeyUsageException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [storageJobId] :
  /// Storage job id
  ///
  /// Parameter [createdAfter] :
  /// (Optional) Created after filter
  ///
  /// Parameter [createdBefore] :
  /// (Optional) Created before filter
  ///
  /// Parameter [maxResults] :
  /// Maximum objects count
  ///
  /// Parameter [nextToken] :
  /// Pagination token
  ///
  /// Parameter [startingObjectName] :
  /// Optional, specifies the starting Object name to list from. Ignored if
  /// NextToken is not NULL
  ///
  /// Parameter [startingObjectPrefix] :
  /// Optional, specifies the starting Object prefix to list from. Ignored if
  /// NextToken is not NULL
  Future<ListObjectsOutput> listObjects({
    required String storageJobId,
    DateTime? createdAfter,
    DateTime? createdBefore,
    int? maxResults,
    String? nextToken,
    String? startingObjectName,
    String? startingObjectPrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (createdAfter != null)
        'created-after': [_s.iso8601ToJson(createdAfter).toString()],
      if (createdBefore != null)
        'created-before': [_s.iso8601ToJson(createdBefore).toString()],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (startingObjectName != null)
        'starting-object-name': [startingObjectName],
      if (startingObjectPrefix != null)
        'starting-object-prefix': [startingObjectPrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restore-jobs/${Uri.encodeComponent(storageJobId)}/objects/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListObjectsOutput.fromJson(response);
  }

  /// Complete upload
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceInternalException].
  /// May throw [NotReadableInputStreamException].
  /// May throw [RetryableException].
  /// May throw [IllegalArgumentException].
  /// May throw [ThrottlingException].
  /// May throw [KMSInvalidKeyUsageException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [backupJobId] :
  /// Backup job Id for the in-progress backup
  ///
  /// Parameter [objectChecksum] :
  /// Object checksum
  ///
  /// Parameter [objectChecksumAlgorithm] :
  /// Checksum algorithm
  ///
  /// Parameter [uploadId] :
  /// Upload Id for the in-progress upload
  ///
  /// Parameter [metadataBlob] :
  /// Optional metadata associated with an Object. Maximum length is 4MB.
  ///
  /// Parameter [metadataBlobChecksum] :
  /// Checksum of MetadataBlob.
  ///
  /// Parameter [metadataBlobChecksumAlgorithm] :
  /// Checksum algorithm.
  ///
  /// Parameter [metadataBlobLength] :
  /// The size of MetadataBlob.
  ///
  /// Parameter [metadataString] :
  /// Optional metadata associated with an Object. Maximum string length is 256
  /// bytes.
  Future<NotifyObjectCompleteOutput> notifyObjectComplete({
    required String backupJobId,
    required String objectChecksum,
    required SummaryChecksumAlgorithm objectChecksumAlgorithm,
    required String uploadId,
    Uint8List? metadataBlob,
    String? metadataBlobChecksum,
    DataChecksumAlgorithm? metadataBlobChecksumAlgorithm,
    int? metadataBlobLength,
    String? metadataString,
  }) async {
    final $query = <String, List<String>>{
      'checksum': [objectChecksum],
      'checksum-algorithm': [objectChecksumAlgorithm.toValue()],
      if (metadataBlobChecksum != null)
        'metadata-checksum': [metadataBlobChecksum],
      if (metadataBlobChecksumAlgorithm != null)
        'metadata-checksum-algorithm': [
          metadataBlobChecksumAlgorithm.toValue()
        ],
      if (metadataBlobLength != null)
        'metadata-blob-length': [metadataBlobLength.toString()],
      if (metadataString != null) 'metadata-string': [metadataString],
    };
    final response = await _protocol.send(
      payload: metadataBlob,
      method: 'PUT',
      requestUri:
          '/backup-jobs/${Uri.encodeComponent(backupJobId)}/object/${Uri.encodeComponent(uploadId)}/complete',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return NotifyObjectCompleteOutput.fromJson(response);
  }

  /// Upload chunk.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceInternalException].
  /// May throw [NotReadableInputStreamException].
  /// May throw [RetryableException].
  /// May throw [IllegalArgumentException].
  /// May throw [ThrottlingException].
  /// May throw [KMSInvalidKeyUsageException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [backupJobId] :
  /// Backup job Id for the in-progress backup.
  ///
  /// Parameter [checksum] :
  /// Data checksum
  ///
  /// Parameter [checksumAlgorithm] :
  /// Checksum algorithm
  ///
  /// Parameter [chunkIndex] :
  /// Describes this chunk's position relative to the other chunks
  ///
  /// Parameter [data] :
  /// Data to be uploaded
  ///
  /// Parameter [length] :
  /// Data length
  ///
  /// Parameter [uploadId] :
  /// Upload Id for the in-progress upload.
  Future<PutChunkOutput> putChunk({
    required String backupJobId,
    required String checksum,
    required DataChecksumAlgorithm checksumAlgorithm,
    required int chunkIndex,
    required Uint8List data,
    required int length,
    required String uploadId,
  }) async {
    final $query = <String, List<String>>{
      'checksum': [checksum],
      'checksum-algorithm': [checksumAlgorithm.toValue()],
      'length': [length.toString()],
    };
    final response = await _protocol.send(
      payload: data,
      method: 'PUT',
      requestUri:
          '/backup-jobs/${Uri.encodeComponent(backupJobId)}/chunk/${Uri.encodeComponent(uploadId)}/${Uri.encodeComponent(chunkIndex.toString())}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutChunkOutput.fromJson(response);
  }

  /// Upload object that can store object metadata String and data blob in
  /// single API call using inline chunk field.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceInternalException].
  /// May throw [NotReadableInputStreamException].
  /// May throw [RetryableException].
  /// May throw [IllegalArgumentException].
  /// May throw [ThrottlingException].
  /// May throw [KMSInvalidKeyUsageException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [backupJobId] :
  /// Backup job Id for the in-progress backup.
  ///
  /// Parameter [objectName] :
  /// The name of the Object to be uploaded.
  ///
  /// Parameter [inlineChunk] :
  /// Inline chunk data to be uploaded.
  ///
  /// Parameter [inlineChunkChecksum] :
  /// Inline chunk checksum
  ///
  /// Parameter [inlineChunkChecksumAlgorithm] :
  /// Inline chunk checksum algorithm
  ///
  /// Parameter [inlineChunkLength] :
  /// Length of the inline chunk data.
  ///
  /// Parameter [metadataString] :
  /// Store user defined metadata like backup checksum, disk ids, restore
  /// metadata etc.
  ///
  /// Parameter [objectChecksum] :
  /// object checksum
  ///
  /// Parameter [objectChecksumAlgorithm] :
  /// object checksum algorithm
  ///
  /// Parameter [throwOnDuplicate] :
  /// Throw an exception if Object name is already exist.
  Future<PutObjectOutput> putObject({
    required String backupJobId,
    required String objectName,
    Uint8List? inlineChunk,
    String? inlineChunkChecksum,
    String? inlineChunkChecksumAlgorithm,
    int? inlineChunkLength,
    String? metadataString,
    String? objectChecksum,
    SummaryChecksumAlgorithm? objectChecksumAlgorithm,
    bool? throwOnDuplicate,
  }) async {
    final $query = <String, List<String>>{
      if (inlineChunkChecksum != null) 'checksum': [inlineChunkChecksum],
      if (inlineChunkChecksumAlgorithm != null)
        'checksum-algorithm': [inlineChunkChecksumAlgorithm],
      if (inlineChunkLength != null) 'length': [inlineChunkLength.toString()],
      if (metadataString != null) 'metadata-string': [metadataString],
      if (objectChecksum != null) 'object-checksum': [objectChecksum],
      if (objectChecksumAlgorithm != null)
        'object-checksum-algorithm': [objectChecksumAlgorithm.toValue()],
      if (throwOnDuplicate != null)
        'throwOnDuplicate': [throwOnDuplicate.toString()],
    };
    final response = await _protocol.send(
      payload: inlineChunk,
      method: 'PUT',
      requestUri:
          '/backup-jobs/${Uri.encodeComponent(backupJobId)}/object/${Uri.encodeComponent(objectName)}/put-object',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutObjectOutput.fromJson(response);
  }

  /// Start upload containing one or many chunks.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceInternalException].
  /// May throw [RetryableException].
  /// May throw [IllegalArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DataAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [backupJobId] :
  /// Backup job Id for the in-progress backup
  ///
  /// Parameter [objectName] :
  /// Name for the object.
  ///
  /// Parameter [throwOnDuplicate] :
  /// Throw an exception if Object name is already exist.
  Future<StartObjectOutput> startObject({
    required String backupJobId,
    required String objectName,
    bool? throwOnDuplicate,
  }) async {
    final $payload = <String, dynamic>{
      if (throwOnDuplicate != null) 'ThrowOnDuplicate': throwOnDuplicate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/backup-jobs/${Uri.encodeComponent(backupJobId)}/object/${Uri.encodeComponent(objectName)}',
      exceptionFnMap: _exceptionFns,
    );
    return StartObjectOutput.fromJson(response);
  }
}

/// Object
class BackupObject {
  /// Object name
  final String name;

  /// Object checksum
  final String objectChecksum;

  /// Checksum algorithm
  final SummaryChecksumAlgorithm objectChecksumAlgorithm;

  /// Object token
  final String objectToken;

  /// Number of chunks in object
  final int? chunksCount;

  /// Metadata string associated with the Object
  final String? metadataString;

  BackupObject({
    required this.name,
    required this.objectChecksum,
    required this.objectChecksumAlgorithm,
    required this.objectToken,
    this.chunksCount,
    this.metadataString,
  });

  factory BackupObject.fromJson(Map<String, dynamic> json) {
    return BackupObject(
      name: json['Name'] as String,
      objectChecksum: json['ObjectChecksum'] as String,
      objectChecksumAlgorithm: (json['ObjectChecksumAlgorithm'] as String)
          .toSummaryChecksumAlgorithm(),
      objectToken: json['ObjectToken'] as String,
      chunksCount: json['ChunksCount'] as int?,
      metadataString: json['MetadataString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final objectChecksum = this.objectChecksum;
    final objectChecksumAlgorithm = this.objectChecksumAlgorithm;
    final objectToken = this.objectToken;
    final chunksCount = this.chunksCount;
    final metadataString = this.metadataString;
    return {
      'Name': name,
      'ObjectChecksum': objectChecksum,
      'ObjectChecksumAlgorithm': objectChecksumAlgorithm.toValue(),
      'ObjectToken': objectToken,
      if (chunksCount != null) 'ChunksCount': chunksCount,
      if (metadataString != null) 'MetadataString': metadataString,
    };
  }
}

/// Chunk
class Chunk {
  /// Chunk checksum
  final String checksum;

  /// Checksum algorithm
  final DataChecksumAlgorithm checksumAlgorithm;

  /// Chunk token
  final String chunkToken;

  /// Chunk index
  final int index;

  /// Chunk length
  final int length;

  Chunk({
    required this.checksum,
    required this.checksumAlgorithm,
    required this.chunkToken,
    required this.index,
    required this.length,
  });

  factory Chunk.fromJson(Map<String, dynamic> json) {
    return Chunk(
      checksum: json['Checksum'] as String,
      checksumAlgorithm:
          (json['ChecksumAlgorithm'] as String).toDataChecksumAlgorithm(),
      chunkToken: json['ChunkToken'] as String,
      index: json['Index'] as int,
      length: json['Length'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final checksumAlgorithm = this.checksumAlgorithm;
    final chunkToken = this.chunkToken;
    final index = this.index;
    final length = this.length;
    return {
      'Checksum': checksum,
      'ChecksumAlgorithm': checksumAlgorithm.toValue(),
      'ChunkToken': chunkToken,
      'Index': index,
      'Length': length,
    };
  }
}

enum DataChecksumAlgorithm {
  sha256,
}

extension DataChecksumAlgorithmValueExtension on DataChecksumAlgorithm {
  String toValue() {
    switch (this) {
      case DataChecksumAlgorithm.sha256:
        return 'SHA256';
    }
  }
}

extension DataChecksumAlgorithmFromString on String {
  DataChecksumAlgorithm toDataChecksumAlgorithm() {
    switch (this) {
      case 'SHA256':
        return DataChecksumAlgorithm.sha256;
    }
    throw Exception('$this is not known in enum DataChecksumAlgorithm');
  }
}

class GetChunkOutput {
  /// Data checksum
  final String checksum;

  /// Checksum algorithm
  final DataChecksumAlgorithm checksumAlgorithm;

  /// Chunk data
  final Uint8List data;

  /// Data length
  final int length;

  GetChunkOutput({
    required this.checksum,
    required this.checksumAlgorithm,
    required this.data,
    required this.length,
  });

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final checksumAlgorithm = this.checksumAlgorithm;
    final data = this.data;
    final length = this.length;
    return {
      'Data': base64Encode(data),
    };
  }
}

class GetObjectMetadataOutput {
  /// Metadata blob.
  final Uint8List? metadataBlob;

  /// MetadataBlob checksum.
  final String? metadataBlobChecksum;

  /// Checksum algorithm.
  final DataChecksumAlgorithm? metadataBlobChecksumAlgorithm;

  /// The size of MetadataBlob.
  final int? metadataBlobLength;

  /// Metadata string.
  final String? metadataString;

  GetObjectMetadataOutput({
    this.metadataBlob,
    this.metadataBlobChecksum,
    this.metadataBlobChecksumAlgorithm,
    this.metadataBlobLength,
    this.metadataString,
  });

  Map<String, dynamic> toJson() {
    final metadataBlob = this.metadataBlob;
    final metadataBlobChecksum = this.metadataBlobChecksum;
    final metadataBlobChecksumAlgorithm = this.metadataBlobChecksumAlgorithm;
    final metadataBlobLength = this.metadataBlobLength;
    final metadataString = this.metadataString;
    return {
      if (metadataBlob != null) 'MetadataBlob': base64Encode(metadataBlob),
    };
  }
}

class ListChunksOutput {
  /// List of chunks
  final List<Chunk> chunkList;

  /// Pagination token
  final String? nextToken;

  ListChunksOutput({
    required this.chunkList,
    this.nextToken,
  });

  factory ListChunksOutput.fromJson(Map<String, dynamic> json) {
    return ListChunksOutput(
      chunkList: (json['ChunkList'] as List)
          .whereNotNull()
          .map((e) => Chunk.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final chunkList = this.chunkList;
    final nextToken = this.nextToken;
    return {
      'ChunkList': chunkList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListObjectsOutput {
  /// Object list
  final List<BackupObject> objectList;

  /// Pagination token
  final String? nextToken;

  ListObjectsOutput({
    required this.objectList,
    this.nextToken,
  });

  factory ListObjectsOutput.fromJson(Map<String, dynamic> json) {
    return ListObjectsOutput(
      objectList: (json['ObjectList'] as List)
          .whereNotNull()
          .map((e) => BackupObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectList = this.objectList;
    final nextToken = this.nextToken;
    return {
      'ObjectList': objectList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class NotifyObjectCompleteOutput {
  /// Object checksum
  final String objectChecksum;

  /// Checksum algorithm
  final SummaryChecksumAlgorithm objectChecksumAlgorithm;

  NotifyObjectCompleteOutput({
    required this.objectChecksum,
    required this.objectChecksumAlgorithm,
  });

  factory NotifyObjectCompleteOutput.fromJson(Map<String, dynamic> json) {
    return NotifyObjectCompleteOutput(
      objectChecksum: json['ObjectChecksum'] as String,
      objectChecksumAlgorithm: (json['ObjectChecksumAlgorithm'] as String)
          .toSummaryChecksumAlgorithm(),
    );
  }

  Map<String, dynamic> toJson() {
    final objectChecksum = this.objectChecksum;
    final objectChecksumAlgorithm = this.objectChecksumAlgorithm;
    return {
      'ObjectChecksum': objectChecksum,
      'ObjectChecksumAlgorithm': objectChecksumAlgorithm.toValue(),
    };
  }
}

class PutChunkOutput {
  /// Chunk checksum
  final String chunkChecksum;

  /// Checksum algorithm
  final DataChecksumAlgorithm chunkChecksumAlgorithm;

  PutChunkOutput({
    required this.chunkChecksum,
    required this.chunkChecksumAlgorithm,
  });

  factory PutChunkOutput.fromJson(Map<String, dynamic> json) {
    return PutChunkOutput(
      chunkChecksum: json['ChunkChecksum'] as String,
      chunkChecksumAlgorithm:
          (json['ChunkChecksumAlgorithm'] as String).toDataChecksumAlgorithm(),
    );
  }

  Map<String, dynamic> toJson() {
    final chunkChecksum = this.chunkChecksum;
    final chunkChecksumAlgorithm = this.chunkChecksumAlgorithm;
    return {
      'ChunkChecksum': chunkChecksum,
      'ChunkChecksumAlgorithm': chunkChecksumAlgorithm.toValue(),
    };
  }
}

class PutObjectOutput {
  /// Inline chunk checksum
  final String inlineChunkChecksum;

  /// Inline chunk checksum algorithm
  final DataChecksumAlgorithm inlineChunkChecksumAlgorithm;

  /// object checksum
  final String objectChecksum;

  /// object checksum algorithm
  final SummaryChecksumAlgorithm objectChecksumAlgorithm;

  PutObjectOutput({
    required this.inlineChunkChecksum,
    required this.inlineChunkChecksumAlgorithm,
    required this.objectChecksum,
    required this.objectChecksumAlgorithm,
  });

  factory PutObjectOutput.fromJson(Map<String, dynamic> json) {
    return PutObjectOutput(
      inlineChunkChecksum: json['InlineChunkChecksum'] as String,
      inlineChunkChecksumAlgorithm:
          (json['InlineChunkChecksumAlgorithm'] as String)
              .toDataChecksumAlgorithm(),
      objectChecksum: json['ObjectChecksum'] as String,
      objectChecksumAlgorithm: (json['ObjectChecksumAlgorithm'] as String)
          .toSummaryChecksumAlgorithm(),
    );
  }

  Map<String, dynamic> toJson() {
    final inlineChunkChecksum = this.inlineChunkChecksum;
    final inlineChunkChecksumAlgorithm = this.inlineChunkChecksumAlgorithm;
    final objectChecksum = this.objectChecksum;
    final objectChecksumAlgorithm = this.objectChecksumAlgorithm;
    return {
      'InlineChunkChecksum': inlineChunkChecksum,
      'InlineChunkChecksumAlgorithm': inlineChunkChecksumAlgorithm.toValue(),
      'ObjectChecksum': objectChecksum,
      'ObjectChecksumAlgorithm': objectChecksumAlgorithm.toValue(),
    };
  }
}

class StartObjectOutput {
  /// Upload Id for a given upload.
  final String uploadId;

  StartObjectOutput({
    required this.uploadId,
  });

  factory StartObjectOutput.fromJson(Map<String, dynamic> json) {
    return StartObjectOutput(
      uploadId: json['UploadId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final uploadId = this.uploadId;
    return {
      'UploadId': uploadId,
    };
  }
}

enum SummaryChecksumAlgorithm {
  summary,
}

extension SummaryChecksumAlgorithmValueExtension on SummaryChecksumAlgorithm {
  String toValue() {
    switch (this) {
      case SummaryChecksumAlgorithm.summary:
        return 'SUMMARY';
    }
  }
}

extension SummaryChecksumAlgorithmFromString on String {
  SummaryChecksumAlgorithm toSummaryChecksumAlgorithm() {
    switch (this) {
      case 'SUMMARY':
        return SummaryChecksumAlgorithm.summary;
    }
    throw Exception('$this is not known in enum SummaryChecksumAlgorithm');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class DataAlreadyExistsException extends _s.GenericAwsException {
  DataAlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'DataAlreadyExistsException', message: message);
}

class IllegalArgumentException extends _s.GenericAwsException {
  IllegalArgumentException({String? type, String? message})
      : super(type: type, code: 'IllegalArgumentException', message: message);
}

class KMSInvalidKeyUsageException extends _s.GenericAwsException {
  KMSInvalidKeyUsageException({String? type, String? message})
      : super(
            type: type, code: 'KMSInvalidKeyUsageException', message: message);
}

class NotReadableInputStreamException extends _s.GenericAwsException {
  NotReadableInputStreamException({String? type, String? message})
      : super(
            type: type,
            code: 'NotReadableInputStreamException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class RetryableException extends _s.GenericAwsException {
  RetryableException({String? type, String? message})
      : super(type: type, code: 'RetryableException', message: message);
}

class ServiceInternalException extends _s.GenericAwsException {
  ServiceInternalException({String? type, String? message})
      : super(type: type, code: 'ServiceInternalException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'DataAlreadyExistsException': (type, message) =>
      DataAlreadyExistsException(type: type, message: message),
  'IllegalArgumentException': (type, message) =>
      IllegalArgumentException(type: type, message: message),
  'KMSInvalidKeyUsageException': (type, message) =>
      KMSInvalidKeyUsageException(type: type, message: message),
  'NotReadableInputStreamException': (type, message) =>
      NotReadableInputStreamException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'RetryableException': (type, message) =>
      RetryableException(type: type, message: message),
  'ServiceInternalException': (type, message) =>
      ServiceInternalException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};

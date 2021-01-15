// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-06-10.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteLexiconOutput _$DeleteLexiconOutputFromJson(Map<String, dynamic> json) {
  return DeleteLexiconOutput();
}

DescribeVoicesOutput _$DescribeVoicesOutputFromJson(Map<String, dynamic> json) {
  return DescribeVoicesOutput(
    nextToken: json['NextToken'] as String,
    voices: (json['Voices'] as List)
        ?.map(
            (e) => e == null ? null : Voice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetLexiconOutput _$GetLexiconOutputFromJson(Map<String, dynamic> json) {
  return GetLexiconOutput(
    lexicon: json['Lexicon'] == null
        ? null
        : Lexicon.fromJson(json['Lexicon'] as Map<String, dynamic>),
    lexiconAttributes: json['LexiconAttributes'] == null
        ? null
        : LexiconAttributes.fromJson(
            json['LexiconAttributes'] as Map<String, dynamic>),
  );
}

GetSpeechSynthesisTaskOutput _$GetSpeechSynthesisTaskOutputFromJson(
    Map<String, dynamic> json) {
  return GetSpeechSynthesisTaskOutput(
    synthesisTask: json['SynthesisTask'] == null
        ? null
        : SynthesisTask.fromJson(json['SynthesisTask'] as Map<String, dynamic>),
  );
}

Lexicon _$LexiconFromJson(Map<String, dynamic> json) {
  return Lexicon(
    content: json['Content'] as String,
    name: json['Name'] as String,
  );
}

LexiconAttributes _$LexiconAttributesFromJson(Map<String, dynamic> json) {
  return LexiconAttributes(
    alphabet: json['Alphabet'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModified: const UnixDateTimeConverter().fromJson(json['LastModified']),
    lexemesCount: json['LexemesCount'] as int,
    lexiconArn: json['LexiconArn'] as String,
    size: json['Size'] as int,
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$LanguageCodeEnumMap = {
  LanguageCode.arb: 'arb',
  LanguageCode.cmnCn: 'cmn-CN',
  LanguageCode.cyGb: 'cy-GB',
  LanguageCode.daDk: 'da-DK',
  LanguageCode.deDe: 'de-DE',
  LanguageCode.enAu: 'en-AU',
  LanguageCode.enGb: 'en-GB',
  LanguageCode.enGbWls: 'en-GB-WLS',
  LanguageCode.enIn: 'en-IN',
  LanguageCode.enUs: 'en-US',
  LanguageCode.esEs: 'es-ES',
  LanguageCode.esMx: 'es-MX',
  LanguageCode.esUs: 'es-US',
  LanguageCode.frCa: 'fr-CA',
  LanguageCode.frFr: 'fr-FR',
  LanguageCode.isIs: 'is-IS',
  LanguageCode.itIt: 'it-IT',
  LanguageCode.jaJp: 'ja-JP',
  LanguageCode.hiIn: 'hi-IN',
  LanguageCode.koKr: 'ko-KR',
  LanguageCode.nbNo: 'nb-NO',
  LanguageCode.nlNl: 'nl-NL',
  LanguageCode.plPl: 'pl-PL',
  LanguageCode.ptBr: 'pt-BR',
  LanguageCode.ptPt: 'pt-PT',
  LanguageCode.roRo: 'ro-RO',
  LanguageCode.ruRu: 'ru-RU',
  LanguageCode.svSe: 'sv-SE',
  LanguageCode.trTr: 'tr-TR',
};

LexiconDescription _$LexiconDescriptionFromJson(Map<String, dynamic> json) {
  return LexiconDescription(
    attributes: json['Attributes'] == null
        ? null
        : LexiconAttributes.fromJson(
            json['Attributes'] as Map<String, dynamic>),
    name: json['Name'] as String,
  );
}

ListLexiconsOutput _$ListLexiconsOutputFromJson(Map<String, dynamic> json) {
  return ListLexiconsOutput(
    lexicons: (json['Lexicons'] as List)
        ?.map((e) => e == null
            ? null
            : LexiconDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListSpeechSynthesisTasksOutput _$ListSpeechSynthesisTasksOutputFromJson(
    Map<String, dynamic> json) {
  return ListSpeechSynthesisTasksOutput(
    nextToken: json['NextToken'] as String,
    synthesisTasks: (json['SynthesisTasks'] as List)
        ?.map((e) => e == null
            ? null
            : SynthesisTask.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PutLexiconOutput _$PutLexiconOutputFromJson(Map<String, dynamic> json) {
  return PutLexiconOutput();
}

StartSpeechSynthesisTaskOutput _$StartSpeechSynthesisTaskOutputFromJson(
    Map<String, dynamic> json) {
  return StartSpeechSynthesisTaskOutput(
    synthesisTask: json['SynthesisTask'] == null
        ? null
        : SynthesisTask.fromJson(json['SynthesisTask'] as Map<String, dynamic>),
  );
}

SynthesisTask _$SynthesisTaskFromJson(Map<String, dynamic> json) {
  return SynthesisTask(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    engine: _$enumDecodeNullable(_$EngineEnumMap, json['Engine']),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lexiconNames:
        (json['LexiconNames'] as List)?.map((e) => e as String)?.toList(),
    outputFormat:
        _$enumDecodeNullable(_$OutputFormatEnumMap, json['OutputFormat']),
    outputUri: json['OutputUri'] as String,
    requestCharacters: json['RequestCharacters'] as int,
    sampleRate: json['SampleRate'] as String,
    snsTopicArn: json['SnsTopicArn'] as String,
    speechMarkTypes: (json['SpeechMarkTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$SpeechMarkTypeEnumMap, e))
        ?.toList(),
    taskId: json['TaskId'] as String,
    taskStatus: _$enumDecodeNullable(_$TaskStatusEnumMap, json['TaskStatus']),
    taskStatusReason: json['TaskStatusReason'] as String,
    textType: _$enumDecodeNullable(_$TextTypeEnumMap, json['TextType']),
    voiceId: _$enumDecodeNullable(_$VoiceIdEnumMap, json['VoiceId']),
  );
}

const _$EngineEnumMap = {
  Engine.standard: 'standard',
  Engine.neural: 'neural',
};

const _$OutputFormatEnumMap = {
  OutputFormat.json: 'json',
  OutputFormat.mp3: 'mp3',
  OutputFormat.oggVorbis: 'ogg_vorbis',
  OutputFormat.pcm: 'pcm',
};

const _$SpeechMarkTypeEnumMap = {
  SpeechMarkType.sentence: 'sentence',
  SpeechMarkType.ssml: 'ssml',
  SpeechMarkType.viseme: 'viseme',
  SpeechMarkType.word: 'word',
};

const _$TaskStatusEnumMap = {
  TaskStatus.scheduled: 'scheduled',
  TaskStatus.inProgress: 'inProgress',
  TaskStatus.completed: 'completed',
  TaskStatus.failed: 'failed',
};

const _$TextTypeEnumMap = {
  TextType.ssml: 'ssml',
  TextType.text: 'text',
};

const _$VoiceIdEnumMap = {
  VoiceId.aditi: 'Aditi',
  VoiceId.amy: 'Amy',
  VoiceId.astrid: 'Astrid',
  VoiceId.bianca: 'Bianca',
  VoiceId.brian: 'Brian',
  VoiceId.camila: 'Camila',
  VoiceId.carla: 'Carla',
  VoiceId.carmen: 'Carmen',
  VoiceId.celine: 'Celine',
  VoiceId.chantal: 'Chantal',
  VoiceId.conchita: 'Conchita',
  VoiceId.cristiano: 'Cristiano',
  VoiceId.dora: 'Dora',
  VoiceId.emma: 'Emma',
  VoiceId.enrique: 'Enrique',
  VoiceId.ewa: 'Ewa',
  VoiceId.filiz: 'Filiz',
  VoiceId.geraint: 'Geraint',
  VoiceId.giorgio: 'Giorgio',
  VoiceId.gwyneth: 'Gwyneth',
  VoiceId.hans: 'Hans',
  VoiceId.ines: 'Ines',
  VoiceId.ivy: 'Ivy',
  VoiceId.jacek: 'Jacek',
  VoiceId.jan: 'Jan',
  VoiceId.joanna: 'Joanna',
  VoiceId.joey: 'Joey',
  VoiceId.justin: 'Justin',
  VoiceId.karl: 'Karl',
  VoiceId.kendra: 'Kendra',
  VoiceId.kevin: 'Kevin',
  VoiceId.kimberly: 'Kimberly',
  VoiceId.lea: 'Lea',
  VoiceId.liv: 'Liv',
  VoiceId.lotte: 'Lotte',
  VoiceId.lucia: 'Lucia',
  VoiceId.lupe: 'Lupe',
  VoiceId.mads: 'Mads',
  VoiceId.maja: 'Maja',
  VoiceId.marlene: 'Marlene',
  VoiceId.mathieu: 'Mathieu',
  VoiceId.matthew: 'Matthew',
  VoiceId.maxim: 'Maxim',
  VoiceId.mia: 'Mia',
  VoiceId.miguel: 'Miguel',
  VoiceId.mizuki: 'Mizuki',
  VoiceId.naja: 'Naja',
  VoiceId.nicole: 'Nicole',
  VoiceId.olivia: 'Olivia',
  VoiceId.penelope: 'Penelope',
  VoiceId.raveena: 'Raveena',
  VoiceId.ricardo: 'Ricardo',
  VoiceId.ruben: 'Ruben',
  VoiceId.russell: 'Russell',
  VoiceId.salli: 'Salli',
  VoiceId.seoyeon: 'Seoyeon',
  VoiceId.takumi: 'Takumi',
  VoiceId.tatyana: 'Tatyana',
  VoiceId.vicki: 'Vicki',
  VoiceId.vitoria: 'Vitoria',
  VoiceId.zeina: 'Zeina',
  VoiceId.zhiyu: 'Zhiyu',
};

SynthesizeSpeechOutput _$SynthesizeSpeechOutputFromJson(
    Map<String, dynamic> json) {
  return SynthesizeSpeechOutput(
    audioStream:
        const Uint8ListConverter().fromJson(json['AudioStream'] as String),
    contentType: json['Content-Type'] as String,
    requestCharacters: json['x-amzn-RequestCharacters'] as int,
  );
}

Voice _$VoiceFromJson(Map<String, dynamic> json) {
  return Voice(
    additionalLanguageCodes: (json['AdditionalLanguageCodes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$LanguageCodeEnumMap, e))
        ?.toList(),
    gender: _$enumDecodeNullable(_$GenderEnumMap, json['Gender']),
    id: _$enumDecodeNullable(_$VoiceIdEnumMap, json['Id']),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    languageName: json['LanguageName'] as String,
    name: json['Name'] as String,
    supportedEngines: (json['SupportedEngines'] as List)
        ?.map((e) => _$enumDecodeNullable(_$EngineEnumMap, e))
        ?.toList(),
  );
}

const _$GenderEnumMap = {
  Gender.female: 'Female',
  Gender.male: 'Male',
};

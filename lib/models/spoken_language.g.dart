// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoken_language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) {
  return SpokenLanguage(
    json['iso_639_1'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$SpokenLanguageToJson(SpokenLanguage instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iSo,
      'name': instance.name,
    };

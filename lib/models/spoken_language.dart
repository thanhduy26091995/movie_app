import 'package:json_annotation/json_annotation.dart';

part 'spoken_language.g.dart';

@JsonSerializable()
class SpokenLanguage {
  @JsonKey(name: "iso_639_1")
  String iSo;
  String name;

  SpokenLanguage(this.iSo, this.name);

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}

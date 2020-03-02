import 'package:json_annotation/json_annotation.dart';

part 'production_company.g.dart';

@JsonSerializable()
class ProductionCompany {
  int id;
  @JsonKey(name: "logo_path")
  String logoPath;
  String name;
  @JsonKey(name: "original_country")
  String originalCountry;

  ProductionCompany(this.id, this.logoPath, this.name, this.originalCountry);

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

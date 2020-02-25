import 'package:json_annotation/json_annotation.dart';

part 'TV.g.dart';

@JsonSerializable()
class TV {
  @JsonKey(name: "original_name")
  String originalName;
  @JsonKey(name: "genre_ids")
  List<int> genreIds;
  String name;
  double popularity;
  @JsonKey(name: "original_country")
  List<String> originalCountry;
  @JsonKey(name: "vote_count")
  int voteCount;
  @JsonKey(name: "first_air_date")
  String firstAirDate;
  @JsonKey(name: "backdrop_path")
  String backdropPath;
  @JsonKey(name: "original_language")
  String originalLanguage;
  int id;
  @JsonKey(name: "vote_average")
  double voteAverage;
  String overview;
  @JsonKey(name: "poster_path")
  String posterPath;

  TV(
      this.originalName,
      this.genreIds,
      this.name,
      this.popularity,
      this.originalCountry,
      this.voteCount,
      this.firstAirDate,
      this.backdropPath,
      this.originalLanguage,
      this.id,
      this.voteAverage,
      this.overview,
      this.posterPath);

  factory TV.fromJson(Map<String, dynamic> json) => _$TVFromJson(json);
}

@JsonSerializable()
class TVListResponse {
  int page;
  @JsonKey(name: "total_results")
  int totalResults;
  @JsonKey(name: "total_pages")
  int totalPages;
  @JsonKey(name: "results")
  List<TV> results;

  TVListResponse(this.page, this.totalResults, this.totalPages, this.results);

  factory TVListResponse.fromJson(Map<String, dynamic> json) =>
      _$TVListResponseFromJson(json);
}

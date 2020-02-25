// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TV.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TV _$TVFromJson(Map<String, dynamic> json) {
  return TV(
    json['original_name'] as String,
    (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
    json['name'] as String,
    (json['popularity'] as num)?.toDouble(),
    (json['original_country'] as List)?.map((e) => e as String)?.toList(),
    json['vote_count'] as int,
    json['first_air_date'] as String,
    json['backdrop_path'] as String,
    json['original_language'] as String,
    json['id'] as int,
    (json['vote_average'] as num)?.toDouble(),
    json['overview'] as String,
    json['poster_path'] as String,
  );
}

Map<String, dynamic> _$TVToJson(TV instance) => <String, dynamic>{
      'original_name': instance.originalName,
      'genre_ids': instance.genreIds,
      'name': instance.name,
      'popularity': instance.popularity,
      'original_country': instance.originalCountry,
      'vote_count': instance.voteCount,
      'first_air_date': instance.firstAirDate,
      'backdrop_path': instance.backdropPath,
      'original_language': instance.originalLanguage,
      'id': instance.id,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };

TVListResponse _$TVListResponseFromJson(Map<String, dynamic> json) {
  return TVListResponse(
    json['page'] as int,
    json['total_results'] as int,
    json['total_pages'] as int,
    (json['results'] as List)
        ?.map((e) => e == null ? null : TV.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TVListResponseToJson(TVListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results,
    };

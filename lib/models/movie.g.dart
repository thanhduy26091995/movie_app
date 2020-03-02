// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    (json['popularity'] as num)?.toDouble(),
    json['vote_count'] as int,
    json['video'] as bool,
    json['poster_path'] as String,
    json['id'] as int,
    json['adult'] as bool,
    json['backdrop_path'] as String,
    json['original_language'] as String,
    json['original_title'] as String,
    (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
    json['title'] as String,
    (json['vote_average'] as num)?.toDouble(),
    json['overview'] as String,
    json['release_date'] as String,
    (json['budget'] as num)?.toDouble(),
    json['homepage'] as String,
    json['imdb_id'] as String,
    (json['genres'] as List)
        ?.map(
            (e) => e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['status'] as String,
    json['tagline'] as String,
    json['runtime'] as int,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'poster_path': instance.posterPath,
      'id': instance.id,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'genre_ids': instance.genreIds,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'budget': instance.budget,
      'homepage': instance.homePage,
      'imdb_id': instance.imdbId,
      'genres': instance.genres,
      'status': instance.status,
      'tagline': instance.tagLine,
      'runtime': instance.runtime,
    };

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) {
  return MovieListResponse(
    json['page'] as int,
    json['total_results'] as int,
    json['total_pages'] as int,
    (json['results'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieListResponseToJson(MovieListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results,
    };

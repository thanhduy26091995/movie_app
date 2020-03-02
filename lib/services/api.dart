import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app/components/constants.dart';
import 'package:movie_app/models/TV.dart';
import 'package:movie_app/models/movie.dart';

class API {
  Future<MovieListResponse> getNowPlayingMovie(int page) async {
    String url = base_url + now_playing;
    MovieListResponse movieListResponse;
    Dio dio = Dio();
    await dio.get(url, queryParameters: {
      "api_key": API_KEY,
      "page": page,
      "language": "vi-VN"
    }).then((response) {
      var parsedJson = jsonDecode(response.toString());
      movieListResponse = MovieListResponse.fromJson(parsedJson);
    }).catchError((error) {
      print(error);
    });
    return movieListResponse;
  }

  Future<MovieListResponse> getPopularMovie(int page) async {
    String url = base_url + popular_movie;
    MovieListResponse movieListResponse;
    Dio dio = Dio();
    await dio.get(url, queryParameters: {
      "api_key": API_KEY,
      "page": page,
      "language": "vi-VN"
    }).then((response) {
      var parsedJson = jsonDecode(response.toString());
      movieListResponse = MovieListResponse.fromJson(parsedJson);
    }).catchError((error) {
      print(error);
    });
    return movieListResponse;
  }

  Future<MovieListResponse> getUpcomingMovie(int page) async {
    String url = base_url + upcoming;
    MovieListResponse movieListResponse;
    Dio dio = Dio();
    await dio.get(url, queryParameters: {
      "api_key": API_KEY,
      "page": page,
      "language": "vi-VN"
    }).then((response) {
      var parsedJson = jsonDecode(response.toString());
      movieListResponse = MovieListResponse.fromJson(parsedJson);
    }).catchError((error) {
      print(error);
    });
    return movieListResponse;
  }

  Future<TVListResponse> getAiringToday(int page) async {
    String url = base_url + tv_airing_today;
    TVListResponse tvListResponse;
    Dio dio = Dio();
    await dio.get(url, queryParameters: {
      "api_key": API_KEY,
      "page": page,
      "language": "vi-VN"
    }).then((response) {
      var parsedJson = jsonDecode(response.toString());
      tvListResponse = TVListResponse.fromJson(parsedJson);
    }).catchError((error) {
      print(error);
    });
    return tvListResponse;
  }

  Future<TVListResponse> getTVPopular(int page) async {
    String url = base_url + tv_popular;
    TVListResponse tvListResponse;
    Dio dio = Dio();
    await dio.get(url, queryParameters: {
      "api_key": API_KEY,
      "page": page,
      "language": "vi-VN"
    }).then((response) {
      var parsedJson = jsonDecode(response.toString());
      tvListResponse = TVListResponse.fromJson(parsedJson);
    }).catchError((error) {
      print(error);
    });
    return tvListResponse;
  }

  Future<Movie> getMovieDetail(int movieId) async {
    String url = base_url + movie_detail + movieId.toString();
    Movie movie;
    Dio dio = Dio();
    await dio.get(
        url, queryParameters: {"api_key": API_KEY, "language": "vi-VN"}).then((
        response) {
      var parsedJson = jsonDecode(response.toString());
      print(parsedJson);
      movie = Movie.fromJson(parsedJson);
    }).catchError((error) {
      print(error);
    });
    return movie;
  }
}
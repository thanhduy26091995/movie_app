import 'dart:async';

import 'package:movie_app/blocprovs/bloc_provider.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/api.dart';

class MovieBloc extends BlocBase {
  //stream of data
  StreamController<MovieListResponse> streamNowPlayingController =
      StreamController<MovieListResponse>.broadcast();

  StreamController<MovieListResponse> streamPopularController =
      StreamController<MovieListResponse>.broadcast();

  StreamController<MovieListResponse> streamUpcomingController =
      StreamController<MovieListResponse>.broadcast();

  StreamController<Movie> streamMovieDetailController =
      StreamController<Movie>.broadcast();

  //sink
  Sink get nowPlayingSink => streamNowPlayingController.sink;

  Sink get popularSink => streamPopularController.sink;

  Sink get upComingSink => streamUpcomingController.sink;

  Sink get movieDetailSink => streamMovieDetailController.sink;

  //stream
  Stream<MovieListResponse> get nowPlayingStream =>
      streamNowPlayingController.stream;

  Stream<MovieListResponse> get popularStream => streamPopularController.stream;

  Stream<MovieListResponse> get upComingStream =>
      streamUpcomingController.stream;

  Stream<Movie> get movieDetailStream => streamMovieDetailController.stream;

  void getNowPlaying(int page) {
    API api = API();
    api.getNowPlayingMovie(page).then((response) {
      if (response != null) {
        nowPlayingSink.add(response);
      }
    });
  }

  void getPopularMovie(int page) {
    API api = API();
    api.getPopularMovie(page).then((response) {
      if (response != null) {
        popularSink.add(response);
      }
    });
  }

  void getUpcomingMovie(int page) {
    API api = API();
    api.getUpcomingMovie(page).then((response) {
      if (response != null) {
        upComingSink.add(response);
      }
    });
  }

  void getMovieDetail(int movieId) {
    API api = API();
    api.getMovieDetail(movieId).then((response) {
      if (response != null) {
        movieDetailSink.add(response);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamNowPlayingController.close();
    streamPopularController.close();
    streamUpcomingController.close();
    streamMovieDetailController.close();
  }
}

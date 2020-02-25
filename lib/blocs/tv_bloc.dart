import 'dart:async';

import 'package:movie_app/blocprovs/bloc_provider.dart';
import 'package:movie_app/models/TV.dart';
import 'package:movie_app/services/api.dart';

class TVBloc extends BlocBase {
  //stream of data
  StreamController<TVListResponse> streamAiringTodayController =
      StreamController<TVListResponse>.broadcast();

  StreamController<TVListResponse> streamTVPopularController =
      StreamController<TVListResponse>.broadcast();

  //sink
  Sink get airingTodaySink => streamAiringTodayController.sink;

  Sink get popularSink => streamTVPopularController.sink;

  //stream
  Stream<TVListResponse> get airingTodayStream =>
      streamAiringTodayController.stream;

  Stream<TVListResponse> get popularStream => streamTVPopularController.stream;

  void getAiringTodayTV(int page) {
    API api = API();
    api.getAiringToday(page).then((response) {
      if (response != null) {
        airingTodaySink.add(response);
      }
    });
  }

  void getTVPopular(int page) {
    API api = API();
    api.getTVPopular(page).then((response) {
      if (response != null) {
        popularSink.add(response);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamAiringTodayController.close();
    streamTVPopularController.close();
  }
}

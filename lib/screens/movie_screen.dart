import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/blocs/movie_bloc.dart';
import 'package:movie_app/components/constants.dart';
import 'package:movie_app/components/hex_to_color.dart';
import 'package:movie_app/components/utils.dart';
import 'package:movie_app/models/movie.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MovieAppState();
  }
}

abstract class ListItem {}

class _MovieAppState extends State<MovieApp> {
  MovieBloc _movieBloc = MovieBloc();
  final List<ListItem> _nowPlayingItems = <ListItem>[];
  final List<ListItem> _popularItems = <ListItem>[];
  final List<ListItem> _upComingItems = <ListItem>[];
  MovieListResponse _nowPlayingResponse;
  MovieListResponse _popularResponse;
  MovieListResponse _upComingResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get page
    _movieBloc.getNowPlaying(1);
    _movieBloc.getPopularMovie(1);
    _movieBloc.getUpcomingMovie(1);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Now Playing",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 300,
                child: StreamBuilder(
                  stream: _movieBloc.nowPlayingStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      _nowPlayingResponse = snapshot.data;
                      for (var movie in _nowPlayingResponse.results) {
                        _nowPlayingItems.add(NowPlayingItem(movie));
                      }
                      //add header
                      _nowPlayingItems.add(NowPlayingItemMore("now_playing"));
                      return ListView.builder(
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: _nowPlayingItems.length,
                          itemBuilder: (context, index) {
                            final item = _nowPlayingItems[index];
                            if (item is NowPlayingItem) {
                              return NowPlayingItem(item.movie);
                            } else if (item is NowPlayingItemMore) {
                              return NowPlayingItemMore(item._type);
                            } else {
                              return SizedBox();
                            }
                          });
                    }
                    return SizedBox();
                  },
                ),
              ),
              Text(
                "Popular",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height / 2,
                child: StreamBuilder(
                  stream: _movieBloc.popularStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      _popularResponse = snapshot.data;
                      for (var movie in _popularResponse.results) {
                        _popularItems.add(NowPlayingItem(movie));
                      }
                      //add header
                      _popularItems.add(NowPlayingItemMore("popular"));
                      return ListView.builder(
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: _popularItems.length,
                          itemBuilder: (context, index) {
                            final item = _popularItems[index];
                            if (item is NowPlayingItem) {
                              return NowPlayingItem(item.movie);
                            } else if (item is NowPlayingItemMore) {
                              return NowPlayingItemMore(item._type);
                            } else {
                              return SizedBox();
                            }
                          });
                    }
                    return SizedBox();
                  },
                ),
              ),
              Text(
                "Upcoming",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height / 2,
                child: StreamBuilder(
                  stream: _movieBloc.upComingStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      _upComingResponse = snapshot.data;
                      for (var movie in _upComingResponse.results) {
                        _upComingItems.add(NowPlayingItem(movie));
                      }
                      //add header
                      _upComingItems.add(NowPlayingItemMore("upcoming"));
                      return ListView.builder(
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: _upComingItems.length,
                          itemBuilder: (context, index) {
                            final item = _upComingItems[index];
                            if (item is NowPlayingItem) {
                              return NowPlayingItem(item.movie);
                            } else if (item is NowPlayingItemMore) {
                              return NowPlayingItemMore(item._type);
                            } else {
                              return SizedBox();
                            }
                          });
                    }
                    return SizedBox();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NowPlayingItemMore extends StatelessWidget implements ListItem {
  final String _type;

  NowPlayingItemMore(this._type);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {},
      child: Wrap(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width / 2.2,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: HexToColor("#FECB2F")),
              child: Center(
                child: Text(
                  "MORE",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}

class NowPlayingItem extends StatelessWidget implements ListItem {
  final Movie movie;

  NowPlayingItem(this.movie);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: Wrap(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                image: DecorationImage(
                  image: NetworkImage(Utils.getRealImagePath(
                      image_base_url, IMAGE_SIZE_w500, movie.posterPath)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                movie.title.toUpperCase(),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/blocs/movie_bloc.dart';
import 'package:movie_app/components/constants.dart';
import 'package:movie_app/components/hex_to_color.dart';
import 'package:movie_app/components/utils.dart';
import 'package:movie_app/models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final int _movieId;

  MovieDetailScreen(this._movieId);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MovieDetailScreenState(_movieId);
  }
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final int _movieId;
  final MovieBloc _movieBloc = new MovieBloc();
  Movie movie;

  _MovieDetailScreenState(this._movieId);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _movieBloc.getMovieDetail(_movieId);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SafeArea(
          top: false,
          bottom: true,
          child: StreamBuilder(
            stream: _movieBloc.movieDetailStream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                movie = snapshot.data;

                return Stack(
                  children: <Widget>[
                    Container(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height / 1.72,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(Utils.getRealImagePath(
                                  image_base_url,
                                  IMAGE_SIZE_w500,
                                  movie.posterPath)),
                              fit: BoxFit.cover)),
                    ),
                    Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        title: Text("Back"),
                        actions: <Widget>[Icon(Icons.share)],
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        centerTitle: false,
                      ),
                      body: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                movie.title,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                movie.runtime.toString() + " People watching",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white70),
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    movie.voteAverage.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: HexToColor("#FECB2F")),
                                  ),
                                  !movie.video
                                      ? SvgPicture.asset(
                                          "assets/images/ic_play_video.svg",
                                          height: 54,
                                          width: 54,
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Text(
                                movie.overview,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
              return SizedBox();
            },
          )),
    );
  }
}

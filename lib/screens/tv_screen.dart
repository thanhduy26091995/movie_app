import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/blocs/tv_bloc.dart';
import 'package:movie_app/components/constants.dart';
import 'package:movie_app/components/utils.dart';
import 'package:movie_app/models/TV.dart';

class TVApp extends StatefulWidget {
  const TVApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TVAppState();
  }
}

class _TVAppState extends State<TVApp> {
  TVBloc _tvBloc = TVBloc();
  TVListResponse _airingTodayResponse;
  TVListResponse _popularResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tvBloc.getAiringTodayTV(1);
    _tvBloc.getTVPopular(1);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "TV",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height / 2,
                child: StreamBuilder(
                  stream: _tvBloc.airingTodayStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      _airingTodayResponse = snapshot.data;
                      return ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _airingTodayResponse.results.length,
                          itemBuilder: (context, index) {
                            return _nowPlayingItem(
                                _airingTodayResponse.results[index]);
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
              Flexible(
                child: StreamBuilder(
                  stream: _tvBloc.popularStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      _popularResponse = snapshot.data;
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: _popularResponse.results.length,
                          itemBuilder: (context, index) {
                            return _popularItem(
                                _popularResponse.results[index]);
                          });
                    }
                    return SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nowPlayingItem(TV tv) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: Wrap(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                image: DecorationImage(
                  image: NetworkImage(Utils.getRealImagePath(
                      image_base_url, IMAGE_SIZE_w500, tv.posterPath)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                tv.name.toUpperCase(),
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

  Widget _popularItem(TV tv)
  {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: Wrap(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 3,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                image: DecorationImage(
                  image: NetworkImage(Utils.getRealImagePath(
                      image_base_url, IMAGE_SIZE_w500, tv.backdropPath)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                tv.name.toUpperCase(),
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

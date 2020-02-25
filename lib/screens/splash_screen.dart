import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/components/constants.dart';
import 'package:movie_app/components/hex_to_color.dart';
import 'package:movie_app/screens/walk_through.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class SplashScreenApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenAppState();
  }
}

class _SplashScreenAppState extends State<SplashScreenApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //deplay 3s
    Future.delayed(const Duration(seconds: 1), () {
      getShared();
    });
  }

  getShared() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isShowWalkThrough =
        sharedPreferences.get(SharedReferencesConstant.IS_SHOW_WALK_THROUGH);
    if (isShowWalkThrough == null || isShowWalkThrough) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WalkThroughApp()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePageApp()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            top: false,
            bottom: false,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/ic_launcher.png"),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Text(
                "Copyright @ \n 2020",
                textAlign: TextAlign.center,
                style: TextStyle(color: HexToColor("#FFFFFF").withOpacity(0.6)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

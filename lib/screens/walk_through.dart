import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/components/constants.dart';
import 'package:movie_app/components/hex_to_color.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalkThroughApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WalkThroughAppState();
  }
}

class _WalkThroughAppState extends State<WalkThroughApp> {
  int currentPageIndex;
  int pageLength;
  bool isShowGetStartedButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPageIndex = 0;
    pageLength = 3;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        PageView(
          children: <Widget>[
            WalkThrough(
              image: "assets/images/ic_walkthrough_1.png",
              text: "Get the first Movie & TV information",
            ),
            WalkThrough(
              image: "assets/images/ic_walkthrough_2.png",
              text: "Know the movie is not worth Watching",
            ),
            WalkThrough(
              image: "assets/images/ic_walkthrough_3.png",
              text: "Real-time updates movie Trailer",
            )
          ],
          onPageChanged: (value) {
            setState(() {
              currentPageIndex = value;
              if (currentPageIndex == pageLength - 1) {
                isShowGetStartedButton = true;
              } else {
                isShowGetStartedButton = false;
              }
            });
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).size.height * 0.7,
          child: Align(
            alignment: Alignment.center,
            child: DotsIndicator(
                dotsCount: pageLength, position: currentPageIndex * 1.0),
          ),
        ),
        Positioned(
            left: MediaQuery.of(context).size.width / 4,
            right: MediaQuery.of(context).size.width / 4,
            top: MediaQuery.of(context).size.height * 0.75,
            child: isShowGetStartedButton
                ? RaisedButton(
                    onPressed: () {
                      SharedPreferences.getInstance().then((data) {
                        data.setBool(
                            SharedReferencesConstant.IS_SHOW_WALK_THROUGH,
                            false);
                      });
                      //move to home
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageApp()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: 300,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          gradient: new LinearGradient(
                            colors: [
                              Color.fromRGBO(249, 159, 0, 100),
                              Color.fromRGBO(241, 131, 27, 100),
                              Color.fromRGBO(232, 96, 59, 100),
                              Color.fromRGBO(225, 71, 83, 100),
                              Color.fromRGBO(219, 48, 105, 100)
                            ],
                          )),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Get Started",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : const SizedBox())
      ]),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String image;
  final String text;

  WalkThrough({Key key, this.image, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: HexToColor("#FFFFFF"), fontSize: 30),
        ),
      ),
    );
  }
}

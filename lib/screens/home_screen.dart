import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_screen.dart';
import 'package:movie_app/screens/tv_screen.dart';

class HomePageApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageAppState();
  }
}

class _HomePageAppState extends State<HomePageApp> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    MovieApp(
      key: PageStorageKey('Movie'),
    ),
    TVApp(
      key: PageStorageKey('TV'),
    ),
    MovieApp(
      key: PageStorageKey('Map'),
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PageStorageBucket bucket = PageStorageBucket();
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: PageStorage(
          child: pages[_currentIndex],
          bucket: bucket,
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(_currentIndex),
    );
  }

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _currentIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Colors.teal,
              icon: Icon(Icons.home),
              title: Text('Home')),
          BottomNavigationBarItem(
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.tv),
              title: Text('TV')),
          BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: Icon(Icons.account_circle),
              title: Text('Profile')),
        ],
      );
}

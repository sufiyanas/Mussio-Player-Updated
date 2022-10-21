import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/screen/home_screen.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<SongModel> onAudioQuerysongs = []; //for first fetched song
  List<SongModel> sortedsongs = []; //for after sorted
  List<List> likedsongs = []; //for liked screen value
  List<List> recentsongs = []; //for recenlyplayed
  List<List> mostplaed = [];

  //for all songs
  Box<AllSongs> allSongsBox = getSongBox();
  //for liked song
  Box<List> librarysongbox = getlibrarybox();

  final audioQuery = OnAudioQuery();
  @override
  void initState() {
    requestPermission();
    songfetchngfuction();
    gotoHomescreen();
    // TODO: implement initState
    super.initState();
  }

  // for asking the permission
  void requestPermission() {
    Permission.storage.request();
  }

  //fetching songs from onaudioQury plugin
  songfetchngfuction() async {
    onAudioQuerysongs = await audioQuery.querySongs(
      sortType: SongSortType.DISPLAY_NAME,
      orderType: OrderType.DESC_OR_GREATER,
      ignoreCase: true,
      uriType: UriType.EXTERNAL,
    );
    //for sorting the song
    for (var song in onAudioQuerysongs) {
      if (song.fileExtension == 'm4a' || song.fileExtension == 'mp3') {
        sortedsongs.add(song);
      }
    }
    //for adding to hive of all songs
    for (var audio in sortedsongs) {
      final song = AllSongs(
        id: audio.id.toString(),
        songname: audio.displayNameWOExt,
        path: audio.uri!,
        songartist: audio.artist!,
      );
      await allSongsBox.put(audio.id, song);
    }
    getlikedsongs();
    getrecentplaylist();
    getmostplaed();
  }

  //for add fav song
  getlikedsongs() async {
    if (!librarysongbox.keys.contains('Likedsong')) {
      await librarysongbox.put('Likedsong', likedsongs);
    }
  }

//for recentsong
  getrecentplaylist() async {
    if (!librarysongbox.keys.contains('Recent')) {
      await librarysongbox.put('Recent', recentsongs);
    }
  }
  //for mostplaed

  getmostplaed() async {
    if (!librarysongbox.keys.contains('Mostplayed')) {
      await librarysongbox.put('Mostplayed', mostplaed);
    }
  }

//for go to homepage
  Future<void> gotoHomescreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => SecondPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OpenContainer(
              closedBuilder: (_, openContainer) {
                return Container(
                  child: Center(
                      child: Image.asset('assets/image/Splash_screen.png')),
                );
              },
              openColor: Colors.black,
              closedElevation: 20,
              closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              transitionDuration: Duration(milliseconds: 700),
              openBuilder: (_, closeContainer) {
                return SecondPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    Timer(Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    });
    Timer(Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(Duration(milliseconds: 3400), () {
      setState(() {
        _d = true;
      });
    });
    Timer(Duration(milliseconds: 3850), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          ThisIsFadeRoute(
            route: HomeScreen(),
          ),
        );
      });
    });
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? _h / 2
                      : 20,
              width: 20,
              // color: Colors.deepPurpleAccent,
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: _d
                      ? 1
                      : _c
                          ? 2
                          : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? _h
                  : _c
                      ? 80
                      : 20,
              width: _d
                  ? _w
                  : _c
                      ? 200
                      : 20,
              decoration: BoxDecoration(
                  color: _b ? theamcoloryellow : Colors.transparent,
                  // shape: _c? BoxShape.rectangle : BoxShape.circle,
                  borderRadius:
                      _d ? BorderRadius.only() : BorderRadius.circular(30)),
              child: Center(
                child: _e
                    ? AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          FadeAnimatedText(
                            'Mussio PLayer',
                            duration: Duration(milliseconds: 1700),
                            textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget? page;
  final Widget? route;

  ThisIsFadeRoute({this.page, this.route})
      : super(
          // barrierColor: Colors.black,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}

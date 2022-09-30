import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/db/songs_modal.dart';
import 'package:music_player/screen/home_screen.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<SongModel> OnAudioQuerysongs = []; //for first fetched song
  List<SongModel> sortedsongs = []; //for after sorted
  Box<AllSongs> AllSongsBox = Hive.box('AllSongs');

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
    final OnAudioQuerysongs = await audioQuery.querySongs(
      sortType: SongSortType.DISPLAY_NAME,
      orderType: OrderType.ASC_OR_SMALLER,
      ignoreCase: true,
      uriType: UriType.EXTERNAL,
    );

    for (var song in OnAudioQuerysongs) {
      if (song.fileExtension == 'Mp3') {
        OnAudioQuerysongs.add(song);
      }
    }

    for (var audio in sortedsongs) {
      final song = AllSongs(
        id: audio.id.toString(),
        songname: audio.displayNameWOExt,
        path: audio.artist!,
        songartist: audio.uri!,
      );
      await AllSongsBox.put(audio.id, song);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(image: AssetImage('assets/image/Splash_screen.png')),
      ),
    );
  }

  Future<void> gotoHomescreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
  }
}

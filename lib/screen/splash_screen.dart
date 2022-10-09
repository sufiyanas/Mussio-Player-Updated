import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
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

//for go to homepage
  Future<void> gotoHomescreen() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(image: AssetImage('assets/image/Splash_screen.png')),
      ),
    );
  }
}

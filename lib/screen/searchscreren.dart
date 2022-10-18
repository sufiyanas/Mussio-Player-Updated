import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/widgets/all_songs_list.dart';

import '../db/functions/db_functions.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //search function start
  Box<AllSongs> songBox = Hive.box<AllSongs>('Allsongs');
  List<AllSongs>? foundedsongs;
  List<AllSongs>? allSongsList;
  TextEditingController enterddata = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    allSongsList = songBox.values.toList().cast<AllSongs>();
    foundedsongs = List<AllSongs>.from(allSongsList!);
  }

  void filterthesong(String enterdkeyword) {
    List<AllSongs> resultlist = [];
    if (enterdkeyword.isEmpty) {
      resultlist = allSongsList!;
    } else {
      resultlist = allSongsList!
          .where((user) =>
              user.songname.toLowerCase().contains(enterdkeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundedsongs = resultlist;
    });
  }

  //search function End
  final Color theamcoloryellow = const Color(0xFFEA6C0F);
  //TextEditingController? controller;

  Box<List> librarybox = getlibrarybox();
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: Container(
      //     decoration: BoxDecoration(
      //       color: Colors.grey[850],
      //       // border: Border.all(width: 3.0),
      //       borderRadius: const BorderRadius.all(
      //           Radius.circular(30.0) //                 <--- border radius here
      //           ),
      //     ),
      //     child: IconButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         icon: Icon(Icons.arrow_back_ios_new_outlined)),
      //   ),
      // ),
      body: customscreenGradeant(
        childwidget: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 10, right: 10),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => filterthesong(value),
                controller: enterddata,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 211, 200, 200),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Search the song here",
                  labelStyle: TextStyle(color: Colors.brown),
                  prefixIcon: Icon(
                    Icons.search,
                    color: theamcoloryellow,
                  ),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: songBox.listenable(),
                  builder: (BuildContext context, Box<AllSongs> allSongs,
                      Widget? child) {
                    final List<int> keys = allSongs.keys.toList().cast<int>();
                    List<AllSongs> allSongsList = []; //All Song List
                    for (var key in keys) {
                      allSongsList.add(allSongs.get(key)!);
                    }
                    if (songBox.isEmpty) {
                      return const Center(
                        child: Text(
                          'Songs Not Found',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        // shrinkWrap: true,
                        // physics: const ScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {},
                          child: AllSongsList(
                            homeUI: true,
                            audioPlayer: audioPlayer,
                            index: index,
                            songList: foundedsongs!,
                          ),
                        ),
                        itemCount: foundedsongs!.length,
                      ),
                    );
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

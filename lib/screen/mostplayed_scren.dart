import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/widgets/all_songs_list.dart';
import 'package:music_player/widgets/library_functions.dart';

import '../db/functions/db_functions.dart';

class MostplayedScreen extends StatelessWidget {
  const MostplayedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String Libraryname = 'Mostplayed';
    final Color theamcoloryellow = const Color(0xFFEA6C0F);
    AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId("0");
    final Box<AllSongs> allsongbox = getSongBox();
    final Box<List> librarybox = getlibrarybox();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: customscreenGradeant(
        childwidget: SafeArea(
          child: Column(
            children: [
              appbarRow(
                leadingWidget: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: theamcoloryellow,
                      size: 25,
                    )),
                trailingWidget: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: theamcoloryellow,
                  iconSize: 25,
                ),
              ),
              songtitleandplaybuttonfunction(
                title: "Most Played",
                songlength: 10,
                iconbutton: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow_rounded),
                  color: theamcoloryellow,
                  iconSize: 30,
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: librarybox.listenable(),
                  builder:
                      (BuildContext context, Box<List> value, Widget? child) {
                    List<AllSongs> songlist =
                        value.get(Libraryname)!.toList().cast<AllSongs>();
                    return (songlist.isEmpty)
                        ? const Center(
                            child: Text('List is Empty'),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: ListView.builder(
                              itemCount: songlist.length,
                              itemBuilder: (context, index) {
                                return AllSongsList(
                                  audioPlayer: audioPlayer,
                                  homeUI: true,
                                  index: index,
                                  songList: songlist,
                                );
                              },
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

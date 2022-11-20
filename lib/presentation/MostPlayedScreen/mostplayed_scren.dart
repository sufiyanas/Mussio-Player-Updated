import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/presentation/SearchScreen/searchscreren.dart';
import 'package:music_player/widgets/all_songs_list.dart';
import 'package:music_player/widgets/appbarrow.dart';
import 'package:music_player/widgets/library_functions.dart';

import '../../db/functions/db_functions.dart';

class MostplayedScreen extends StatelessWidget {
  const MostplayedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String libraryname = 'Mostplayed';

    AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId("0");

    final Box<List> librarybox = getlibrarybox();
    List<AllSongs> allsonglsit =
        librarybox.get(libraryname)!.toList().cast<AllSongs>();

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
                  ),
                ),
                trailingWidget: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (SearchScreen()),
                        ));
                  },
                  icon: const Icon(Icons.search),
                  color: theamcoloryellow,
                  iconSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: songtitleandplaybuttonfunction(
                  title: "Most Played",
                  songlength: allsonglsit.length,
                  iconbutton: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow_rounded),
                    color: theamcoloryellow,
                    iconSize: 30,
                  ),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: librarybox.listenable(),
                  builder:
                      (BuildContext context, Box<List> value, Widget? child) {
                    List<AllSongs> songlist =
                        value.get(libraryname)!.toList().cast<AllSongs>();
                    return (songlist.isEmpty)
                        ? Column(
                            children: [
                              Center(
                                child: SvgPicture.asset(
                                    'assets/svg/add new playlist.svg'),
                              ),
                              Text(
                                'Songs are Empty •‿•',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 25),
                              )
                            ],
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

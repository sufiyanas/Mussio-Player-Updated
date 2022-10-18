import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/widgets/all_songs_list.dart';
import 'package:music_player/widgets/library_functions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikedScreen extends StatelessWidget {
  LikedScreen({
    Key? key,
  }) : super(key: key);
  final String Libraryname = 'Likedsong';

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  final Box<AllSongs> allsongbox = getSongBox();
  final Box<List> librarybox = getlibrarybox();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: customscreenGradeant(
          childwidget: SafeArea(
            child: Column(children: [
              appbarRow(
                leadingWidget: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: theamcoloryellow,
                  iconSize: 25,
                ),
                trailingWidget: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: theamcoloryellow,
                    size: 25,
                  ),
                ),
              ),

              ///////////////////////////////////////////////////////////////////////////////
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: songtitleandplaybuttonfunction(
                      title: 'Liked Screen',
                      songlength: 20,
                      iconbutton: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow_rounded),
                        color: theamcoloryellow,
                        iconSize: 30,
                      ))),

              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: librarybox.listenable(),
                  builder:
                      (BuildContext context, Box<List> value, Widget? child) {
                    List<AllSongs> songlist =
                        librarybox.get(Libraryname)!.toList().cast<AllSongs>();

                    return (songlist.isEmpty)
                        ? Center(
                            child: SizedBox(
                              width: 300,
                              height: 300,
                              child:
                                  SvgPicture.asset('assets/svg/liked song.svg'),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            child: ListView.builder(
                                itemCount: songlist.length,
                                itemBuilder: (context, index) {
                                  return AllSongsList(
                                    homeUI: true,
                                    index: index,
                                    audioPlayer: audioPlayer,
                                    songList: songlist,
                                  );
                                }),
                          );
                  },
                ),
              ),
            ]),
          ),
        ));
  }
}

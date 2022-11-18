import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/application/LikedSong/liked_song_bloc.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/presentation/searchscreren.dart';
import 'package:music_player/widgets/all_songs_list.dart';
import 'package:music_player/widgets/appbarrow.dart';
import 'package:music_player/widgets/library_functions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikedScreen extends StatelessWidget {
  LikedScreen({
    Key? key,
  }) : super(key: key);
  final String libraryname = 'Likedsong';

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  final Box<AllSongs> allsongbox = getSongBox();
  final Box<List> libraryBox = getlibrarybox();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<AllSongs> allsonglist =
          libraryBox.get(libraryname)!.toList().cast<AllSongs>();
      BlocProvider.of<LikedSongBloc>(context).add(CurrentSongListInFAV());
    });

    return Scaffold(
        backgroundColor: Color.fromARGB(0, 240, 77, 77),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (SearchScreen()),
                        ));
                  },
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
                child: BlocBuilder<LikedSongBloc, LikedSongState>(
                  builder: (context, state) {
                    return songtitleandplaybuttonfunction(
                      title: 'Liked Songs',
                      songlength: state.likedsong.length,
                      iconbutton: BlocBuilder<LikedSongBloc, LikedSongState>(
                        builder: (context, state) {
                          return (state.likedsong.isEmpty)
                              ? const SizedBox()
                              : CircleAvatar(
                                  backgroundColor: theamedarkgray,
                                  radius: 50,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow_rounded),
                                    color: theamcoloryellow,
                                    iconSize: 30,
                                  ),
                                );
                        },
                      ),
                    );
                  },
                ),
              ),

              Expanded(
                child: BlocBuilder<LikedSongBloc, LikedSongState>(
                  builder: (context, state) {
                    return (state.likedsong.isEmpty)
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
                                itemCount: state.likedsong.length,
                                itemBuilder: (context, index) {
                                  return AllSongsList(
                                    homeUI: true,
                                    index: index,
                                    audioPlayer: audioPlayer,
                                    songList: state.likedsong,
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

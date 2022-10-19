import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/widgets/all_songs_list.dart';
import 'package:music_player/widgets/appbarrow.dart';
import 'package:music_player/widgets/library_functions.dart';

class Recentlyplayed extends StatelessWidget {
  Recentlyplayed({Key? key}) : super(key: key);
  final Color theamcoloryellow = const Color(0xFFEA6C0F);
  //    AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  // final Box<AllSongs> allsongbox = getSongBox();
  // final Box<List> librarybox = getlibrarybox();
  final String Libraryname = 'Recent';
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId("0");
  final Box<AllSongs> allsongbox = getSongBox();
  final Box<List> librarybox = getlibrarybox();

  @override
  Widget build(BuildContext context) {
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
                title: "Recently Played",
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
                        librarybox.get(Libraryname)!.toList().cast<AllSongs>();
                    return (songlist.isEmpty)
                        ? const Center(
                            child: Text('Liked song is Empty'),
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
                                      songList: songlist);
                                }),
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

  Widget songslistFunction({
    required Title,
    required indextext,
  }) {
    const Color theamcoloryellow = Color(0xFFEA6C0F);
    return ListTile(
      title: Row(
        children: [
          Text(
            ' $indextext  ',
            style: const TextStyle(
              fontSize: 20,
              color: theamcoloryellow,
            ),
          ),
          SizedBox(
            width: 200,
            child: Text(
              overflow: TextOverflow.ellipsis,
              '$Title',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_rounded,
            color: theamcoloryellow,
          )),
    );
  }
}

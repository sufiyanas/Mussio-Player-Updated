import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/functions/playlist.dart';
import 'package:music_player/widgets/all_songs_list.dart';
import 'package:music_player/widgets/library_functions.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({
    Key? key,
    required this.playlistName,
    required this.playlistSongList,
  }) : super(key: key);
  final List<AllSongs> playlistSongList;
  final String playlistName;
  Box<List> libraryBox = getlibrarybox();

  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
    final Color theamcoloryellow = const Color(0xFFEA6C0F);
    return Scaffold(
      body: customplaylistscreengradient(
        childwidget: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  //this container is for color gradient
                  const Image(
                    height: 500,
                    image: AssetImage('assets/image/librarry-img-1.jpg'),
                  ),

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
                      onPressed: () {
                        botomsheetfunction(context, playlistName);
                      },
                      icon: Icon(
                        Icons.add,
                        color: theamcoloryellow,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: songtitleandplaybuttonfunction(
                  title: playlistName,
                  songlength: 10,
                  iconbutton: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow_rounded,
                      color: theamcoloryellow,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ValueListenableBuilder(
                    valueListenable: libraryBox.listenable(),
                    builder: (context, value, child) {
                      List<AllSongs> songList = libraryBox
                          .get(playlistName)!
                          .toList()
                          .cast<AllSongs>();
                      return (songList.isEmpty)
                          ? const Center(
                              child: Text('Please add some songs'),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: songList.length,
                              itemBuilder: (context, index) {
                                return AllSongsList(
                                    homeUI: true,
                                    index: index,
                                    audioPlayer: audioPlayer,
                                    songList: songList);
                              },
                            );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//listtilefunction
Widget songslistFunction(
    {required Title,
    required indextext,
    required songid,
    required playlistname,
    required BuildContext ctx}) {
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
        onPressed: () {
          playlist.addSongtoPlaylist(
              context: ctx, playlistname: playlistname, songid: songid);
        },
        icon: const Icon(
          Icons.add,
          color: theamcoloryellow,
        )),
  );
}

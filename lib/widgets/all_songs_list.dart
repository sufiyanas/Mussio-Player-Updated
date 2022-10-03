import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/screen/playlist_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/screen/nowPlaying.dart';

class AllSongsList extends StatelessWidget {
  AllSongsList({
    Key? key,
    required this.image,
    required this.index,
    required this.audioPlayer,
    required this.songList,
  }) : super(key: key);
  final String image;
  final int index;
  final AssetsAudioPlayer audioPlayer;
  final List<AllSongs> songList;

  Box<AllSongs> songBox = getSongBox();
  @override
  Widget build(BuildContext context) {
    const Color theamcoloryellow = Color(0xFFEA6C0F);
    return SizedBox(
      height: 100,
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => NowPlaying(
                  audioPlayer: audioPlayer,
                  songList: songList,
                  index: index,
                )))),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: AssetImage(image),
            ),
          ),
          title: Text(songList[index].songname,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.white)),
          subtitle: Text(
            songList[index].songartist,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(color: Colors.white),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              color: Colors.grey[850],
              // border: Border.all(width: 0.0),
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            ),
            child: PopupMenuButton(
              icon: Icon(
                Icons.more_vert_outlined,
                color: theamcoloryellow,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: theamcoloryellow,
                          )),
                      IconButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlaylistScreen())),
                          icon: Icon(Icons.playlist_add)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

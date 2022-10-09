import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/screen/nowPlaying.dart';

class LikedScreen extends StatelessWidget {
  LikedScreen({
    Key? key,
  }) : super(key: key);
  final String Libraryname = 'Likedsong';

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  final Box<AllSongs> allsongbox = getSongBox();
  final Box<List> librarybox = getlibrarybox();
  final Color theamcoloryellow = const Color(0xFFEA6C0F);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xFFff0A0A0A),
            Colors.white24,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.grey[850],
              // border: Border.all(width: 3.0),
              borderRadius: const BorderRadius.all(Radius.circular(
                      30.0) //                 <--- border radius here
                  ),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new, color: theamcoloryellow)),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search_outlined),
                  color: theamcoloryellow,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    // border: Border.all(width: 3.0),
                    borderRadius: const BorderRadius.all(Radius.circular(
                            30.0) //                 <--- border radius here
                        ),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        color: theamcoloryellow,
                      )),
                )
              ],
            ),
          ],
        ),
        // body: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     children: [
        //       ListTile(
        //           title: const Text('Liked Songs',
        //               style: TextStyle(color: Colors.white, fontSize: 35)),
        //           subtitle: const Text('2015 10 Songs',
        //               style: const TextStyle(
        //                   color: Colors.white, fontWeight: FontWeight.w300)),
        //           trailing: Container(
        //             width: 60,
        //             height: 60,
        //             decoration: BoxDecoration(
        //               color: Colors.grey[850],
        //               // border: Border.all(width: 3.0),
        //               borderRadius: const BorderRadius.all(Radius.circular(
        //                       50.0) //                 <--- border radius here
        //                   ),
        //             ),
        //             child: IconButton(
        //                 onPressed: () {},
        //                 icon: Icon(
        //                   Icons.play_arrow_rounded,
        //                   color: theamcoloryellow,
        //                   size: 25,
        //                 )),
        //           )),
        body: ValueListenableBuilder(
          valueListenable: librarybox.listenable(),
          builder: (BuildContext context, Box<List> value, Widget? child) {
            List songlist = librarybox.get(Libraryname)!.toList();
            return (songlist.isEmpty)
                ? Center(
                    child: Text('Liked song is Empty'),
                  )
                : ListView.builder(
                    itemCount: songlist.length,
                    itemBuilder: (context, index) {
                      return songslistFunction(
                          Title: songlist[index], indextext: index + 1);
                    });
          },
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
      // onTap: () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: ((context) => NowPlaying(
      //               index: ,
      //               songList: songlist,
      //               audioPlayer: audioPlayer))));
      // },
      title: Row(
        children: [
          Text(
            ' $indextext  ',
            style: TextStyle(
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
          icon: Icon(
            Icons.more_vert_rounded,
            color: theamcoloryellow,
          )),
    );
  }
}

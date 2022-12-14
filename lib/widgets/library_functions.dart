import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/screen/dynamic_island_screen.dart';
import 'package:music_player/screen/playlist_screen.dart';

//function for playcomplete songs
Widget songtitleandplaybuttonfunction(
    {required title, required int songlength, required IconButton iconbutton}) {
  return ListTile(
    title: Text('$title', style: TextStyle(color: Colors.white, fontSize: 35)),
    subtitle: Text('$songlength Songs',
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
    trailing: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[850],
          // border: Border.all(width: 3.0),
          borderRadius: const BorderRadius.all(
              Radius.circular(50.0) //                 <--- border radius here
              ),
        ),
        child: iconbutton),
  );
}

//library botom shheet

botomsheetfunction(BuildContext context, playlistname) {
  Box<AllSongs> allsongbox = getSongBox();
  List<AllSongs> allsonglist = allsongbox.values.toList().cast<AllSongs>();

  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        height: 500,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 65, 59, 59),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Text(
              'Add songs',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: allsonglist.length,
              itemBuilder: (context, index) {
                return songslistFunction(
                    ctx: context,
                    playlistname: playlistname,
                    songid: allsonglist[index].id,
                    Title: allsonglist[index].songname,
                    indextext: index);
              },
            ))
          ],
        ),
      );
    },
  );
}

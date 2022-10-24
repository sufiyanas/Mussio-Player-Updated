import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/functions/Liked.dart';
import 'package:music_player/functions/playlist.dart';
import 'package:music_player/widgets/popupANDalert.dart';

Librarybotomsheetfunction({
  required BuildContext ctx,
  required songId,
}) {
  Box<List> librarysongbox = getlibrarybox();
  Box<AllSongs> allsongsbox = getSongBox();
  // List<AllSongs> allsonglist = allsongbox.values.toList().cast<AllSongs>();
  List allLibraryKeys = librarysongbox.keys.toList();
  // List<AllSongs> allsongslist = allsongsbox.values.toList();
  allLibraryKeys.removeWhere((element) => element.contains('Likedsong'));
  allLibraryKeys.removeWhere((element) => element.contains('Recent'));
  allLibraryKeys.removeWhere((element) => element.contains('Mostplayed'));
  return showModalBottomSheet(
    context: ctx,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        height: 500,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 65, 59, 59),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Liked.addsongtolikesongs(
                            context: context, songID: songId);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: theamcoloryellow,
                        size: 25,
                      )),
                  InkWell(
                    onTap: () {
                      addnewplaylistfunction(context);
                    },
                    child: Container(
                      width: 130,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: theamcoloryellow,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: const [
                                Text('Playlist',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                Icon(
                                  Icons.playlist_add,
                                  color: Colors.white,
                                  size: 25,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.loop,
                        color: theamcoloryellow,
                        size: 25,
                      ))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: allLibraryKeys.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        log('Playlist');
                        playlist.addSongtoPlaylist(
                            songid: songId,
                            playlistname: allLibraryKeys[index],
                            context: context);
                      },
                      leading: Icon(
                        Icons.playlist_add_check,
                        color: theamcoloryellow,
                        size: 30,
                      ),
                      title: Text(
                        allLibraryKeys[index],
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    },
  );
}

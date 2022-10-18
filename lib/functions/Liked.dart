import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';

class Liked {
  //just opening the both boxes
  static final Box<AllSongs> allsongabox = getSongBox();
  static final Box<List> librarybox = getlibrarybox();

  static addsongtolikesongs(
      {required songID, required BuildContext context}) async {
    // log("Library key: ${librarybox.keys}");
    final List<AllSongs> allsongs = allsongabox.values.toList().cast();
    // log('all song list $allsongs');
    final List<AllSongs> likedsonglist =
        librarybox.get('Likedsong')!.toList().cast<AllSongs>();
    // log('Liked song list$likedsonglist, I hope its empty');
    final AllSongs likesong =
        allsongs.firstWhere((song) => song.id.contains(songID));

    //checking if likedsong  is not created just creating
    if (likedsonglist.where((song) => song.id == likesong.id).isEmpty) {
      likedsonglist.add(likesong);
      await librarybox.put('Likedsong', likedsonglist);
      showFavouritesSnackBar(
          context: context,
          songName: likesong.songname,
          message: 'Added to Favourites');
    } else {
      likedsonglist.removeWhere((AllSongs) => AllSongs.id == likesong.id);
      await librarybox.put('Likedsong', likedsonglist);
      showFavouritesSnackBar(
          context: context,
          songName: likesong.songname,
          message: 'Removed from Favourites');
    }
  }

  //for show snackbar

  static showFavouritesSnackBar(
      {required BuildContext context,
      required String songName,
      required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.up,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: theamedarkgray,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: const TextStyle(
                color: Color(0xFFEA6C0F),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              songName,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';

class Liked {
  //just opening the both boxes
  static final Box<AllSongs> allsongabox = getSongBox();
  static final Box<List> librarybox = getlibrarybox();

  static addsongtolikesongs({required songID}) async {
    log("Library key: ${librarybox.keys}");
    final List<AllSongs> allsongs = allsongabox.values.toList().cast();
    log('all song list $allsongs');
    final List<AllSongs> likedsonglist =
        librarybox.get('Likedsong')!.toList().cast<AllSongs>();
    log('Liked song list$likedsonglist, I hope its empty');
    final AllSongs likesong =
        allsongs.firstWhere((song) => song.id.contains(songID));

    //checking if likedsong  is not created just creating
    if (likedsonglist.where((song) => song.id == likesong.id).isEmpty) {
      likedsonglist.add(likesong);
      await librarybox.put('Likedsong', likedsonglist);
    } else {
      likedsonglist.removeWhere((AllSongs) => AllSongs.id == likesong.id);
      await librarybox.put('Likedsong', likedsonglist);
    }
  }
}

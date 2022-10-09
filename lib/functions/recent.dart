import 'package:hive_flutter/adapters.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';

class Recents {
  static final Box<AllSongs> allsongbox = getSongBox();
  static final Box<List> librarybox = getlibrarybox();

  static addtorecentplaylist({required String songID}) async {
    final List<AllSongs> dbsongs = allsongbox.values.toList().cast<AllSongs>();
    final List<AllSongs> recentlyplayedlist =
        librarybox.get('Recent')!.toList().cast<AllSongs>();

    final AllSongs recentsong =
        dbsongs.firstWhere((song) => song.id.contains(songID));
    ///////////////////////////////////////////////////////////////////////
    // int count = recentsong.count;
    // recentsong.count = count + 1;
    if (recentlyplayedlist.length >= 11) {
      recentlyplayedlist.removeLast();
    }
    if (recentlyplayedlist.where((song) => song.id == recentsong.id).isEmpty) {
      recentlyplayedlist.insert(0, recentsong);
      await librarybox.put('Recent', recentlyplayedlist);
    } else {
      recentlyplayedlist.removeWhere((song) => song.id == recentsong.id);
      recentlyplayedlist.insert(0, recentsong);
      await librarybox.put('Recent', recentlyplayedlist);
    }
  }
}

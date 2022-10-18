import 'package:hive_flutter/adapters.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/functions/playlist.dart';

class Mostpayed {
  static final Box<AllSongs> allsongbox = getSongBox();
  static final Box<List> librarysongbox = getlibrarybox();

  static addmostplayed({required sonid}) async {
    final mostplayedlist =
        librarysongbox.get('Mostplayed')!.toList().cast<AllSongs>();
    final dbsongs = allsongbox.values.toList().cast<AllSongs>();

    final mostpayedsong =
        dbsongs.firstWhere((element) => element.id.contains(sonid));
    if (mostplayedlist.length >= 15) {
      mostplayedlist.removeLast();
    }
    if (mostpayedsong.count >= 3) {
      if (mostplayedlist
          .where((element) => element.id == mostpayedsong.id)
          .isEmpty) {
        mostplayedlist.insert(0, mostpayedsong);
        await librarysongbox.put('Mostplayed', mostplayedlist);
      } else {
        mostplayedlist.removeWhere((element) => element.id == mostpayedsong.id);
        mostplayedlist.insert(0, mostpayedsong);
        await librarysongbox.put('Mostplayed', mostplayedlist);
      }
    }
  }
}

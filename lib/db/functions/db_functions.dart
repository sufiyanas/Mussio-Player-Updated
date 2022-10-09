import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/db/songs.dart';

Box<AllSongs> getSongBox() {
  return Hive.box<AllSongs>('Allsongs');
}

Box<List> getlibrarybox() {
  return Hive.box<List>('Library');
}

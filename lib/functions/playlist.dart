import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';

class playlist {
  static final Box<AllSongs> allsongsbox = getSongBox();
  static final Box<List> librarybox = getlibrarybox();

  //To Add a new playlist songs
  static addSongtoPlaylist({
    required String songid,
    required String playlistname,
    required BuildContext context,
  }) async {
    List<AllSongs> PlaylistSongs =
        librarybox.get(playlistname)!.toList().cast<AllSongs>();
    List<AllSongs> allsongs = allsongsbox.values.toList();

    AllSongs song =
        allsongs.firstWhere((element) => element.id.contains(songid));

    if (PlaylistSongs.contains(song)) {
      showPlaylistSnackbar(
          context: context,
          songName: song.songname,
          message: 'Platlist is already exist!!');
    } else {
      PlaylistSongs.add(song);
      await librarybox.put(playlistname, PlaylistSongs);
      showPlaylistSnackbar(
          context: context,
          songName: song.songname,
          message: 'Added to Play;ist ');
    }
  }

  //To Delete from Playlist

  static deleteplaylist(
      {required String playlistname, required String songid}) async {
    List<AllSongs> Playlistsongs =
        librarybox.get(playlistname)!.toList().cast<AllSongs>();

    List<AllSongs> allsongs = allsongsbox.values.toList();

    AllSongs song =
        allsongs.firstWhere((element) => element.id.contains(songid));

    Playlistsongs.removeWhere((element) => element.id == songid);
    await librarybox.put(playlistname, Playlistsongs);

    log('PLaylist Deleted');
  }

  ///snack bar for the playlist

  static void showPlaylistSnackbar({
    required BuildContext context,
    required String songName,
    required String message,
  }) {
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

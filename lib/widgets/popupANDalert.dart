import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/application/HomeScreen/home_screen_bloc.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';

///Add new playlist function popup
addnewplaylistfunction(BuildContext context) {
  Box<List> librarybox = getlibrarybox();
  TextEditingController texteditingController = TextEditingController();
  List<AllSongs> songList = [];
  Future createnewPlaylistcontainerfuntion() async {
    final String playlistName = texteditingController.text.trim();
    if (playlistName.isEmpty) {
      return;
    } else {
      await librarybox.put(playlistName, songList);
      Navigator.pop(context);
    }
  }

  return showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        backgroundColor: Colors.grey,
        content: SizedBox(
            height: 100,
            width: 100,
            child: ListView(
              children: [
                const Text('Add a new playlist'),
                TextFormField(
                  controller: texteditingController,
                  decoration: const InputDecoration(hintText: 'Playlist name'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                    TextButton(
                        onPressed: () {
                          createnewPlaylistcontainerfuntion();
                          BlocProvider.of<HomeScreenBloc>(context)
                              .add(LibrarySongs());
                          Navigator.pop(context);
                        },
                        child: const Text('Create It!!'))
                  ],
                )
              ],
            )),
      );
    },
  );
}

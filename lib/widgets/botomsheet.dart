import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/functions/db_functions.dart';

Librarybotomsheetfunction(
  BuildContext ctx,
) {
  Box<List> librarysongbox = getlibrarybox();
  // List<AllSongs> allsonglist = allsongbox.values.toList().cast<AllSongs>();
  List allLibraryKeys = librarysongbox.keys.toList();
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
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'PLaylist',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: allLibraryKeys.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.playlist_add_check,
                    color: theamcoloryellow,
                    size: 30,
                  ),
                  title: Text(
                    allLibraryKeys[index],
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                );
              },
            ))
          ],
        ),
      );
    },
  );
}

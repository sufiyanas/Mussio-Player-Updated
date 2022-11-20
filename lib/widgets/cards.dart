import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/presentation/LikedScreen/liked_screen.dart';
import 'package:music_player/presentation/RecentlyPlayed/recentlyplayed.dart';
import '../presentation/PlaylistScreen/playlist_screen.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    Key? key,
    // required this.imageUrl,
    required this.libraryName,
    required this.plalistSongList,
  }) : super(key: key);
  // final imageUrl;
  final libraryName;
  final List<AllSongs> plalistSongList;
  Box<List> librarybox = getlibrarybox();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDeleteAlertDialog(context);
      },
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => PlaylistScreen(
              playlistSongList: plalistSongList,
              playlistName: libraryName,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        color: Colors.transparent,
        // width: 180,
        // height: 200,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                  /////want to do medoia query
                  width: 200,
                  height: 180,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/library img-2.jpg')),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              libraryName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

//pop up cupertineio

  void showDeleteAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext ctx) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Do you want to Delete?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () async {
              Navigator.pop(ctx);
              await librarybox.delete(libraryName);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}

Widget customplaylsitcard({required image, required libraaryname}) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    color: Colors.transparent,
    // width: 180,
    // height: 200,
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(
              /////want to do medoia query
              width: 200,
              height: 180,
              fit: BoxFit.cover,
              image: AssetImage(image)),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          libraaryname,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}

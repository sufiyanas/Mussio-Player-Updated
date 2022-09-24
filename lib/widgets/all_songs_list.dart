import 'package:flutter/material.dart';

import 'package:music_player/screen/textscreen.dart';

class AllSongsList extends StatelessWidget {
  const AllSongsList({
    Key? key,
    required this.image,
    required this.songname,
    required this.singer,
    required this.songUri,
  }) : super(key: key);
  final String image;
  final String songname;
  final String singer;
  final String songUri;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => textclass(
                  songName: songname,
                  songArtist: singer,
                  songUri: songUri,
                )))),
        child: ListTile(
            leading: Image(
              image: AssetImage(image),
            ),
            title: Text(songname, style: TextStyle(color: Colors.white)),
            subtitle: Text(
              singer,
              style: TextStyle(color: Colors.white),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
                // border: Border.all(width: 0.0),
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: const Color(0xFFEA6C0F),
                  )),
            )),
      ),
    );
  }
}

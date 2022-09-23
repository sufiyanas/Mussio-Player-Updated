import 'package:flutter/material.dart';
import 'package:music_player/screen/liked_screen.dart';
import 'package:music_player/screen/playlist_Screen.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    Key? key,
    required this.imageUrl,
    required this.libraryName,
  }) : super(key: key);
  final imageUrl;
  final libraryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      color: Colors.transparent,
      // width: 180,
      // height: 200,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => (PlaylistScreen()),
          ));
        },
        onLongPress: () {},
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                width: 230,
                height: 200,
                fit: BoxFit.cover,
                image: AssetImage(imageUrl),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              libraryName,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

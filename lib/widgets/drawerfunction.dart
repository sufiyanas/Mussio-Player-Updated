//drawer function
//list tile function for drower
import 'package:flutter/material.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/presentation/liked_screen.dart';
import 'package:music_player/presentation/mostplayed_scren.dart';
import 'package:music_player/presentation/recentlyplayed.dart';
import 'package:music_player/presentation/settings_screen.dart';

Widget drawermainfunction({required BuildContext context}) {
  return Drawer(
    backgroundColor: const Color.fromARGB(255, 65, 59, 59),
    child: Column(
      // padding: EdgeInsets.zero,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 68,
                    backgroundImage: AssetImage(
                      'assets/image/Splash_screen.png',
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MostplayedScreen()),
                );
              },
              child: DrawerFunction(
                  leadingicon: Icons.playlist_play_rounded,
                  titletext: 'Most Played'),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Recentlyplayed()),
                );
              },
              child: DrawerFunction(
                  leadingicon: Icons.playlist_play_rounded,
                  titletext: 'Recently Played'),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LikedScreen()),
                );
              },
              child: DrawerFunction(
                  leadingicon: Icons.favorite_outline_outlined,
                  titletext: 'Liked Songs'),
            ),
            // InkWell(
            //   child: DrawerFunction(
            //       leadingicon: Icons.equalizer_rounded, titletext: 'Equalizer'),
            // ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()),
                );
              },
              child: DrawerFunction(
                  leadingicon: Icons.settings, titletext: 'Settings'),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Version',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '0.0.1',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 15,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 30,
            )
          ],
        )
      ],
    ),
  );
}

Widget DrawerFunction({required IconData leadingicon, required titletext}) {
  return ListTile(
    leading: Icon(
      leadingicon,
      color: theamcoloryellow,
      size: 20,
    ),
    title: Text(
      titletext,
      style: const TextStyle(fontSize: 20, color: Colors.white),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_outlined,
      color: theamcoloryellow,
      size: 20,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:music_player/colortheame/color.dart';

///music wave

Widget musicwave() {
  final double width = 10;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: 10,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: 30,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: 70,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: 30,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: 90,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: 10,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: 30,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: 10,
      ),
    ],
  );
}
//music wave2

Widget musicwaveoff() {
  final double width = 10;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      MiniMusicVisualizer(
        color: theamcoloryellow,
        width: width,
        height: 1,
      ),
      MiniMusicVisualizer(
        color: theamcoloryellow,
        width: width,
        height: 1,
      ),
      MiniMusicVisualizer(
        color: theamcoloryellow,
        width: width,
        height: 1,
      ),
      MiniMusicVisualizer(
        color: theamcoloryellow,
        width: width,
        height: 1,
      ),
      MiniMusicVisualizer(
        color: theamcoloryellow,
        width: width,
        height: 1,
      ),
      MiniMusicVisualizer(
        color: theamcoloryellow,
        width: width,
        height: 1,
      ),
      MiniMusicVisualizer(
        color: theamcoloryellow,
        width: width,
        height: 1,
      ),
      MiniMusicVisualizer(
        color: theamcoloryellow,
        width: width,
        height: 1,
      ),
    ],
  );
}

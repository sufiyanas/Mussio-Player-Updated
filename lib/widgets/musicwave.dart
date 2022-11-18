import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:music_player/colortheame/color.dart';

///music wave

Widget musicwave() {
  int random(int min, int max) {
    int result = min + Random().nextInt(max - min);
    return result;
  }

  final double width = 10;
  final height1 = random(10, 20).toDouble();
  final height2 = random(10, 40).toDouble();
  final height3 = random(30, 90).toDouble();
  final height4 = random(20, 90).toDouble();
  final height5 = random(50, 70).toDouble();
  final height6 = random(10, 40).toDouble();
  final height7 = random(30, 70).toDouble();
  final height8 = random(1, 90).toDouble();

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: height1,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: height2,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: height3,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: height4,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: height5,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: height6,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: height7,
      ),
      MiniMusicVisualizer(
        color: yellow,
        width: width,
        height: height8,
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

import 'package:flutter/material.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:music_player/screen/dynamic_island_screen.dart';

bool songplaying = false;
Color yellow = Color.fromRGBO(147, 90, 48, 100);
Color theamcoloryellow = Color(0xFFEA6C0F);
Color theamedarkyellow = Color.fromARGB(255, 147, 89, 48);
Color theamegraylight = Color.fromRGBO(125, 126, 129, 100);
Color theamegraylight2 = Color.fromRGBO(157, 158, 161, 100);
Color theamedarkgray = Color.fromRGBO(69, 64, 60, 100);
Color theameblack = Color.fromRGBO(10, 10, 10, 100);
customscreenGradeant({required Widget childwidget}) {
  return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(95, 173, 171, 171),
            Color.fromARGB(137, 131, 125, 125),
            Color.fromARGB(255, 142, 89, 51),
          ],
        ),
      ),
      child: childwidget);
}
//custom  Gradient theame for playlists

customplaylistscreengradient({required Widget childwidget}) {
  return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 156, 84, 32),
              Color.fromARGB(255, 181, 84, 15),
              Color.fromARGB(255, 154, 76, 20),
              Color.fromARGB(255, 70, 68, 68),
              Color.fromARGB(255, 62, 60, 60),
            ]),
      ),
      child: childwidget);
}

// custum Gardiend for homescreen Library

libraryGaradient({required Widget childWidget}) {
  return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Color.fromRGBO(147, 90, 48, .5),
              Color.fromRGBO(147, 90, 48, .7),
              Color.fromRGBO(147, 90, 48, .7),
              Color.fromRGBO(147, 90, 48, .5),
              // Color.fromARGB(255, 20, 20, 20),
              // Color.fromARGB(255, 20, 20, 20),
              Colors.transparent,
              // Color(0xFFEA6C0F),
            ],
            stops: [
              0.0,
              0.2,
              0.3,
              0.4,
              0.75,
              1,
            ]),
      ),
      child: childWidget);
}
//Gardent for searcgh scren

customSearchscreengradient({required Widget childwidget}) {
  return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 62, 53, 45),
              Color.fromARGB(255, 83, 77, 77),
              Color.fromARGB(255, 62, 60, 60),
            ]),
      ),
      child: childwidget);
}

// Gradiend For Now playing Screen Bacground
customGradientforNOwplaying({required Widget childWidget}) {
  return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 23, 23, 23),
            // Color(0xFFEA6C0F),
            Color.fromARGB(160, 25, 20, 20),
          ],
        ),
      ),
      child: childWidget);
}
//Image Gradieit for Playlist

custmImageGradientNowplaying({required Widget chilwidget}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: RadialGradient(
        center: Alignment(0.0, -0.0), // near the top right
        radius: 0.6,
        colors: <Color>[
          yellow,
          Colors.transparent,
        ],
        stops: <double>[0.4, 1.0],
      ),
    ),
    child: chilwidget,
  );
}

      // child: widget.audioPlayer.builderCurrent(
      //               builder: (context, player) {
      //             return 

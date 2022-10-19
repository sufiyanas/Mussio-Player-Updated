//custom app bar with mini player
import 'package:flutter/material.dart';
import 'package:music_player/screen/dynamic_island_screen.dart';

appbarRow({
  required Widget leadingWidget,
  required Widget trailingWidget,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: BoxDecoration(
              color: Colors.grey[850],
              // border: Border.all(width: 3.0),
              borderRadius: const BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            child: leadingWidget),
        DynamicIsland(),
        Container(
            decoration: BoxDecoration(
              color: Colors.grey[850],
              // border: Border.all(width: 3.0),
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            ),
            child: trailingWidget),
      ],
    ),
  );
}

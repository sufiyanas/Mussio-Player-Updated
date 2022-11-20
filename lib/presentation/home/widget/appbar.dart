import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/presentation/DynamicIslandScreen/dynamic_island_screen.dart';
import 'package:music_player/presentation/SearchScreen/searchscreren.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            // border: Border.all(width: 3.0),
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          child: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                log('drawer pressed');

                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: theamcoloryellow,
              ),
            ),
          )),
      // dynamic island function start

      Visibility(
        visible: songplaying,
        child: const DynamicIsland(),
      ),

      //dynamic island fuctions End
      Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            // border: Border.all(width: 3.0),
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          ),
          child: IconButton(
              onPressed: () {
                // setState(
                //   () {
                //     if (searchclicked = false == true) {
                //       searchclicked = false;
                //     } else {
                //       searchclicked = true;
                //     }
                //   },
                // );
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => SearchScreen()));
              },
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (ctx) => const SearchScreen()));

              icon: Icon(
                Icons.search,
                color: theamcoloryellow,
              )))
    ]);
  }
}

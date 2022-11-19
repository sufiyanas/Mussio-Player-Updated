import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/application/HomeScreen/home_screen_bloc.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/widgets/drawerfunction.dart';
import 'package:music_player/presentation/dynamic_island_screen.dart';
import 'package:music_player/presentation/liked_screen.dart';
import 'package:music_player/presentation/mostplayed_scren.dart';
import 'package:music_player/presentation/recentlyplayed.dart';
import 'package:music_player/presentation/searchscreren.dart';
import 'package:music_player/widgets/all_songs_list.dart';
import 'package:music_player/widgets/cards.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/widgets/popupANDalert.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  //asset audio player and hive box
  Box<AllSongs> songBox = getSongBox();

  Box<List> librarybox = getlibrarybox();

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawermainfunction(context: context),
      backgroundColor: Colors.transparent,
      body:
          ///////////////For Gradiend OF the Scaffold----start///////////////////////////////
          Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFff0A0A0A),
              Colors.white24,
            ],
          ),
        ),
        //////////////////////Gradend for Scaffold ---------End///////////////////////////

        /////////////////////Main body-------------strat//////////////////////////////////
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),

                ////////////////////////////// App bar-----start////////////////////////////////////
                child: Builder(builder: (context) {
                  return Row(
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

                        const DynamicIsland(),

                        //dynamic island fuctions End
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[850],
                              // border: Border.all(width: 3.0),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const SearchScreen()));
                                },
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (ctx) => const SearchScreen()));

                                icon: Icon(
                                  Icons.search,
                                  color: theamcoloryellow,
                                )))
                      ]);
                }),
              ),
              /////////////////////////////App bar ---------End//////////////////////////////////////
              Expanded(
                child: ListView(
                  children: [
                    libraryGaradient(
                      childWidget:
                          /////////////////////////Library ---------Start////////////////////////////////
                          Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 5, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Library',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {
                                    addnewplaylistfunction(context);
                                  },
                                  icon: Icon(
                                    Icons.playlist_add,
                                    color: theamcoloryellow,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(),
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
                            height: 225,
                            child: Column(
                              children: [
                                BlocBuilder<HomeScreenBloc, HomeScreenState>(
                                  builder: (context, state) {
                                    return (state.library.isEmpty)
                                        ? Expanded(
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (ctx) =>
                                                              LikedScreen()),
                                                    );
                                                  },
                                                  child: customplaylsitcard(
                                                      image:
                                                          'assets/image/song-4.jpg',
                                                      libraaryname:
                                                          'Liked Songs'),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (ctx) =>
                                                              Recentlyplayed()),
                                                    );
                                                  },
                                                  child: customplaylsitcard(
                                                      image:
                                                          'assets/image/songs-3.jpg',
                                                      libraaryname:
                                                          'Recently Played'),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (ctx) =>
                                                              const MostplayedScreen()),
                                                    );
                                                  },
                                                  child: customplaylsitcard(
                                                      image:
                                                          'assets/image/song-5.jpg',
                                                      libraaryname:
                                                          'Most Played'),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Expanded(
                                            child: NotificationListener<
                                                OverscrollIndicatorNotification>(
                                              child: ListView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                children: [
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                            builder: (ctx) =>
                                                                LikedScreen()),
                                                      );
                                                    },
                                                    child: customplaylsitcard(
                                                        image:
                                                            'assets/image/song-4.jpg',
                                                        libraaryname:
                                                            'Liked Songs'),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                            builder: (ctx) =>
                                                                Recentlyplayed()),
                                                      );
                                                    },
                                                    child: customplaylsitcard(
                                                        image:
                                                            'assets/image/songs-3.jpg',
                                                        libraaryname:
                                                            'Recently Played'),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                            builder: (ctx) =>
                                                                const MostplayedScreen()),
                                                      );
                                                    },
                                                    child: customplaylsitcard(
                                                        image:
                                                            'assets/image/song-5.jpg',
                                                        libraaryname:
                                                            'Most Played'),
                                                  ),
                                                  ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    physics:
                                                        const ScrollPhysics(),
                                                    itemCount:
                                                        state.library.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final String
                                                          playlistName =
                                                          state.library[index];
                                                      // log(Keys[index]);
                                                      List<AllSongs>
                                                          playlistSongList =
                                                          librarybox
                                                              .get(
                                                                  playlistName)!
                                                              .toList()
                                                              .cast<AllSongs>();
                                                      return CustomCard(
                                                        // imageUrl:
                                                        //     'assets/image/librarry-img-3.jpg',
                                                        libraryName:
                                                            playlistName,
                                                        plalistSongList:
                                                            playlistSongList,
                                                      );
                                                    },
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () =>
                                                        addnewplaylistfunction(
                                                            context),
                                                    child: customplaylsitcard(
                                                        image:
                                                            'assets/image/add new playlist blur.jpg',
                                                        libraaryname:
                                                            'Add Playlist'),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Songs',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                BlocBuilder<HomeScreenBloc, HomeScreenState>(
                                  builder: (context, state) {
                                    return Text(
                                      "${state.allsongs.length} Songs",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ////////////////////Library --------End///////////////////////////
                    ),
                    //////////////////////All SONG -----------STRAT/////////////////////
                    BlocBuilder<HomeScreenBloc, HomeScreenState>(
                      builder: (context, state) {
                        log('Home Bloc rebulded');
                        if (songBox.isEmpty) {
                          return const Center(
                            child: Text(
                              '''Songs Not Found
                              Please restart the 
                               Application''',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              songplaying = true;
                              return AllSongsList(
                                homeUI: true,
                                audioPlayer: audioPlayer,
                                index: index,
                                songList: state.allsongs,
                              );
                            },
                            itemCount: state.allsongs.length,
                          ),
                        );
                      },
                    ),
                    ///////////////////////ALL SONG --------END /////////////////////////////////////
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

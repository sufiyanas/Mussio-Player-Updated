import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/widgets/drawerfunction.dart';
import 'package:music_player/screen/dynamic_island_screen.dart';
import 'package:music_player/screen/liked_screen.dart';
import 'package:music_player/screen/mostplayed_scren.dart';
import 'package:music_player/screen/recentlyplayed.dart';
import 'package:music_player/screen/searchscreren.dart';
import 'package:music_player/widgets/all_songs_list.dart';
import 'package:music_player/screen/settings_screen.dart';
import 'package:music_player/widgets/cards.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //asset audio player and hive box
  Box<AllSongs> songBox = getSongBox();
  Box<List> librarybox = getlibrarybox();
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  bool songplaying = false;
  //Dynamic island ------started//////////////
  // final activeViews = views[activePageIndex];

  //Dynamic Island --------Over////////////////////////////

  //Second class Started
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Color theamcoloryellow = const Color(0xFFEA6C0F); //for Color
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
                                  onPressed: () =>
                                      Scaffold.of(context).openDrawer(),
                                  icon: Icon(
                                    Icons.menu,
                                    color: theamcoloryellow,
                                  )),
                            )),
                        // dynamic island function start

                        DynamicIsland(),

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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const SearchScreen()));
                                },
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
                    ///////////////////////Gradent For Library---Start//////////////////////////////
                    Container(
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
                      ////////////////////////Gradend for Library -------End/////////////////////////

                      /////////////////////////Library ---------Start////////////////////////////////
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, bottom: 5, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
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
                                ValueListenableBuilder(
                                  valueListenable: librarybox.listenable(),
                                  builder: (context, value, child) {
                                    List Keys = librarybox.keys.toList();
                                    Keys.removeWhere((element) =>
                                        element.contains('Likedsong'));
                                    Keys.removeWhere((element) =>
                                        element.contains('Recent'));
                                    Keys.removeWhere((element) =>
                                        element.contains('Mostplayed'));
                                    return (Keys.isEmpty)
                                        ? Expanded(
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                InkWell(
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
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (ctx) =>
                                                              MostplayedScreen()),
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
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  InkWell(
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
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                            builder: (ctx) =>
                                                                MostplayedScreen()),
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
                                                    physics: ScrollPhysics(),
                                                    itemCount: Keys.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final String
                                                          playlistName =
                                                          Keys[index];
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
                              children: const [
                                Text('Songs',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                Text(
                                  "201 Songs",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ////////////////////Library --------End///////////////////////////
                    ),

                    //////////////////////All SONG -----------STRAT/////////////////////

                    ValueListenableBuilder(
                      valueListenable: songBox.listenable(),
                      builder: (BuildContext context, Box<AllSongs> allSongs,
                          Widget? child) {
                        final List<int> keys =
                            allSongs.keys.toList().cast<int>();
                        List<AllSongs> allSongsList = songBox.values.toList();

                        if (songBox.isEmpty) {
                          return const Center(
                            child: Text(
                              'Songs Not Found',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                songplaying = true;
                                setState(() {
                                  bool songplaying = true;
                                });
                              },
                              child: AllSongsList(
                                homeUI: true,
                                audioPlayer: audioPlayer,
                                index: index,
                                songList: allSongsList,
                              ),
                            ),
                            itemCount: allSongsList.length,
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

  //pop up delete function
  Future aleartboxDeletefunction() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.grey,
        content: const Text('Do You Want to Delete it!!'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child:
                const Text('No Thanks!', style: TextStyle(color: Colors.brown)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Yah I am Sure!'),
            child: const Text('Yah I am Sure',
                style: TextStyle(color: Colors.brown)),
          ),
        ],
      ),
    );
  }

  ///Add new playlist function popup
  addnewplaylistfunction(BuildContext context) {
    Box<List> librarybox = getlibrarybox();
    TextEditingController texteditingController = TextEditingController();
    List<AllSongs> songList = [];
    Future createnewPlaylistcontainerfuntion() async {
      final String playlistName = texteditingController.text.trim();
      if (playlistName.isEmpty) {
        return;
      } else {
        await librarybox.put(playlistName, songList);
        Navigator.pop(context);
      }
    }

    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          content: SizedBox(
              height: 100,
              width: 100,
              child: ListView(
                children: [
                  Text('Add a new playlist'),
                  TextFormField(
                    controller: texteditingController,
                    decoration:
                        const InputDecoration(hintText: 'Playlist name'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel')),
                      TextButton(
                          onPressed: () {
                            createnewPlaylistcontainerfuntion();
                          },
                          child: Text('Create It!!'))
                    ],
                  )
                ],
              )),
        );
      },
    );
  }
}

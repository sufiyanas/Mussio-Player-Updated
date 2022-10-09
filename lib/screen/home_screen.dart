import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/screen/liked_screen.dart';
import 'package:music_player/screen/playlist_screen.dart';
import 'package:music_player/screen/recentlyplayed.dart';
import 'package:music_player/screen/searchscreren.dart';
import 'package:music_player/viewModal/view_model.dart';
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
  Box<AllSongs> songBox = Hive.box<AllSongs>('Allsongs');
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  bool songplaying = false;
  //Dynamic island ------started//////////////
  // final activeViews = views[activePageIndex];
  int activePageIndex = 0;
  bool collapsed = true;
  bool showViews = true;
  toggleViews() {
    setState(
      () {
        showViews = false;
        collapsed = !collapsed;
      },
    );
  }

  static const animationDuration = Duration(milliseconds: 250);
  //Dynamic Island --------Over////////////////////////////

  //Second class Started
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Color theamcoloryellow = const Color(0xFFEA6C0F); //for Color
  @override
  Widget build(BuildContext context) {
    final activeViews = views[0];
    final viewsToShow =
        collapsed ? activeViews.collapsedViews : activeViews.expandedViews;
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawermainfunction(),
      backgroundColor: Colors.transparent,
      body:
          ///////////////For Gradiend OF the Scaffold----start///////////////////////////////
          Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFff0A0A0A),
              Colors.white24,
              Color.fromARGB(174, 208, 131, 76),
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
                      songplaying
                          ? const Text(
                              'Discover',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                          : Align(
                              alignment: Alignment.topCenter,
                              child: GestureDetector(
                                onTap: toggleViews,
                                child: AnimatedContainer(
                                  onEnd: () => setState(() {
                                    showViews = true;
                                  }),
                                  margin: const EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(
                                        collapsed
                                            ? 20.0
                                            : activeViews.expandedBorderRadius),
                                  ),
                                  duration: animationDuration,
                                  curve: Curves.easeInOut,
                                  height: collapsed
                                      ? 40
                                      : activeViews.expandedHeight,
                                  width: MediaQuery.of(context).size.width *
                                      (collapsed ? 0.5 : 0.70),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: (collapsed ? 10.0 : 15.0),
                                        vertical: 5),
                                    child: AnimatedSwitcher(
                                      duration: animationDuration,
                                      child: showViews
                                          ? viewsToShow
                                          : const SizedBox(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                    ]),
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
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 15, bottom: 5, top: 20),
                            child: Text('Library',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white)),
                          ),
                          Container(
                            decoration: const BoxDecoration(),
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
                            height: 225,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                const SizedBox(
                                  width: 25,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => (LikedScreen()),
                                    ));
                                  },
                                  child: CustomCard(
                                    imageUrl: 'assets/image/songs-3.jpg',
                                    libraryName: 'Liked Screen ',
                                  ),
                                ),
                                InkWell(
                                  onLongPress: () {
                                    aleartboxDeletefunction();
                                  },
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => (Recentlyplayed()),
                                    ));
                                  },
                                  child: CustomCard(
                                      imageUrl:
                                          'assets/image/librarry-img-3.jpg',
                                      libraryName: 'Sleeping Songs'),
                                ),
                                InkWell(
                                  onLongPress: () {
                                    // addnewplaylistfunction(context);
                                    aleartboxDeletefunction();
                                  },
                                  onTap: (() {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          (const PlaylistScreen()),
                                    ));
                                  }),
                                  child: CustomCard(
                                      imageUrl:
                                          'assets/image/library img-2.jpg',
                                      libraryName: 'Dance '),
                                ),
                                InkWell(
                                  onTap: () {
                                    addnewplaylistfunction(context);
                                  },
                                  child: CustomCard(
                                      imageUrl: 'assets/image/download.jfif',
                                      libraryName: 'New Playlist'),
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
                    // FutureBuilder<List<SongModel>>(
                    //   future: _audioQuery.querySongs(
                    //       sortType: null,
                    //       orderType: OrderType.ASC_OR_SMALLER,
                    //       uriType: UriType.EXTERNAL,
                    //       ignoreCase: true),
                    //   builder: ((context, item) {
                    //     if (item.data == null) {
                    //       return Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     }
                    //     if (item.data!.isEmpty) {
                    //       return Text('No Songs FOund');
                    //     }
                    //     return Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: ListView.builder(
                    //         shrinkWrap: true,
                    //         physics: ScrollPhysics(),
                    //         itemBuilder: (context, index) => AllSongsList(
                    //           image:
                    //               'assets/image/Black Aesthetic Apple Music Icon for iOS14.jfif',
                    //           songname: '${item.data![index].displayNameWOExt}',
                    //           singer: '${item.data![index].artist}',
                    //           songUri: item.data![index].uri.toString(),
                    //         ),
                    //         itemCount: item.data!.length,
                    //       ),
                    //     );
                    //   }),
                    // ),
                    ValueListenableBuilder(
                      valueListenable: songBox.listenable(),
                      builder: (BuildContext context, Box<AllSongs> allSongs,
                          Widget? child) {
                        final List<int> keys =
                            allSongs.keys.toList().cast<int>();
                        List<AllSongs> allSongsList = [];
                        for (var key in keys) {
                          allSongsList.add(allSongs.get(key)!);
                        }
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
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) => AllSongsList(
                              image:
                                  'assets/image/Black Aesthetic Apple Music Icon for iOS14.jfif',
                              audioPlayer: audioPlayer,
                              index: index,
                              songList: allSongsList,
                            ),
                            itemCount: allSongs.length,
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

  //list tile function for drower
  Widget drawermainfunction() {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 65, 59, 59),
      child: Column(
        // padding: EdgeInsets.zero,
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
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlaylistScreen()),
                  ),
              child: DrawerFunction(
                  leadingicon: Icons.playlist_play_rounded,
                  titletext: 'Playlist')),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LikedScreen()),
            ),
            child: DrawerFunction(
                leadingicon: Icons.favorite_outline_outlined,
                titletext: 'Liked Screen'),
          ),
          InkWell(
            child: DrawerFunction(
                leadingicon: Icons.equalizer_rounded, titletext: 'Equalizer'),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingScreen()),
            ),
            child: DrawerFunction(
                leadingicon: Icons.settings, titletext: 'Settings'),
          ),
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

  ///Add new playlist function
  addnewplaylistfunction(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        var emailController = TextEditingController();
        return AlertDialog(
          backgroundColor: Colors.grey,
          content: SizedBox(
              height: 100,
              width: 100,
              child: ListView(
                children: [
                  Text('Add a new playlist'),
                  TextFormField(
                    controller: emailController,
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
                            Navigator.pop(context);
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

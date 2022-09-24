import 'package:flutter/material.dart';
import 'package:music_player/screen/playlist_Screen.dart';
import 'package:music_player/widgets/all_songs_list.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:music_player/screen/settings_screen.dart';
import 'package:music_player/widgets/cards.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
  }

  void requestPermission() {
    Permission.storage.request();
  }

  final assetsAudioPlayer = AssetsAudioPlayer();

  final _audioQuery = OnAudioQuery();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Color theamcoloryellow = const Color(0xFFEA6C0F);
  final Color theamcolorBlack = const Color(0xFFEA6C0F);
  final Color theamcolorWhite = const Color(0xFFEA6C0F);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFff0A0A0A),
          // Color.fromARGB(255, 222, 118, 43),
          // Color.fromARGB(255, 222, 118, 43),
          // Color.fromARGB(255, 20, 20, 20),
          // Color.fromARGB(255, 20, 20, 20),
          Colors.white24,
          // Color(0xFFEA6C0F),
        ],
        //     stops: [
        //   0.1,
        //   0.2,
        //   0.4,
        //   0.5,
        //   0.6,
        //   1,
        // ],
      )),
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Discover',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal)),
          centerTitle: true,
          leading: Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
                // border: Border.all(width: 3.0),
                borderRadius: const BorderRadius.all(Radius.circular(
                        30.0) //                 <--- border radius here
                    ),
              ),
              child: Builder(
                builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      color: theamcoloryellow,
                    )),
              )),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search_outlined),
                  color: theamcoloryellow,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    // border: Border.all(width: 3.0),
                    borderRadius: const BorderRadius.all(Radius.circular(
                            30.0) //                 <--- border radius here
                        ),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingScreen()),
                        );
                      },
                      icon: Icon(
                        Icons.settings,
                        color: theamcoloryellow,
                      )),
                )
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Color.fromARGB(255, 222, 118, 43),
                      Color.fromARGB(255, 222, 118, 43),
                      Color.fromARGB(255, 222, 118, 33),
                      // Color.fromARGB(255, 20, 20, 20),
                      // Color.fromARGB(255, 20, 20, 20),
                      Colors.transparent,
                      // Color(0xFFEA6C0F),
                    ],
                        stops: [
                      0.1,
                      0.2,
                      0.3,
                      0.8,
                      1,
                    ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Library',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                    Container(
                      decoration: BoxDecoration(),
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      height: 225,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PlaylistScreen()),
                              );
                            },
                            child: CustomCard(
                              imageUrl: 'assets/image/songs-3.jpg',
                              libraryName: 'Favoruite',
                            ),
                          ),
                          CustomCard(
                              imageUrl: 'assets/image/librarry-img-3.jpg',
                              libraryName: 'Liked'),
                          CustomCard(
                              imageUrl: 'assets/image/library img-2.jpg',
                              libraryName: 'In The '),
                          CustomCard(
                              imageUrl: 'assets/image/library img-2.jpg',
                              libraryName: 'Recent Songs'),
                        ],
                      ),
                    ),
                    const Text('Songs',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                    const Text(
                      '2015*10 Songs',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              FutureBuilder<List<SongModel>>(
                future: _audioQuery.querySongs(
                    sortType: null,
                    orderType: OrderType.ASC_OR_SMALLER,
                    uriType: UriType.EXTERNAL,
                    ignoreCase: true),
                builder: ((context, item) {
                  if (item.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (item.data!.isEmpty) {
                    return Text('No Songs FOund');
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) => AllSongsList(
                      image: 'assets/image/Splash_screen.png',
                      songname: '${item.data![index].displayNameWOExt}',
                      singer: '${item.data![index].artist}',
                      songUri: item.data![index].uri.toString(),
                    ),
                    itemCount: item.data!.length,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

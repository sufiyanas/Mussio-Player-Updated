import 'package:flutter/material.dart';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class textclass extends StatefulWidget {
  const textclass(
      {Key? key,
      required this.songName,
      required this.songArtist,
      required this.songUri})
      : super(key: key);
  final String songName;
  final String songArtist;
  final String songUri;

  @override
  State<textclass> createState() => _textclassState();
}

class _textclassState extends State<textclass> {
  final Color theamcoloryellow = const Color(0xFFEA6C0F);

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    super.initState();
    audioPlayer.open(
      Audio.file(widget.songUri),
      showNotification: true,
      autoStart: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color theamcoloryellow = const Color(0xFFEA6C0F);
    return Scaffold(
      // drawer: drwerfunction(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            // border: Border.all(width: 3.0),
            borderRadius: const BorderRadius.all(
                Radius.circular(30.0) //                 <--- border radius here
                ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              audioPlayer.stop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded, color: theamcoloryellow),
          ),
        ),
        actions: [
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
                // Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu_outlined,
                color: theamcoloryellow,
              ),
            ),
          ),
        ],
      ),
      body: Container(
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
        child: Column(
          children: [
            // Positioned(
            //   child: Padding(
            //     padding: const EdgeInsets.all(9.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [

            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.0, -0.3), // near the top right
                  radius: 0.6,
                  colors: <Color>[
                    theamcoloryellow, // yellow sun
                    Colors.transparent, // blue sky
                  ],
                  stops: <double>[0.4, 1.0],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 115,
                  ),
                  CircleAvatar(
                    backgroundColor: theamcoloryellow,
                    radius: 121,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/image/playscreen img.jpg',
                      ),
                      radius: 120,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text("${widget.songName}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text("${widget.songArtist}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal)),
                  Image.asset(
                    'assets/image/lastdownload (1).png',
                    // height: 250,
                    // width: 350,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: Container(
                      height: 32,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 51, 49, 45),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: LinearPercentIndicator(
                        barRadius: Radius.circular(8),
                        lineHeight: 10,
                        percent: 0.4,
                        progressColor: theamcoloryellow,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_previous_rounded,
                              color: theamcoloryellow,
                              size: 40,
                            )),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 49, 47, 47),
                                  blurRadius: 15,
                                  offset: Offset(5, 5)),
                            ],
                            color: Color.fromARGB(255, 7, 1, 1),
                            // border: Border.all(width: 3.0),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(
                                    35) //                 <--- border radius here
                                ),
                          ),
                          child: IconButton(
                              alignment: Alignment.center,
                              onPressed: () {
                                audioPlayer.playOrPause();
                              },
                              icon: Icon(
                                Icons.pause_rounded,
                                color: theamcoloryellow,
                                size: 35,
                              )),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_next_rounded,
                              color: theamcoloryellow,
                              size: 40,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drwerfunction() {
    return Drawer(
      backgroundColor: Colors.transparent,
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
    );
  }
}

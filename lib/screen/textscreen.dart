import 'package:flutter/material.dart';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              audioPlayer.stop();
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp)),
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
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.0, 0.0 - 0.4), // near the top right
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
                    'assets/image/Splash_screen.png',
                  ),
                  radius: 120,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Stay With Me',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.normal)),
              SizedBox(
                height: 7,
              ),
              Text('Sam Smit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal)),
              Container(
                decoration: BoxDecoration(
                  color: theamcoloryellow,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: LinearPercentIndicator(
                  lineHeight: 10,
                  percent: 0.5,
                  progressColor: theamcoloryellow,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous_rounded,
                        size: 40,
                      )),
                  IconButton(
                      onPressed: () {
                        audioPlayer.playOrPause();
                      },
                      icon: Icon(
                        Icons.pause_rounded,
                        size: 40,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_next_rounded,
                        size: 40,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

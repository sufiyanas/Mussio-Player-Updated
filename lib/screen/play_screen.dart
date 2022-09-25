import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/functions/audio_player.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({
    Key? key,
    required this.songName,
    required this.songArtist,
    required this.songUri,
  }) : super(key: key);
  final String songName;
  final String songArtist;
  final String songUri;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFff0A0A0A),
              Color(0xFFEA6C0F),
              Colors.white24,
            ],
            stops: [
              0.1,
              0.4,
              0.6,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Now Playings',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
              )),
          centerTitle: true,
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.grey[850],
              // border: Border.all(width: 3.0),
              borderRadius: const BorderRadius.all(Radius.circular(
                      30.0) //                 <--- border radius here
                  ),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  audioPlayer.stop();
                },
                icon: Icon(Icons.arrow_back_ios, color: theamcoloryellow)),
          ),
          actions: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    // border: Border.all(width: 3.0),
                    borderRadius: const BorderRadius.all(Radius.circular(
                            30.0) //                 <--- border radius here
                        ),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: theamcoloryellow,
                      )),
                ),
                SizedBox(
                  width: 5,
                )
              ],
            ),
          ],
        ),
        body: Center(
          child: Stack(children: [
            // Positioned(child: Container(
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //           begin: Alignment.topCenter,
            //           end: Alignment.bottomCenter,
            //           colors: [
            //         Colors.white12,
            //         const Color(0xFFEA6C0F),
            //         Colors.black54,
            //       ])),
            // )),
            Positioned(child: Container(height: 250, color: theamcoloryellow)),
            Column(
              children: [
                Center(
                  child: Positioned(
                      child: CircleAvatar(
                    radius: 123,
                    backgroundColor: theamcoloryellow,
                  )),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 2,
                ),
                CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage('assets/image/Splash_screen.png'),
                ),
                Text(
                  widget.songName,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Text(
                  widget.songArtist,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    Text('0.0'),
                    Expanded(child: Slider(value: 0.0, onChanged: (value) {})),
                    Text('0.0')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.skip_previous_rounded,
                          color: theamcoloryellow,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {
                          audioPlayer.playOrPause();
                        },
                        icon: Icon(
                          Icons.pause_rounded,
                          color: Colors.white,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.skip_next_rounded,
                          color: theamcoloryellow,
                          size: 40,
                        )),
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

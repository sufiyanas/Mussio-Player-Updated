import 'dart:developer';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/functions/audio_player.dart';

class NowPlaying extends StatefulWidget {
  NowPlaying({
    Key? key,
    required this.index,
    required this.songList,
    required this.audioPlayer,
    // required this.songName,
    // required this.songArtist,
    // required this.songUri
  }) : super(key: key);
  final int index;
  final List<AllSongs> songList;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId("0");
  // final String songName;
  // final String songArtist;
  // final String songUri;

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  final _audioPlayer = AssetsAudioPlayer.withId("0");
  bool isplaying = true;
  bool ispaused = false;
  double value = 10;
  final Color theamcoloryellow = const Color(0xFFEA6C0F);

  // AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<Audio> songAudio = [];
  void convertSongModel() {
    for (var song in widget.songList) {
      songAudio.add(
        Audio.file(
          song.path,
          metas: Metas(
            id: song.id.toString(),
            title: song.songname,
            artist: song.songartist,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    convertSongModel();
    super.initState();
    widget.audioPlayer.open(
      Playlist(audios: songAudio, startIndex: widget.index),
      showNotification: true,
      autoStart: true,
    );
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
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
              widget.audioPlayer.stop();
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
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(widget.songList[widget.index].songname,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.normal)),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(widget.songList[widget.index].songartist,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal)),
                  Image.asset(
                    'assets/image/lastdownload (1).png',
                    // height: 250,
                    // width: 350,
                  ),
                  _audioPlayer.builderRealtimePlayingInfos(
                    builder: (context, duration) {
                      Duration total = duration.current!.audio.duration;
                      Duration currentpos = duration.currentPosition;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(31, 19, 18, 18),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: ProgressBar(
                                  timeLabelTextStyle: TextStyle(
                                      color: Colors.transparent, fontSize: 1),
                                  thumbColor: Color.fromARGB(255, 49, 47, 47),
                                  thumbGlowColor: theamcoloryellow,
                                  thumbGlowRadius: 40,
                                  barHeight: 10,
                                  progress: duration.currentPosition,
                                  total: duration.current!.audio.duration,
                                  progressBarColor: theamcoloryellow,
                                  baseBarColor: Color.fromARGB(255, 77, 70, 55),
                                  onSeek: (newValue) {
                                    _audioPlayer.seek(newValue);
                                  },
                                ),
                              ),
                              // child: Slider(
                              //   min: 0,
                              //   max: total.inSeconds.toDouble(),
                              //   value: currentpos.inSeconds.toDouble(),
                              //   onChanged: (value) {
                              //     currentpos = Duration(seconds: (value).toInt());
                              //   },
                              // ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${duration.currentPosition.toString().split('.')[0]}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text('${total.toString().split('.')[0]}',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 10, right: 10),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.repeat_one_sharp),
                            color: theamcoloryellow,
                            iconSize: 30,
                          ),
                          IconButton(
                            onPressed: () async {
                              await widget.audioPlayer.previous();
                            },
                            icon: Icon(
                              Icons.skip_previous_rounded,
                              color: theamcoloryellow,
                              size: 40,
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 49, 47, 47),
                                    blurRadius: 15,
                                    offset: Offset(5, 5)),
                              ],
                              color: Color.fromARGB(255, 7, 1, 1),
                              // border: Border.all(width: 3.0),
                              borderRadius: BorderRadius.all(Radius.circular(
                                      35) //                 <--- border radius here
                                  ),
                            ),
                            child: IconButton(
                              alignment: Alignment.center,
                              onPressed: () {
                                if (isplaying == false) {
                                  widget.audioPlayer.play();
                                  setState(() {
                                    isplaying = true;
                                  });
                                } else if (isplaying == true) {
                                  widget.audioPlayer.pause();
                                  setState(() {
                                    isplaying = false;
                                  });
                                }
                              },
                              icon: isplaying == true
                                  ? Icon(
                                      Icons.pause_rounded,
                                      color: theamcoloryellow,
                                      size: 35,
                                    )
                                  : Icon(
                                      Icons.play_arrow_rounded,
                                      color: theamcoloryellow,
                                      size: 35,
                                    ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await widget.audioPlayer.next();
                            },
                            icon: Icon(
                              Icons.skip_next_rounded,
                              color: theamcoloryellow,
                              size: 40,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_horiz),
                            color: theamcoloryellow,
                            iconSize: 30,
                          ),
                        ],
                      ),
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

  PlayerBuilder myProgressbar() {
    return _audioPlayer.builderRealtimePlayingInfos(builder: (context, info) {
      final duration = info.current!.audio.duration;
      final position = info.currentPosition;
      log("progress bar working");
      return SizedBox(
        height: 20,
        child: ProgressBar(
          progress: position,
          total: duration,
          progressBarColor: Colors.amber,
          baseBarColor: Colors.amber,
          thumbColor: Colors.amber,
          bufferedBarColor: Colors.white.withOpacity(0.24),
          barHeight: 7.0,
          thumbRadius: 9.0,
          onSeek: (duration) {
            widget.audioPlayer.seek(duration);
          },
          timeLabelPadding: 10,
          timeLabelTextStyle: const TextStyle(
            color: Colors.amber,
            fontSize: 15,
          ),
        ),
      );
    });
  }
}

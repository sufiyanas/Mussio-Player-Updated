// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/functions/audio_player.dart';
import 'package:music_player/functions/recent.dart';
import 'package:music_player/widgets/botomsheet.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';

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
  bool islooping = true;
  double value = 10;
  final Color theamcoloryellow = const Color(0xFFEA6C0F);
  bool iswaveing = true;
  bool notwaving = false;

  // AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<Audio> songAudio = [];

  //converting the song
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
    const Color theamcoloryellow = Color(0xFFEA6C0F);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: const BorderRadius.all(Radius.circular(30.0) //
                ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {});
            },
            icon: const Icon(Icons.arrow_back_ios_rounded,
                color: theamcoloryellow),
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
              icon: const Icon(
                Icons.menu_outlined,
                color: theamcoloryellow,
              ),
            ),
          ),
        ],
      ),

      ///////////////////////////////Color Gradient For The Screen -----Start////////////////////////////////////////////////
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

        ////////////////////////////Color Gradient For Full Screen-------End/////////////////////////////////////////////////

        ////////////////////////////Color Gardient For image --------start////////////////////////////////////////////////////////////////////////////
        child: widget.audioPlayer.builderCurrent(builder: (context, playing) {
          final myaudio = find(songAudio, playing.audio.assetAudioPath);
          Recents.addtorecentplaylist(songID: myaudio.metas.id!);
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const RadialGradient(
                    center: Alignment(0.0, -0.4), // near the top right
                    radius: 0.6,
                    colors: <Color>[
                      theamcoloryellow,
                      Colors.transparent,
                    ],
                    stops: <double>[0.4, 1.0],
                  ),
                ),

                /////////////////////////Color Gardent For Image ------------end///////////////////////////////////////////////////

                /////////////////////////Image And Tiltle -------------------strat///////////////////////////////////////////////
                child: widget.audioPlayer.builderCurrent(
                    builder: (context, player) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 115,
                      ),
                      CircleAvatar(
                        backgroundColor: theamcoloryellow,
                        radius: 121,
                        child:
                            //  CircleAvatar(
                            //   backgroundImage:
                            //       // AssetImage(
                            //       //   'assets/image/playscreen img.jpg',
                            //       // ),
                            //       myaudio.metas.id! as ImageProvider,
                            //   radius: 120,
                            // ),
                            QueryArtworkWidget(
                          artworkHeight: 240,
                          artworkWidth: 240,
                          artworkFit: BoxFit.fill,
                          artworkBorder: BorderRadius.circular(120),
                          id: int.parse(myaudio.metas.id!),
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/image/playscreen img.jpg',
                            ),
                            radius: 120,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          // widget.songList[widget.index].songname,
                          _audioPlayer.getCurrentAudioTitle,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        _audioPlayer.getCurrentAudioArtist,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: PlayerBuilder.isPlaying(
                          player: widget.audioPlayer,
                          builder: (context, isPlaying) {
                            return (isPlaying == false)
                                ? Container(
                                    height: 90,
                                    child: musicwaveoff(),
                                  )
                                : Visibility(
                                    visible: isplaying,
                                    child: Container(
                                      height: 90,
                                      child: musicwave(),
                                    ),
                                  );
                          },
                        ),
                      ),
                      // isplaying ? musicwave() : musicwaveoff(),

                      //////////////////////////image And Title -------End/////////////////////////////////////////////////////////

                      ///////////////////////////Slider And Duration---- Start/////////////////////////////////////////////////////
                      _audioPlayer.builderRealtimePlayingInfos(
                        builder: (context, duration) {
                          Duration total = duration.current!.audio.duration;

                          // Duration currentpos = duration.currentPosition;
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(31, 19, 18, 18),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: ProgressBar(
                                      timeLabelTextStyle: const TextStyle(
                                          color: Colors.transparent,
                                          fontSize: 1),
                                      thumbColor:
                                          const Color.fromARGB(255, 49, 47, 47),
                                      barHeight: 10,
                                      progress: duration.currentPosition,
                                      total: duration.current!.audio.duration,
                                      progressBarColor: theamcoloryellow,
                                      baseBarColor:
                                          const Color.fromARGB(255, 77, 70, 55),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${duration.currentPosition.toString().split('.')[0]}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text('${total.toString().split('.')[0]}',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),

                      /////////////////////////////////Slider And Duration-----End////////////////////////////////////////

                      /////////////////////////////////Basic Functions -------Strat////////////////////////////////////////
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 40, right: 40),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.,
                            children: [
                              //for Looping
                              // IconButton(
                              //   alignment: Alignment.center,
                              //   onPressed: () {
                              //     islooping ? loopingoff() : loopingonn();
                              //   },
                              //   icon: islooping
                              //       ? const Icon(Icons.repeat_one)
                              //       : const Icon(Icons.repeat),
                              //   color: theamcoloryellow,
                              //   iconSize: 30,
                              // ),
                              //For previus Song
                              IconButton(
                                alignment: Alignment.center,
                                onPressed: () {
                                  setState(() {
                                    widget.audioPlayer.previous();
                                  });
                                },
                                icon: const Icon(
                                  Icons.skip_previous_rounded,
                                  color: theamcoloryellow,
                                  size: 40,
                                ),
                              ),
                              //for play and pause
                              Container(
                                width: 70,
                                height: 70,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 49, 47, 47),
                                      blurRadius: 15,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                  color: Color.fromARGB(255, 7, 1, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35) //
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
                                  icon: isplaying
                                      ? const Icon(
                                          Icons.pause_rounded,
                                          color: theamcoloryellow,
                                          size: 35,
                                        )
                                      : const Icon(
                                          Icons.play_arrow_rounded,
                                          color: theamcoloryellow,
                                          size: 35,
                                        ),
                                ),
                              ),
                              //For Next Song
                              IconButton(
                                alignment: Alignment.center,
                                onPressed: () {
                                  setState(() {
                                    widget.audioPlayer.next();
                                  });
                                },
                                icon: const Icon(
                                  Icons.skip_next_rounded,
                                  color: theamcoloryellow,
                                  size: 40,
                                ),
                              ),
                              //for Like And Playlist
                              // IconButton(
                              //   alignment: Alignment.center,
                              //   onPressed: () {},
                              //   icon: const Icon(Icons.more_horiz),
                              //   color: theamcoloryellow,
                              //   iconSize: 35,
                              // ),
                            ],
                          ),
                        ),
                      ),

                      ////////////////////////////////////////////Show Bottom Sheet-start //////////////////////////////////////
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () => Librarybotomsheetfunction(context),
                        child: Container(
                          height: 25,
                          width: 80,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 49, 47, 47),
                                  blurRadius: 15,
                                  offset: Offset(5, 5),
                                ),
                              ],
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      )
                      //////////////////////////////////////Basic Functions-------End/////////////////////////////////////////
                    ],
                  );
                }),
              ),
            ],
          );
        }),
      ),
    );
  }
  //loop function

  loopingonn() {
    _audioPlayer.setLoopMode(LoopMode.single);
    setState(() {
      islooping = true;
    });
  }

  loopingoff() {
    _audioPlayer.setLoopMode(LoopMode.none);
    setState(() {
      islooping = false;
    });
  }
}

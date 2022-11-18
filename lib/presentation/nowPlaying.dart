// ignore_for_file: prefer_const_constructors
import 'dart:developer';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/functions/recent.dart';
import 'package:music_player/widgets/botomsheet.dart';
import 'package:music_player/widgets/musicwave.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:text_scroll/text_scroll.dart';

class NowPlaying extends StatefulWidget {
  NowPlaying({
    Key? key,
    required this.index,
    required this.songList,
    required this.audioPlayer,
  }) : super(key: key);
  final int index;
  final List<AllSongs> songList;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId("0");
  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  final _audioPlayer = AssetsAudioPlayer.withId("0");
  bool ispaused = false;
  bool islooping = true;
  double value = 10;
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
    return widget.audioPlayer.builderCurrent(builder: (context, playing) {
      final myaudio = find(songAudio, playing.audio.assetAudioPath);
      Recents.addtorecentplaylist(songID: myaudio.metas.id!);
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
                // border: Border.all(width: 3.0),
                // borderRadius: const BorderRadius.all(
                //   Radius.circular(25.0),
                //),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: theamcoloryellow,
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              'Now Playing',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w400, wordSpacing: 2),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[850],
                  // border: Border.all(width: 3.0),
                  // borderRadius: const BorderRadius.all(
                  //   Radius.circular(40.0),
                  // ),
                ),
                child: IconButton(
                    onPressed: () {
                      Librarybotomsheetfunction(
                          ctx: context, songId: myaudio.metas.id);
                    },
                    icon: Icon(
                      Icons.menu,
                      color: theamcoloryellow,
                    )),
              )
            ],
          ),
          body: customGradientforNOwplaying(
              childWidget: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //second Element
                custmImageGradientNowplaying(
                  chilwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      AvatarGlow(
                        glowColor: theamcoloryellow,
                        endRadius: 150,
                        animate: true,
                        child: CircleAvatar(
                          backgroundColor: theamcoloryellow,
                          radius: 121,
                          child: QueryArtworkWidget(
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: TextScroll(
                                  _audioPlayer.getCurrentAudioTitle,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  intervalSpaces: 10,
                                  velocity:
                                      Velocity(pixelsPerSecond: Offset(50, 0)),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // child: Text(
                        //   // widget.songList[widget.index].songname,
                        //   _audioPlayer.getCurrentAudioTitle,
                        //   overflow: TextOverflow.ellipsis,
                        //   style: const TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 25,
                        //     fontWeight: FontWeight.normal,
                        //   ),
                        // ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        _audioPlayer.getCurrentAudioArtist,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                //Third Elemant
                PlayerBuilder.isPlaying(
                  player: widget.audioPlayer,
                  builder: (context, isPlaying) {
                    return (isPlaying == false)
                        ? SizedBox(
                            height: 90,
                            child: musicwaveoff(),
                          )
                        : Visibility(
                            visible: isPlaying,
                            child: SizedBox(
                              height: 90,
                              child: musicwave(),
                            ),
                          );
                  },
                ),
                //-----------------------------------------------------------------------------
                // isplaying ? musicwave() : musicwaveoff(),

                //////////////////////////image And Title -------End/////////////////////////////////////////////////////////

                ///////////////////////////Slider And Duration---- Start/////////////////////////////////////////////////////

                //-----------------------------------------------------
                _audioPlayer.builderRealtimePlayingInfos(
                  builder: (context, duration) {
                    Duration total = duration.current!.audio.duration;

                    // Duration currentpos = duration.currentPosition;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: ProgressBar(
                              thumbGlowRadius: 5,
                              thumbRadius: 9,
                              barCapShape: BarCapShape.round,
                              timeLabelType: TimeLabelType.remainingTime,
                              timeLabelTextStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.7)),
                              thumbColor: const Color.fromARGB(255, 49, 47, 47),
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
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         '${duration.currentPosition.toString().split('.')[0]}',
                        //         style: TextStyle(
                        //             color: Colors.white.withOpacity(0.8)),
                        //       ),
                        //       Text('${total.toString().split('.')[0]}',
                        //           style: TextStyle(
                        //               color: Colors.white.withOpacity(0.8))),
                        //     ],
                        //   ),
                        // )
                      ],
                    );
                  },
                ),

                /////////////////////////////////Slider And Duration-----End////////////////////////////////////////

                /////////////////////////////////Basic Functions -------Strat////////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.,
                      children: [
                        //For previus Song
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onDoubleTap: () {
                            log('On double Tapped');
                          },
                          child: IconButton(
                            alignment: Alignment.center,
                            onPressed: () {
                              setState(() {
                                widget.audioPlayer.previous();
                              });
                            },
                            icon: Icon(
                              Icons.skip_previous_rounded,
                              color: theamcoloryellow,
                              size: 40,
                            ),
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
                            child: PlayerBuilder.isPlaying(
                                player: widget.audioPlayer,
                                builder: (context, isPlaying) {
                                  return IconButton(
                                    alignment: Alignment.center,
                                    onPressed: () {
                                      if (isPlaying == false) {
                                        widget.audioPlayer.play();
                                        setState(() {
                                          isPlaying = true;
                                        });
                                      } else if (isPlaying == true) {
                                        widget.audioPlayer.pause();
                                        setState(() {
                                          isPlaying = false;
                                        });
                                      }
                                    },
                                    icon: isPlaying
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
                                  );
                                })),
                        //For Next Song
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onDoubleTap: () {
                            log('Double tapped');
                          },
                          child: IconButton(
                            alignment: Alignment.center,
                            onPressed: () {
                              setState(() {
                                widget.audioPlayer.next();
                              });
                            },
                            icon: Icon(
                              Icons.skip_next_rounded,
                              color: theamcoloryellow,
                              size: 40,
                            ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          widget.audioPlayer.setPitch(1);
                        },
                        child: Text('Eculizer')),
                    ElevatedButton(
                        onPressed: () {
                          widget.audioPlayer.setPitch(0.2);
                        },
                        child: Text('Eculizer')),
                    ElevatedButton(
                        onPressed: () {
                          widget.audioPlayer.setPitch(0.95);
                        },
                        child: Text('Eculizer')),
                    ElevatedButton(
                        onPressed: () {
                          widget.audioPlayer.setPitch(1.3);
                        },
                        child: Text('Eculizer')),
                  ],
                ),
                Spacer()

                ////////////////////////////////////////////Show Bottom Sheet-start //////////////////////////////////////
                //last elemnt
                // InkWell(
                //   highlightColor: Colors.transparent,
                //   splashColor: Colors.transparent,
                //   onTap: () => Librarybotomsheetfunction(
                //       ctx: context, songId: myaudio.metas.id),
                //   child: Container(
                //     margin: EdgeInsets.only(top: 30, bottom: 30),
                //     height: 25,
                //     width: 80,
                //     decoration: BoxDecoration(
                //         boxShadow: const [
                //           BoxShadow(
                //             color: Color.fromARGB(255, 49, 47, 47),
                //             blurRadius: 15,
                //             offset: Offset(5, 5),
                //           ),
                //         ],
                //         color: Colors.black,
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // )
                //////////////////////////////////////Basic Functions-------End/////////////////////////////////////////
              ],
            ),
          ))
          // }),
          );

      //           ],
      //         );
      //       }),
      //     ),
      //   );
      // }
      //loop function

//       loopingonn() {
//         _audioPlayer.setLoopMode(LoopMode.single);
//         setState(() {
//           islooping = true;
//         });
//       }

//       loopingoff() {
//         _audioPlayer.setLoopMode(LoopMode.none);
//         setState(() {
//           islooping = false;
//         });
// //   }
// // }
//       }
    });
  }
}

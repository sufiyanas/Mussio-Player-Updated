import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MusicExpanded extends StatefulWidget {
  const MusicExpanded({super.key});

  @override
  State<MusicExpanded> createState() => _MusicExpandedState();
}

class _MusicExpandedState extends State<MusicExpanded> {
  final AssetsAudioPlayer audioplayer = AssetsAudioPlayer.withId('0');
  bool isplaying = true;
  Color theamcoloryellow = Color(0xFFEA6C0F);
  @override
  Widget build(BuildContext context) {
    return audioplayer.builderCurrent(builder: (context, player) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  'assets/image/thunder.png',
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(audioplayer.getCurrentAudioTitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      audioplayer.getCurrentAudioArtist,
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ////////////////////Slider and Duration ---------Start////////////////////////////////////////////
          audioplayer.builderRealtimePlayingInfos(
            builder: (context, info) {
              return Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ProgressBar(
                          // thumbColor: theamcoloryellow,
                          thumbGlowColor: Colors.grey,
                          // thumbGlowRadius: Colors.grey,
                          thumbGlowRadius: 1,
                          thumbColor: Colors.white10,
                          thumbCanPaintOutsideBar: false,
                          baseBarColor: Colors.grey,
                          progressBarColor: Colors.white,
                          thumbRadius: 7,
                          timeLabelLocation: TimeLabelLocation.sides,
                          timeLabelTextStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                          ),
                          progress: info.currentPosition,
                          total: info.current!.audio.duration,
                          onSeek: (newValue) {
                            audioplayer.seek(newValue);
                          }

                          // value: 0.25,
                          // backgroundColor: Colors.grey,
                          // color: Colors.white,
                          ),
                    ),
                  ),
                ],
              );
            },
          ),
          ///////////////Slider and Duration ---------End//////////////////////////////

          ////////////////Basic Funcionalites ------------Start/////////////////////////
          Row(
            children: [
              // const Spacer(),
              Expanded(
                // flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          audioplayer.getCurrentAudioTitle;
                          audioplayer.previous();
                        });
                      },
                      icon: const Icon(
                        CupertinoIcons.backward_end_alt_fill,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    //for play and Pause----start
                    IconButton(
                      onPressed: () {
                        onplayandpause();
                      },
                      icon: isplaying
                          ? const Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: 25,
                            )
                          : const Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 25,
                            ),
                    ),

                    //play and pause -----end

                    //forward song ------start
                    IconButton(
                      onPressed: () {
                        setState(() {
                          audioplayer.next();
                        });
                      },
                      icon: const Icon(
                        CupertinoIcons.forward_end_alt_fill,
                        color: Colors.white,
                        size: 23,
                      ),
                    )
                    //forward song -----end
                  ],
                ),
              ),
            ],
          )

          ////////////////////Basic Functiaanlites------------End //////////////////////////
        ],
      );
    });
  }

  //play and pause functions

  onplayandpause() {
    if (isplaying == false) {
      audioplayer.play();
      setState(() {
        isplaying = true;
      });
    } else if (isplaying == true) {
      audioplayer.pause();
      setState(() {
        isplaying = false;
      });
    }
  }
  //current audio player

  // cuttntaudioplayer() {

  //   final
  // }

}

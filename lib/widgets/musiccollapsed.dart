import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:music_player/colortheame/color.dart';

class MusicCollapsed extends StatelessWidget {
  const MusicCollapsed({super.key});

  @override
  Widget build(BuildContext context) {
    final AssetsAudioPlayer audioplayer = AssetsAudioPlayer.withId('0');
    return PlayerBuilder.isPlaying(
        player: audioplayer,
        builder: (context, isPlaying) {
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/image/thunder.png',
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
              const Spacer(),
              // Image.asset(
              //   'assets/image/waves.png',
              //   fit: BoxFit.contain,
              //   width: 70,
              // )
              (isPlaying == false)
                  ? MiniMusicVisualizer(
                      color: theamcoloryellow,
                      width: 10,
                      height: 1,
                    )
                  : Visibility(
                      visible: isPlaying,
                      child: MiniMusicVisualizer(
                        color: theamcoloryellow,
                        width: 10,
                        height: 10,
                      ),
                    ),
            ],
          );
        });
  }
}

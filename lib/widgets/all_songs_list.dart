import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/functions/Liked.dart';
import 'package:music_player/screen/playlist_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/screen/nowPlaying.dart';
import 'package:music_player/widgets/botomsheet.dart';
import 'package:music_player/widgets/library_functions.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AllSongsList extends StatefulWidget {
  AllSongsList({
    Key? key,
    required this.index,
    required this.audioPlayer,
    required this.songList,
    required this.homeUI,
  }) : super(key: key);
  final String image =
      'assets/image/Black Aesthetic Apple Music Icon for iOS14.jfif';
  final bool homeUI;
  final int index;
  final AssetsAudioPlayer audioPlayer;
  final List<AllSongs> songList;

  @override
  State<AllSongsList> createState() => _AllSongsListState();
}

class _AllSongsListState extends State<AllSongsList> {
  void initState() {
    super.initState();
    controller = SwipeActionController(selectedIndexPathsChangeCallback:
        (changedIndexPaths, selected, currentCount) {
      print(
          'cell at ${changedIndexPaths.toString()} is/are ${selected ? 'selected' : 'unselected'} ,current selected count is $currentCount');

      ///I just call setState() to update simply in this example.
      ///But the whole page will be rebuilt.
      ///So when you are developing,you'd better update a little piece
      ///of UI sub tree for best performance....

      setState(() {});
    });
  }

  Box<AllSongs> songBox = getSongBox();

  //List Of
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

  ///sipebutton
  late SwipeActionController controller;

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    convertSongModel();
    const Color theamcoloryellow = Color(0xFFEA6C0F);
    return SwipeActionCell(
      backgroundColor: Colors.transparent,
      selectedForegroundColor: Colors.black.withAlpha(30),
      controller: controller,
      key: ValueKey([widget.index]),
      index: widget.index,
      trailingActions: [
        SwipeAction(
          color: theamcoloryellow,
          title: "Like",
          nestedAction: SwipeNestedAction(title: "Liked"),
          onTap: (handler) async {
            await handler(false);

            Liked.addsongtolikesongs(
              context: context,
              songID: widget.songList[widget.index].id,
            );

            // await handler(true);

            // list.removeAt(index);
            // setState(() {});
          },
        ),
        SwipeAction(
            title: "Playlist",
            color: Colors.grey,
            onTap: (handler) {
              Librarybotomsheetfunction(context);
            },
            nestedAction: SwipeNestedAction(title: "Liked"),
            backgroundRadius: 20),
      ],
      // leadingActions: [
      //   SwipeAction(
      //       title: "delete",
      //       onTap: (handler) async {
      //         botomsheetfunction(context, handler);
      //       }),
      //   SwipeAction(
      //       title: "action3", color: Colors.orange, onTap: (handler) {}),
      // ],
      child: SizedBox(
        height: 100,
        child: (widget.homeUI)
            ? ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => NowPlaying(
                          audioPlayer: widget.audioPlayer,
                          songList: widget.songList,
                          index: widget.index,
                        )))),
                leading: QueryArtworkWidget(
                    nullArtworkWidget: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage(widget.image),
                      ),
                    ),
                    id: int.parse(widget.songList[widget.index].id),
                    artworkWidth: 50,
                    artworkHeight: 90,
                    artworkBorder: BorderRadius.circular(10),
                    type: ArtworkType.AUDIO),
                title: Text(widget.songList[widget.index].songname,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(color: Colors.white)),
                subtitle: Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: theamcoloryellow,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        widget.songList[widget.index].songartist,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    // border: Border.all(width: 0.0),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: PopupMenuButton(
                    // splashRadius: 0.5,
                    color: Colors.grey[500],
                    padding: const EdgeInsets.all(1),
                    position: PopupMenuPosition.under,
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: theamcoloryellow,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Like',
                              ),
                              IconButton(
                                  onPressed: () {
                                    Liked.addsongtolikesongs(
                                        context: context,
                                        songID:
                                            widget.songList[widget.index].id);

                                    // log('Button Pressed ${songList[index].id}');
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: theamcoloryellow,
                                  )),
                            ],
                          ),
                          const Text('Add to PLaylist'),
                          IconButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => PlaylistScreen(
                              //               playlistSongList: null,
                              //             )));
                            },
                            icon: const Icon(Icons.playlist_add),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              )
            : Row(children: [
                Row(
                  children: [
                    Text(
                      '${widget.index} ',
                      style: const TextStyle(
                          color: theamcoloryellow, fontSize: 20),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(widget.songList[widget.index].songname,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20)),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_rounded,
                    color: theamcoloryellow,
                  ),
                ),
              ]),
      ),
    );
  }
}

//botom modal sheet


import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/functions/playlist.dart';
import 'package:music_player/functions/Liked.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/screen/nowPlaying.dart';
import 'package:music_player/widgets/botomsheet.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AllSongsList extends StatefulWidget {
  AllSongsList({
    Key? key,
    this.playlistname,
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
  final String? playlistname;

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

    return SizedBox(
      height: 100,
      child: (widget.homeUI)
          ? SwipeActionCell(
              backgroundColor: Colors.transparent,
              selectedForegroundColor: Colors.black.withAlpha(30),
              // controller: controller,
              key: ValueKey([widget.index]),
              index: widget.index,
              trailingActions: [
                SwipeAction(
                  color: theamcoloryellow,
                  title: Liked.isThisFavourite(
                      id: widget.songList[widget.index].id),
                  // nestedAction: SwipeNestedAction(title: "Done"),
                  onTap: (handler) async {
                    await handler(false);
                    Liked.addsongtolikesongs(
                      context: context,
                      songID: widget.songList[widget.index].id,
                    );

                    // await handler(true);

                    // list.removeAt(index);
                    setState(() {});
                  },
                ),
                SwipeAction(
                    title: "Playlist",
                    color: Colors.grey,
                    onTap: (handler) {
                      Librarybotomsheetfunction(
                          ctx: context,
                          songId: widget.songList[widget.index].id);
                    },
                    nestedAction: SwipeNestedAction(title: "Liked"),
                    backgroundRadius: 20),
              ],
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => NowPlaying(
                            audioPlayer: widget.audioPlayer,
                            songList: widget.songList,
                            index: widget.index,
                          ))));
                },
                child: ListTile(
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
                      const SizedBox(
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: theamcoloryellow,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : SwipeActionCell(
              backgroundColor: Colors.transparent,
              selectedForegroundColor: Colors.black.withAlpha(30),
              controller: controller,
              key: ValueKey([widget.index]),
              index: widget.index,
              trailingActions: [
                SwipeAction(
                  color: theamcoloryellow,
                  title: Liked.isThisFavourite(
                      id: widget.songList[widget.index].id),
                  // nestedAction: SwipeNestedAction(title: "Done"),
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
                      Librarybotomsheetfunction(
                          ctx: context,
                          songId: widget.songList[widget.index].id);
                    },
                    nestedAction: SwipeNestedAction(title: "Liked"),
                    backgroundRadius: 20),
              ],
              leadingActions: [
                SwipeAction(
                    title: "Delete",
                    onTap: (handler) async {
                      await handler(true);
                      playlist.deleteplaylist(
                          playlistname: widget.playlistname!,
                          songid: widget.songList[widget.index].id);
                      setState(() {});
                    }),
              ],
              child: ListTile(
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
                    const SizedBox(
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
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: theamcoloryellow,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

//botom modal sheet

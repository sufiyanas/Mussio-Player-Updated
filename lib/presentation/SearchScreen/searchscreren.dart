import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/application/SearchScreen/search_screen_bloc.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/widgets/all_songs_list.dart';
import 'package:music_player/widgets/appbarrow.dart';
import '../../db/functions/db_functions.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  //search function start
  Box<AllSongs> songBox = Hive.box<AllSongs>('Allsongs');
  List<AllSongs>? foundedsongs;
  List<AllSongs>? allSongsList;
  TextEditingController enterddata = TextEditingController();

  void initStatefunction() {
    allSongsList = songBox.values.toList().cast<AllSongs>();
    foundedsongs = List<AllSongs>.from(allSongsList!);
  }

  void filterthesong(String enterdkeyword, BuildContext context) {
    List<AllSongs> resultlist = [];
    if (enterdkeyword.isEmpty) {
      resultlist = allSongsList!;
    } else {
      resultlist = allSongsList!
          .where((user) =>
              user.songname.toLowerCase().contains(enterdkeyword.toLowerCase()))
          .toList();
    }
    BlocProvider.of<SearchScreenBloc>(context)
        .add(SearchSongList(searchSongsList: resultlist));
  }

  //search function End

  //TextEditingController? controller;

  Box<List> librarybox = getlibrarybox();
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  @override
  Widget build(BuildContext context) {
    initStatefunction();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: customSearchscreengradient(
        childwidget: SafeArea(
          child: Column(
            children: [
              appbarRow(
                  leadingWidget: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: theamcoloryellow,
                      )),
                  trailingWidget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: theamcoloryellow,
                      ))),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: TextField(
                  onChanged: (value) => filterthesong(value, context),
                  controller: enterddata,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 211, 200, 200),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Search the song here",
                    labelStyle: const TextStyle(color: Colors.brown),
                    prefixIcon: Icon(
                      Icons.search,
                      color: theamcoloryellow,
                    ),
                  ),
                ),
              ),

              //Bloc Builder
              Expanded(
                child: BlocBuilder<SearchScreenBloc, SearchScreenState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemBuilder: (context, index) => InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: AllSongsList(
                          homeUI: true,
                          audioPlayer: audioPlayer,
                          index: index,
                          songList: state.searchedSongList,
                        ),
                      ),
                      itemCount: state.searchedSongList.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';
part 'home_screen_bloc.freezed.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState.initial()) {
    Box<List> playlistBox = getlibrarybox();
    on<Initialise>((event, emit) {
      emit(HomeScreenState(allsongs: state.allsongs, library: state.library));
    });

    on<LibrarySongs>((event, emit) {
      List<String> Keys = playlistBox.keys.toList().cast<String>();
      Keys.removeWhere((element) => element.contains('Likedsong'));
      Keys.removeWhere((element) => element.contains('Recent'));
      Keys.removeWhere((element) => element.contains('Mostplayed'));
      emit(
        HomeScreenState(
          allsongs: state.allsongs,
          library: Keys,
        ),
      );
    });
  }
}

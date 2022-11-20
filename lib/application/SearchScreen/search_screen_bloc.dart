import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';

part 'search_screen_event.dart';
part 'search_screen_state.dart';
part 'search_screen_bloc.freezed.dart';

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  SearchScreenBloc() : super(SearchScreenState.initial()) {
    on<SearchSongList>((event, emit) {
      emit(SearchScreenState(searchedSongList: event.searchSongsList));
    });
  }
}

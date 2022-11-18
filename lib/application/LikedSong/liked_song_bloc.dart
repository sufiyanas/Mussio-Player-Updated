import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/db/functions/db_functions.dart';
import 'package:music_player/db/songs.dart';

part 'liked_song_event.dart';
part 'liked_song_state.dart';
part 'liked_song_bloc.freezed.dart';

class LikedSongBloc extends Bloc<LikedSongEvent, LikedSongState> {
  LikedSongBloc() : super(LikedSongState.initial()) {
    Box<List> playlistBox = getlibrarybox();
    on<CurrentSongListInFAV>((event, emit) {
      emit(LikedSongState(
          likedsong: playlistBox.get('Likedsong')!.toList().cast()));
    });
  }
}

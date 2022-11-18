part of 'liked_song_bloc.dart';

@freezed
class LikedSongState with _$LikedSongState {
  const factory LikedSongState({
    required List<AllSongs> likedsong,
  }) = _LikedSongState;

  factory LikedSongState.initial() {
    Box<List> playlistBox = getlibrarybox();
    final List<AllSongs> initialSongList =
        playlistBox.get('Likedsong')!.toList().cast();

    return LikedSongState(likedsong: initialSongList);
  }
}

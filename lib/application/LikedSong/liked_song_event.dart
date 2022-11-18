part of 'liked_song_bloc.dart';

@freezed
class LikedSongEvent with _$LikedSongEvent {
  const factory LikedSongEvent.currentSongListLiked() = CurrentSongListInFAV;
}

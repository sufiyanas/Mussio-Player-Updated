part of 'search_screen_bloc.dart';

@freezed
class SearchScreenState with _$SearchScreenState {
  const factory SearchScreenState({
    required List<AllSongs> searchedSongList,
  }) = _SearchScreenState;

  factory SearchScreenState.initial() {
    Box<AllSongs> allsongBox = getSongBox();
    final List<AllSongs> allsongsList = allsongBox.values.toList();
    return SearchScreenState(searchedSongList: allsongsList);
  }
}

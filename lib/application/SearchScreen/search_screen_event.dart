part of 'search_screen_bloc.dart';

@freezed
class SearchScreenEvent with _$SearchScreenEvent {
  const factory SearchScreenEvent.searchSongList(
      {required List<AllSongs> searchSongsList}) = SearchSongList;
}
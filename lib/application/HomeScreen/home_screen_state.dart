part of 'home_screen_bloc.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    required List<AllSongs> allsongs,
    required List<String> library,
  }) = _HomeScreenState;

  factory HomeScreenState.initial() {
    Box<AllSongs> allsongsBox = getSongBox();
    Box<List> playlistBox = getlibrarybox();
    final List<AllSongs> allsongslist = allsongsBox.values.toList();
    List<String> Keys = playlistBox.keys.toList().cast<String>();
    Keys.removeWhere((element) => element.contains('Likedsong'));
    Keys.removeWhere((element) => element.contains('Recent'));
    Keys.removeWhere((element) => element.contains('Mostplayed'));
    return HomeScreenState(
      allsongs: allsongslist,
      library: Keys,
    );
  }
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchScreenEvent {
  List<AllSongs> get searchSongsList => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<AllSongs> searchSongsList) searchSongList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<AllSongs> searchSongsList)? searchSongList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<AllSongs> searchSongsList)? searchSongList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchSongList value) searchSongList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchSongList value)? searchSongList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchSongList value)? searchSongList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchScreenEventCopyWith<SearchScreenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchScreenEventCopyWith<$Res> {
  factory $SearchScreenEventCopyWith(
          SearchScreenEvent value, $Res Function(SearchScreenEvent) then) =
      _$SearchScreenEventCopyWithImpl<$Res, SearchScreenEvent>;
  @useResult
  $Res call({List<AllSongs> searchSongsList});
}

/// @nodoc
class _$SearchScreenEventCopyWithImpl<$Res, $Val extends SearchScreenEvent>
    implements $SearchScreenEventCopyWith<$Res> {
  _$SearchScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchSongsList = null,
  }) {
    return _then(_value.copyWith(
      searchSongsList: null == searchSongsList
          ? _value.searchSongsList
          : searchSongsList // ignore: cast_nullable_to_non_nullable
              as List<AllSongs>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchSongListCopyWith<$Res>
    implements $SearchScreenEventCopyWith<$Res> {
  factory _$$SearchSongListCopyWith(
          _$SearchSongList value, $Res Function(_$SearchSongList) then) =
      __$$SearchSongListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AllSongs> searchSongsList});
}

/// @nodoc
class __$$SearchSongListCopyWithImpl<$Res>
    extends _$SearchScreenEventCopyWithImpl<$Res, _$SearchSongList>
    implements _$$SearchSongListCopyWith<$Res> {
  __$$SearchSongListCopyWithImpl(
      _$SearchSongList _value, $Res Function(_$SearchSongList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchSongsList = null,
  }) {
    return _then(_$SearchSongList(
      searchSongsList: null == searchSongsList
          ? _value._searchSongsList
          : searchSongsList // ignore: cast_nullable_to_non_nullable
              as List<AllSongs>,
    ));
  }
}

/// @nodoc

class _$SearchSongList implements SearchSongList {
  const _$SearchSongList({required final List<AllSongs> searchSongsList})
      : _searchSongsList = searchSongsList;

  final List<AllSongs> _searchSongsList;
  @override
  List<AllSongs> get searchSongsList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchSongsList);
  }

  @override
  String toString() {
    return 'SearchScreenEvent.searchSongList(searchSongsList: $searchSongsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSongList &&
            const DeepCollectionEquality()
                .equals(other._searchSongsList, _searchSongsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchSongsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSongListCopyWith<_$SearchSongList> get copyWith =>
      __$$SearchSongListCopyWithImpl<_$SearchSongList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<AllSongs> searchSongsList) searchSongList,
  }) {
    return searchSongList(searchSongsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<AllSongs> searchSongsList)? searchSongList,
  }) {
    return searchSongList?.call(searchSongsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<AllSongs> searchSongsList)? searchSongList,
    required TResult orElse(),
  }) {
    if (searchSongList != null) {
      return searchSongList(searchSongsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchSongList value) searchSongList,
  }) {
    return searchSongList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchSongList value)? searchSongList,
  }) {
    return searchSongList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchSongList value)? searchSongList,
    required TResult orElse(),
  }) {
    if (searchSongList != null) {
      return searchSongList(this);
    }
    return orElse();
  }
}

abstract class SearchSongList implements SearchScreenEvent {
  const factory SearchSongList(
      {required final List<AllSongs> searchSongsList}) = _$SearchSongList;

  @override
  List<AllSongs> get searchSongsList;
  @override
  @JsonKey(ignore: true)
  _$$SearchSongListCopyWith<_$SearchSongList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchScreenState {
  List<AllSongs> get searchedSongList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchScreenStateCopyWith<SearchScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchScreenStateCopyWith<$Res> {
  factory $SearchScreenStateCopyWith(
          SearchScreenState value, $Res Function(SearchScreenState) then) =
      _$SearchScreenStateCopyWithImpl<$Res, SearchScreenState>;
  @useResult
  $Res call({List<AllSongs> searchedSongList});
}

/// @nodoc
class _$SearchScreenStateCopyWithImpl<$Res, $Val extends SearchScreenState>
    implements $SearchScreenStateCopyWith<$Res> {
  _$SearchScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchedSongList = null,
  }) {
    return _then(_value.copyWith(
      searchedSongList: null == searchedSongList
          ? _value.searchedSongList
          : searchedSongList // ignore: cast_nullable_to_non_nullable
              as List<AllSongs>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchScreenStateCopyWith<$Res>
    implements $SearchScreenStateCopyWith<$Res> {
  factory _$$_SearchScreenStateCopyWith(_$_SearchScreenState value,
          $Res Function(_$_SearchScreenState) then) =
      __$$_SearchScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AllSongs> searchedSongList});
}

/// @nodoc
class __$$_SearchScreenStateCopyWithImpl<$Res>
    extends _$SearchScreenStateCopyWithImpl<$Res, _$_SearchScreenState>
    implements _$$_SearchScreenStateCopyWith<$Res> {
  __$$_SearchScreenStateCopyWithImpl(
      _$_SearchScreenState _value, $Res Function(_$_SearchScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchedSongList = null,
  }) {
    return _then(_$_SearchScreenState(
      searchedSongList: null == searchedSongList
          ? _value._searchedSongList
          : searchedSongList // ignore: cast_nullable_to_non_nullable
              as List<AllSongs>,
    ));
  }
}

/// @nodoc

class _$_SearchScreenState implements _SearchScreenState {
  const _$_SearchScreenState({required final List<AllSongs> searchedSongList})
      : _searchedSongList = searchedSongList;

  final List<AllSongs> _searchedSongList;
  @override
  List<AllSongs> get searchedSongList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedSongList);
  }

  @override
  String toString() {
    return 'SearchScreenState(searchedSongList: $searchedSongList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchScreenState &&
            const DeepCollectionEquality()
                .equals(other._searchedSongList, _searchedSongList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchedSongList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchScreenStateCopyWith<_$_SearchScreenState> get copyWith =>
      __$$_SearchScreenStateCopyWithImpl<_$_SearchScreenState>(
          this, _$identity);
}

abstract class _SearchScreenState implements SearchScreenState {
  const factory _SearchScreenState(
      {required final List<AllSongs> searchedSongList}) = _$_SearchScreenState;

  @override
  List<AllSongs> get searchedSongList;
  @override
  @JsonKey(ignore: true)
  _$$_SearchScreenStateCopyWith<_$_SearchScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

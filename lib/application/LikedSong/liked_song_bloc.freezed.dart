// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'liked_song_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LikedSongEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() currentSongListLiked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? currentSongListLiked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? currentSongListLiked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentSongListInFAV value) currentSongListLiked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentSongListInFAV value)? currentSongListLiked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentSongListInFAV value)? currentSongListLiked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedSongEventCopyWith<$Res> {
  factory $LikedSongEventCopyWith(
          LikedSongEvent value, $Res Function(LikedSongEvent) then) =
      _$LikedSongEventCopyWithImpl<$Res, LikedSongEvent>;
}

/// @nodoc
class _$LikedSongEventCopyWithImpl<$Res, $Val extends LikedSongEvent>
    implements $LikedSongEventCopyWith<$Res> {
  _$LikedSongEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CurrentSongListInFAVCopyWith<$Res> {
  factory _$$CurrentSongListInFAVCopyWith(_$CurrentSongListInFAV value,
          $Res Function(_$CurrentSongListInFAV) then) =
      __$$CurrentSongListInFAVCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CurrentSongListInFAVCopyWithImpl<$Res>
    extends _$LikedSongEventCopyWithImpl<$Res, _$CurrentSongListInFAV>
    implements _$$CurrentSongListInFAVCopyWith<$Res> {
  __$$CurrentSongListInFAVCopyWithImpl(_$CurrentSongListInFAV _value,
      $Res Function(_$CurrentSongListInFAV) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CurrentSongListInFAV implements CurrentSongListInFAV {
  const _$CurrentSongListInFAV();

  @override
  String toString() {
    return 'LikedSongEvent.currentSongListLiked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CurrentSongListInFAV);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() currentSongListLiked,
  }) {
    return currentSongListLiked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? currentSongListLiked,
  }) {
    return currentSongListLiked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? currentSongListLiked,
    required TResult orElse(),
  }) {
    if (currentSongListLiked != null) {
      return currentSongListLiked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentSongListInFAV value) currentSongListLiked,
  }) {
    return currentSongListLiked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentSongListInFAV value)? currentSongListLiked,
  }) {
    return currentSongListLiked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentSongListInFAV value)? currentSongListLiked,
    required TResult orElse(),
  }) {
    if (currentSongListLiked != null) {
      return currentSongListLiked(this);
    }
    return orElse();
  }
}

abstract class CurrentSongListInFAV implements LikedSongEvent {
  const factory CurrentSongListInFAV() = _$CurrentSongListInFAV;
}

/// @nodoc
mixin _$LikedSongState {
  List<AllSongs> get likedsong => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikedSongStateCopyWith<LikedSongState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedSongStateCopyWith<$Res> {
  factory $LikedSongStateCopyWith(
          LikedSongState value, $Res Function(LikedSongState) then) =
      _$LikedSongStateCopyWithImpl<$Res, LikedSongState>;
  @useResult
  $Res call({List<AllSongs> likedsong});
}

/// @nodoc
class _$LikedSongStateCopyWithImpl<$Res, $Val extends LikedSongState>
    implements $LikedSongStateCopyWith<$Res> {
  _$LikedSongStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedsong = null,
  }) {
    return _then(_value.copyWith(
      likedsong: null == likedsong
          ? _value.likedsong
          : likedsong // ignore: cast_nullable_to_non_nullable
              as List<AllSongs>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikedSongStateCopyWith<$Res>
    implements $LikedSongStateCopyWith<$Res> {
  factory _$$_LikedSongStateCopyWith(
          _$_LikedSongState value, $Res Function(_$_LikedSongState) then) =
      __$$_LikedSongStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AllSongs> likedsong});
}

/// @nodoc
class __$$_LikedSongStateCopyWithImpl<$Res>
    extends _$LikedSongStateCopyWithImpl<$Res, _$_LikedSongState>
    implements _$$_LikedSongStateCopyWith<$Res> {
  __$$_LikedSongStateCopyWithImpl(
      _$_LikedSongState _value, $Res Function(_$_LikedSongState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedsong = null,
  }) {
    return _then(_$_LikedSongState(
      likedsong: null == likedsong
          ? _value._likedsong
          : likedsong // ignore: cast_nullable_to_non_nullable
              as List<AllSongs>,
    ));
  }
}

/// @nodoc

class _$_LikedSongState implements _LikedSongState {
  const _$_LikedSongState({required final List<AllSongs> likedsong})
      : _likedsong = likedsong;

  final List<AllSongs> _likedsong;
  @override
  List<AllSongs> get likedsong {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedsong);
  }

  @override
  String toString() {
    return 'LikedSongState(likedsong: $likedsong)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikedSongState &&
            const DeepCollectionEquality()
                .equals(other._likedsong, _likedsong));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_likedsong));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikedSongStateCopyWith<_$_LikedSongState> get copyWith =>
      __$$_LikedSongStateCopyWithImpl<_$_LikedSongState>(this, _$identity);
}

abstract class _LikedSongState implements LikedSongState {
  const factory _LikedSongState({required final List<AllSongs> likedsong}) =
      _$_LikedSongState;

  @override
  List<AllSongs> get likedsong;
  @override
  @JsonKey(ignore: true)
  _$$_LikedSongStateCopyWith<_$_LikedSongState> get copyWith =>
      throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllSongsAdapter extends TypeAdapter<AllSongs> {
  @override
  final int typeId = 0;

  @override
  AllSongs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllSongs(
      path: fields[0] as String,
      id: fields[1] as String,
      songname: fields[2] as String,
      songartist: fields[3] as String,
      count: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AllSongs obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.path)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.songname)
      ..writeByte(3)
      ..write(obj.songartist)
      ..writeByte(4)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllSongsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

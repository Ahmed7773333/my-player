// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicDbAdapter extends TypeAdapter<MusicDb> {
  @override
  final int typeId = HiveTypes.videoDb;

  @override
  MusicDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MusicDb(
      path: fields[MusicDbFields.path] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MusicDb obj) {
    writer
      ..writeByte(1)
      ..writeByte(MusicDbFields.path)
      ..write(obj.path);
  }
}

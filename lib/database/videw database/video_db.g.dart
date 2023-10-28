// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoDbTypeAdapter extends TypeAdapter<VideoDb> {
  @override
  final int typeId = HiveTypes.videoDb;

  @override
  VideoDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoDb(
      path: fields[VideoDbFields.path] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VideoDb obj) {
    writer
      ..writeByte(1)
      ..writeByte(VideoDbFields.path)
      ..write(obj.path);
  }
}

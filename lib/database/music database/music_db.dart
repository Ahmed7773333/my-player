import 'package:hive/hive.dart';
import 'package:my_player_app/hive_helper/hive_types.dart';
import 'package:my_player_app/hive_helper/hive_adapters.dart';
import 'package:my_player_app/hive_helper/fields/music_db_fields.dart';

part 'music_db.g.dart';

@HiveType(typeId: HiveTypes.musicDb, adapterName: HiveAdapters.musicDb)
class MusicDb extends HiveObject {
  MusicDb({required this.path});
  @HiveField(MusicDbFields.path)
  String path;
}

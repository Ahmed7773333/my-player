import 'package:hive/hive.dart';
import 'package:my_player_app/hive_helper/hive_types.dart';
import 'package:my_player_app/hive_helper/hive_adapters.dart';
import 'package:my_player_app/hive_helper/fields/video_db_fields.dart';

part 'video_db.g.dart';

@HiveType(typeId: HiveTypes.videoDb, adapterName: HiveAdapters.videoDb)
class VideoDb extends HiveObject {
  VideoDb({required this.path});
  @HiveField(VideoDbFields.path)
  String path;
}

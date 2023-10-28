import 'package:hive/hive.dart';
import 'package:my_player_app/database/videw%20database/video_db.dart';
import 'package:my_player_app/database/music%20database/music_db.dart';

void registerAdapters() {
  Hive.registerAdapter(VideoDbTypeAdapter());
  Hive.registerAdapter(MusicDbAdapter());
}

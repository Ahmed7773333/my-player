import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_player_app/database/videw%20database/video_db.dart';

class VideoHelper {
  static const String boxName = 'videoBox';

  static add(VideoDb category) {
    Box<VideoDb> categoryBox = Hive.box(boxName);
    categoryBox.add(category);
  }

  static List<VideoDb> getAll() {
    Box<VideoDb> categoryBox = Hive.box(boxName);
    return categoryBox.values.toList().cast<VideoDb>();
  }

  static VideoDb? getById(int id) {
    Box<VideoDb> categoryBox = Hive.box(boxName);
    return categoryBox.getAt(id);
  }

  static delete(int id) {
    Box<VideoDb> categoryBox = Hive.box(boxName);
    categoryBox.deleteAt(id);
  }

  static cler() {
    Box<VideoDb> categoryBox = Hive.box(boxName);
    categoryBox.clear();
  }
}

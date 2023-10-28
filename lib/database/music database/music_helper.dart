import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_player_app/database/music%20database/music_db.dart';

class MusicHelper {
  static const String boxName = 'musicBox';

  static add(MusicDb category) {
    Box<MusicDb> categoryBox = Hive.box(boxName);
    categoryBox.add(category);
  }

  static List<MusicDb> getAll() {
    Box<MusicDb> categoryBox = Hive.box(boxName);
    return categoryBox.values.toList().cast<MusicDb>();
  }

  static MusicDb? getById(int id) {
    Box<MusicDb> categoryBox = Hive.box(boxName);
    return categoryBox.getAt(id);
  }

  static delete(int id) {
    Box<MusicDb> categoryBox = Hive.box(boxName);
    categoryBox.deleteAt(id);
  }

  static cler() {
    Box<MusicDb> categoryBox = Hive.box(boxName);
    categoryBox.clear();
  }
}

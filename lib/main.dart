import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart' as hive;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_player_app/database/videw%20database/video_db.dart';
import 'package:my_player_app/database/videw%20database/video_helper.dart';
import 'package:path_provider/path_provider.dart';

import 'config/themes.dart';
import 'home_layout.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  hive.Hive.init(directory.path);
  Hive.registerAdapter(VideoDbTypeAdapter());
  await Hive.openBox<VideoDb>(VideoHelper.boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        // localizationsDelegates: AppLocalizations.localizationsDelegates,
        // supportedLocales: AppLocalizations.supportedLocales,
        // locale: languagePro.locale,

        debugShowCheckedModeBanner: false,
        theme: mode,
        initialRoute: HomeLayout.routeName,
        routes: {
          HomeLayout.routeName: (conext) => const HomeLayout(),
        },
      ),
    );
  }
}

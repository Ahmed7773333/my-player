import 'package:flutter/material.dart';
import 'package:my_player_app/utils/styles.dart';

import '../utils/app_colors.dart';

ThemeData mode = ThemeData(
  scaffoldBackgroundColor: scafoldColor,
  appBarTheme: const AppBarTheme(
      centerTitle: true, elevation: 0, color: Colors.transparent),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    showSelectedLabels: true,
    showUnselectedLabels: true,
    unselectedLabelStyle: lableStyle,
    selectedIconTheme: const IconThemeData(size: 24),
    unselectedIconTheme: const IconThemeData(size: 24),
    backgroundColor: navigationBarColor,
    selectedItemColor: goldColor,
    unselectedItemColor: greyColor,
    type: BottomNavigationBarType.fixed,
  ),
);

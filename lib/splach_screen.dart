import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_player_app/home_layout.dart';
import 'package:my_player_app/utils/app_colors.dart';

import 'utils/assets.dart';

class SplachScreen extends StatelessWidget {
  static const String routeName = '/splach';
  const SplachScreen({super.key});

  Future<void> _navigateToHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed(HomeLayout.routeName);
  }

  @override
  Widget build(BuildContext context) {
    _navigateToHome(context);

    return Scaffold(
      backgroundColor: goldColor,
      body: Center(
        child: SizedBox(
          height: 187.h,
          width: 168.w,
          child: Image.asset(
            logo,
            height: 187.h,
            width: 187.w,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

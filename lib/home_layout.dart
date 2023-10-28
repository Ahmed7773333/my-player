import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_player_app/database/videw%20database/video_db.dart';
import 'package:my_player_app/database/videw%20database/video_helper.dart';
import 'package:my_player_app/tabs/audio.dart';
import 'package:my_player_app/tabs/video.dart';
import 'package:my_player_app/utils/styles.dart';

import 'utils/app_colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  static const String routeName = "BottomBar";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final List<Widget> _pages = [
    const VideoTab(),
    const AudioTab(),
  ];

  int _currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  GlobalKey<FormState> sideTaskKey = GlobalKey<FormState>();
  Future pickVideoGallery() async {
    final returnedImage =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      final path = File(returnedImage.path).path;
      VideoDb v = VideoDb(path: path);
      VideoHelper.add(v);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TabIcon(
                icon: Icons.video_collection,
                text: 'Video',
                onPressed: () => _navigateToTab(0)),
            const SizedBox(),
            TabIcon(
                icon: Icons.multitrack_audio_outlined,
                text: 'Audio',
                onPressed: () => _navigateToTab(1)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        animatedIconTheme: const IconThemeData(size: 22.0),
        buttonSize: Size(64.w, 64.h),
        spaceBetweenChildren: 10.h,
        overlayColor: Colors.transparent,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add),
            backgroundColor:
                Theme.of(context).floatingActionButtonTheme.backgroundColor,
            labelWidget: Text(
              'Video',
              style: titleStyle,
            ),
            onTap: () {
              pickVideoGallery().then((value) => setState(() {}));
            },
          ),
          SpeedDialChild(
            backgroundColor: greyColor,
            child: const Icon(Icons.add),
            labelWidget: Text(
              'Audio',
              style: titleStyle,
            ),
            onTap: () {},
          ),
          // Add more SpeedDialChild widgets for additional actions
        ],
      ),
    );
  }

  void _navigateToTab(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}

class TabIcon extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onPressed;
  const TabIcon(
      {this.icon, required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final iconSize = 24.sp;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            icon,
            size: iconSize,
            color: goldColor,
          ),
          onPressed: () {
            onPressed();
          },
        ),
        Text(
          text,
          style: lableStyle,
        )
      ],
    );
  }
}

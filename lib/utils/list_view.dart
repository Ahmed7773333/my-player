// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_player_app/database/videw%20database/video_helper.dart';
import 'package:my_player_app/screens/video_player.dart';
import 'package:my_player_app/utils/assets.dart';
import 'package:my_player_app/utils/open_container.dart';
import 'package:my_player_app/utils/styles.dart';

class VideoInfo {
  String titless;
  String time;
  VideoInfo({
    required this.titless,
    required this.time,
  });
}

// ignore: must_be_immutable
class CustomlListView extends StatefulWidget {
  const CustomlListView({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomlListView> createState() => _CustomlListViewState();
}

class _CustomlListViewState extends State<CustomlListView> {
  List<VideoInfo> videoInfoList = [];

  Future<void> fetchVideoInfo() async {
    final allVideos = VideoHelper.getAll();
    final infoList = <VideoInfo>[];

    for (final video in allVideos) {
      String ti = video.path.split('/').last;
      final videoInfo = VideoInfo(
        titless: ti,
        time: '10:10',
      );
      infoList.add(videoInfo);
    }

    setState(() {
      videoInfoList = infoList;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchVideoInfo();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoInfoList.length,
      itemBuilder: (context, index) {
        final videoInfo = videoInfoList[index];

        return OpenContainers(
          closedWidget: Card(
            elevation: 10,
            color: Colors.white,
            shadowColor: Colors.grey[300],
            child: ListTile(
              leading: Stack(
                children: [
                  Image.asset(logo, height: 90.h, width: 120.w),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Text(
                      videoInfo.time,
                      style: lableStyle.copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
              title: Text(
                videoInfo.titless,
                style: titleStyle.copyWith(color: Colors.black),
              ),
              trailing: InkWell(
                onTap: () {
                  setState(() {
                    VideoHelper.delete(index);
                  });
                },
                child: Icon(
                  Icons.delete,
                  size: 25.sp,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          openedWidget: VideoPlayers4(
            path: VideoHelper.getAll()[index].path,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_player_app/utils/list_view.dart';

class VideoTab extends StatelessWidget {
  const VideoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomlListView());
  }
}

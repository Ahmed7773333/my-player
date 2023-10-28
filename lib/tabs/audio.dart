import 'package:flutter/material.dart';
import 'package:my_player_app/utils/styles.dart';

class AudioTab extends StatelessWidget {
  const AudioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'AudioTab',
          style: titleStyle,
        ),
      ),
    );
  }
}

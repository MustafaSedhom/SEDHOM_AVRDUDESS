import 'package:flutter/material.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';
import 'package:sedhom_redesgin_avrdude/containers/Basic_container.dart';
import 'package:sedhom_redesgin_avrdude/Resbonseive/screen_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenArea.init(context);
    return Scaffold(
      backgroundColor: APPColors.app_background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "SEDHOM AVRDUDESS",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: APPColors.Blue_color_basic,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BasicContainer(width: ScreenArea.Width * 0.4, height:ScreenArea.Height *0.5),
              BasicContainer(width: ScreenArea.Width * 0.4, height: ScreenArea.Height *0.5),
            ],
          ),
        ],
      ),
    );
  }
}

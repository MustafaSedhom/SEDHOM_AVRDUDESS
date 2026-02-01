import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(10),
            // sedhom avrdude text
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
            Gap(10),
            // 1 and 2 containers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [BasicContainer(), BasicContainer()],
            ),
            // 3 and 4 containers
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [BasicContainer(), BasicContainer()],
            ),
            // 5 and 6 containers
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [BasicContainer(), BasicContainer()],
            ),
            // buttons
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SecondContainer(
                  title: "Stop",
                  titleColor: APPColors.stop_word_color,
                ),
                SecondContainer(
                  title: "Program !",
                  titleColor: APPColors.Blue_color_basic,
                ),
              ],
            ),
            // commands argument
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Gap(4),
                Text(
                  "Additional command line arguments",
                  style: TextStyle(
                    color: APPColors.container_title,
                    fontSize: 16,
                  ),
                ),
                Gap(10),
                Container(
                  width: ScreenArea.Width * 0.63,
                  height: ScreenArea.Height * 0.05,
                  decoration: BoxDecoration(
                    color: APPColors.Termianl_background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    child: Text(
                      " > -E -F",
                      style: TextStyle(
                        color: APPColors.color_green,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // commands
            Gap(5),
            Container(
              width: ScreenArea.Width * 0.95,
              height: ScreenArea.Height * 0.05,
              decoration: BoxDecoration(
                color: APPColors.Termianl_background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5,
                ),
                child: Text(
                  "avrdude -m atm328p - c asp -p USB -E -F",
                  style: TextStyle(
                    color: APPColors.command_color_pathed_by_cmd,
                  ),
                ),
              ),
            ),
            // terminal
            Gap(10),
            Container(
              width: ScreenArea.Width * 0.95,
              height: ScreenArea.Height * 0.3,
              decoration: BoxDecoration(
                color: APPColors.Termianl_background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "SEDHOM_AVRDUDE.exe run \n avrdude -m atm328p \n uploading Done >>>",
                  style: TextStyle(color: APPColors.color_green),
                ),
              ),
            ),
            Gap(40),
          ],
        ),
      ),
    );
  }
}

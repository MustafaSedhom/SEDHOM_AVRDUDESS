import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_button.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';

class McuWidget extends StatefulWidget {
  const McuWidget({super.key});

  @override
  State<McuWidget> createState() => _McuWidgetState();
}

class _McuWidgetState extends State<McuWidget> {
  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "MCU",
      short_cut: "-M",
      icon: Icons.memory_sharp,
      file_name: "Atmega 328p",
      short_cut_or_not: true,
      choose: Icons.download_for_offline_sharp,
      file_name_and_choose_icon_or_not: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gap(20),
            // flash size
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.sd_card, color: APPColors.icons_color, size: 50),
                Flexible(
                  child: Text(
                    "Flash Size  ->",
                    style: TextStyle(
                      fontSize: 30,
                      color: APPColors.color_green,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    "32 KB",
                    style: TextStyle(
                      fontSize: 30,
                      color: APPColors.Blue_color_basic,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Gap(20),
            // eeprom size
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.storage_rounded,
                  color: APPColors.icons_color,
                  size: 50,
                ),
                Flexible(
                  child: Text(
                    "EEPROM Size  ->",
                    style: TextStyle(
                      fontSize: 30,
                      color: APPColors.color_green,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    "1 KB",
                    style: TextStyle(
                      fontSize: 30,
                      color: APPColors.Blue_color_basic,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Gap(20),
            // detect button
            Center(
              child: BasicButton(
                ontap: () {},
                color: APPColors.input_field_color_in_container,
                txt: "Detect",
                color_txt: APPColors.Blue_color_basic,
                color_pressed: APPColors.color_green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

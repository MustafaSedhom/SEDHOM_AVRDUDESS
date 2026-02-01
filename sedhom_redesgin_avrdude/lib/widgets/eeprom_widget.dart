import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';

class EepromWidget extends StatelessWidget {
  const EepromWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "EEPROM",
      icon: Icons.storage,
      file_name: "Blinking_led.eep",
      short_cut_or_not: false,
      choose: Icons.download_for_offline_outlined,
      file_name_and_choose_icon_or_not: true,
      child: Gap(10),
    );
  }
}

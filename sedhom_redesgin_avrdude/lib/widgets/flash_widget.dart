import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';

class FlashWidget extends StatelessWidget {
  const FlashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "Flash",
      icon: Icons.sd_card,
      file_name: "Blinking_led.Hex",
      short_cut_or_not: false,
      choose: Icons.download_for_offline_outlined,
      file_name_and_choose_icon_or_not: true,
      child: Gap(10),
    );
  }
}

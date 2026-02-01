import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';

class FusesAndLockBitsWidget extends StatelessWidget {
  const FusesAndLockBitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "Fuses & Lock Bits",
      icon: Icons.functions_outlined,
      short_cut_or_not: false,
      file_name_and_choose_icon_or_not: false,
      child: Gap(10),
    );
  }
}

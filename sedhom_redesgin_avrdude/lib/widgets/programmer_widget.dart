import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';

class ProgrammerWidget extends StatelessWidget {
  const ProgrammerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "Programmer",
      short_cut: "-p",
      icon: Icons.computer_outlined,
      file_name: "USB asp to TTL Convertor",
      short_cut_or_not: true,
      choose: Icons.download_for_offline_sharp,
      file_name_and_choose_icon_or_not: true,
      child: Gap(10),
    );
  }
}

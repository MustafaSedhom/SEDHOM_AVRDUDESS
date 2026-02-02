import 'package:flutter/material.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_program_wodgets.dart'
    show ProgrammerOption;
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';

class ProgrammerWidget extends StatelessWidget {
  const ProgrammerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "Programmer",
      short_cut: "-p",
      icon: Icons.usb_rounded,
      file_name: "USB asp to TTL Convertor",
      short_cut_or_not: true,
      choose: Icons.download_for_offline_sharp,
      file_name_and_choose_icon_or_not: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // text and icons
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 1.2,
              children: const [
                ProgrammerOption(
                  icon: Icons.usb,
                  title: "Port",
                  shortcut: "-P",
                ),
                ProgrammerOption(
                  icon: Icons.speed_rounded,
                  title: "Baud Rate",
                  shortcut: "-b",
                ),
                ProgrammerOption(
                  icon: Icons.wallet,
                  title: "Bit Clock",
                  shortcut: "-B",
                ),
              ],
            ),

            // buttons and textfeilds
          ],
        ),
      ),
    );
  }
}

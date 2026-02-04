import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';
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
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Gap(5),
                // usb container
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: APPColors.input_field_color_in_container,
                      borderRadius: BorderRadius.circular(
                        AppBorderRaduis.border_raduis,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "USB",
                              style: GoogleFonts.alfaSlabOne(
                                color: APPColors.Blue_color_basic,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gap(5),
                          Icon(Icons.install_desktop),
                        ],
                      ),
                    ),
                  ),
                ),
                Gap(15),
                // BuadRate container
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: APPColors.input_field_color_in_container,
                      borderRadius: BorderRadius.circular(
                        AppBorderRaduis.border_raduis,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "115200",
                              style: GoogleFonts.alfaSlabOne(
                                color: APPColors.Blue_color_basic,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gap(5),
                          Icon(Icons.install_desktop),
                        ],
                      ),
                    ),
                  ),
                ),
                Gap(10),
                //Bit clock container
                Gap(10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: APPColors.input_field_color_in_container,
                      borderRadius: BorderRadius.circular(
                        AppBorderRaduis.border_raduis,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "375 KHz",
                              style: GoogleFonts.alfaSlabOne(
                                color: APPColors.Blue_color_basic,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gap(5),
                          Icon(Icons.install_desktop),
                        ],
                      ),
                    ),
                  ),
                ),
                Gap(5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

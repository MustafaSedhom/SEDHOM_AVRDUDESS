import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sedhom_redesgin_avrdude/Avr_data_base/my_data.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_button.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';
import 'package:sedhom_redesgin_avrdude/widgets/show_dialog_options_widget.dart';

class McuWidget extends StatefulWidget {
  final ValueChanged<MCU>? onMcuSelected;
  const McuWidget({super.key, this.onMcuSelected});

  @override
  State<McuWidget> createState() => _McuWidgetState();
}

class _McuWidgetState extends State<McuWidget> {
  int mcu_index = 0;
  int returned_index = 0;

  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "MCU",
      short_cut: "-M",
      icon: AppIcons.mcu_icon,
      file_name: AVRData.mcus[mcu_index].name,
      ontap: () {
        Sedhom_show_dialog(
          context: context,
          title: "MCU",
          icon: AppIcons.mcu_icon,
          items: AVRData.mcus.map((e) => e.name).toList(),
          onItemTap: (index) {
            widget.onMcuSelected?.call(AVRData.mcus[index]);
            setState(() {
              mcu_index = index;
            });
          },
        );
      },
      short_cut_or_not: true,
      choose: AppIcons.choose_icon,
      file_name_and_choose_icon_or_not: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gap(20),
            // flash size
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  AppIcons.flash_icon,
                  color: APPColors.icons_color,
                  size: 50,
                ),
                Flexible(
                  child: Text(
                    "Flash Size :",
                    style: TextStyle(
                      fontSize: 30,
                      color: APPColors.color_green,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    "${AVRData.mcus[mcu_index].flashKB.toString()} KB",
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
                  AppIcons.eeprom_icon,
                  color: APPColors.icons_color,
                  size: 50,
                ),
                Flexible(
                  child: Text(
                    "EEPROM Size :",
                    style: TextStyle(
                      fontSize: 30,
                      color: APPColors.color_green,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    "${AVRData.mcus[mcu_index].eepromKB.toString()} KB",
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
                ontap: () {
                  widget.onMcuSelected?.call(AVRData.mcus[mcu_index]);
                },
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

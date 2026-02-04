import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_button.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';
import 'package:sedhom_redesgin_avrdude/widgets/check_box_and_text.dart';
import 'package:sedhom_redesgin_avrdude/widgets/fuses_widgets.dart';

class FusesAndLockBitsWidget extends StatefulWidget {
  const FusesAndLockBitsWidget({super.key});

  @override
  State<FusesAndLockBitsWidget> createState() => _FusesAndLockBitsWidgetState();
}

class _FusesAndLockBitsWidgetState extends State<FusesAndLockBitsWidget> {
  final lFuse = TextEditingController();

  final hFuse = TextEditingController();

  final eFuse = TextEditingController();

  final lbFuse = TextEditingController();

  Map<String, bool> options = {"Set Fuses": false, "Set Locks": false};
  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "Fuses & Lock Bits",
      icon: Icons.lock,
      short_cut_or_not: false,
      file_name_and_choose_icon_or_not: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FuseInputRow(label: 'L', controller: lFuse),
                    Gap(20),
                    FuseInputRow(label: 'H', controller: hFuse),
                    Gap(20),
                    FuseInputRow(label: 'B', controller: eFuse),
                    Gap(20),
                    FuseInputRow(label: 'LB', controller: lbFuse),
                  ],
                ),
              ),
              // Gap(20),
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BasicButton(
                          ontap: () {},
                          color: APPColors.input_field_color_in_container,
                          txt: "Read",
                          color_txt: APPColors.Blue_color_basic,
                          color_pressed: APPColors.color_green,
                        ),
                        BasicButton(
                          ontap: () {},
                          color: APPColors.input_field_color_in_container,
                          txt: "Write",
                          color_txt: APPColors.Blue_color_basic,
                          color_pressed: APPColors.color_green,
                        ),
                      ],
                    ),
                    Gap(30),
                    CheckBoxAndText(map: options, keyName: "Set Fuses"),
                    Gap(30),
                    CheckBoxAndText(map: options, keyName: "Set Locks"),
                    Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BasicButton(
                          ontap: () {},
                          color: APPColors.input_field_color_in_container,
                          txt: "Read",
                          color_txt: APPColors.Blue_color_basic,
                          color_pressed: APPColors.color_green,
                        ),
                        BasicButton(
                          ontap: () {},
                          color: APPColors.input_field_color_in_container,
                          txt: "Write",
                          color_txt: APPColors.Blue_color_basic,
                          color_pressed: APPColors.color_green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

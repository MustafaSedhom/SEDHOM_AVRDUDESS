import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_button.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';
import 'package:sedhom_redesgin_avrdude/widgets/check_box_and_text.dart';
import 'package:sedhom_redesgin_avrdude/widgets/fuses_widgets.dart';

class FusesAndLockBitsWidget extends StatefulWidget {
  final ValueChanged<String>? L_fuse_changed;
  final ValueChanged<String>? H_fuse_changed;
  final ValueChanged<String>? E_fuse_changed;
  final ValueChanged<String>? LB_fuse_changed;
  final ValueChanged<String>? set_fuse_changed;
  final ValueChanged<String>? set_lock_read;
  const FusesAndLockBitsWidget({
    super.key,
    this.L_fuse_changed,
    this.H_fuse_changed,
    this.E_fuse_changed,
    this.LB_fuse_changed,
    this.set_fuse_changed,
    this.set_lock_read,
  });

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
      icon: AppIcons.fuse_icon,
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
                    FuseInputRow(label: 'E', controller: eFuse),
                    Gap(20),
                    FuseInputRow(label: 'LB', controller: lbFuse),
                  ],
                ),
              ),
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Read and Write buttons for L fuse
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BasicButton(
                          ontap: () {
                            widget.L_fuse_changed?.call(lFuse.text);
                          },
                          color: APPColors.input_field_color_in_container,
                          txt: "Read",
                          color_txt: APPColors.Blue_color_basic,
                          color_pressed: APPColors.color_green,
                        ),
                        BasicButton(
                          ontap: () {
                            widget.L_fuse_changed?.call(lFuse.text);
                          },
                          color: APPColors.input_field_color_in_container,
                          txt: "Write",
                          color_txt: APPColors.Blue_color_basic,
                          color_pressed: APPColors.color_green,
                        ),
                      ],
                    ),
                    Gap(30),
                    // check box and text for H fuse
                    CheckBoxAndText(
                      map: options,
                      keyName: "Set Fuses",
                      func_do: () {
                        widget.H_fuse_changed?.call(hFuse.text);
                        widget.set_fuse_changed?.call(
                          options["Set Fuses"] == true ? hFuse.text : "",
                        );
                      },
                    ),
                    Gap(30),
                    // check box and text for E fuse
                    CheckBoxAndText(
                      map: options,
                      keyName: "Set Locks",
                      func_do: () {
                        widget.E_fuse_changed?.call(eFuse.text);
                        widget.set_lock_read?.call(
                          options["Set Locks"] == true ? eFuse.text : "",
                        );
                      },
                    ),
                    Gap(30),
                    // Read and Write buttons for LB fuse
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BasicButton(
                          ontap: () {
                            widget.LB_fuse_changed?.call(lbFuse.text);
                          },
                          color: APPColors.input_field_color_in_container,
                          txt: "Read",
                          color_txt: APPColors.Blue_color_basic,
                          color_pressed: APPColors.color_green,
                        ),
                        BasicButton(
                          ontap: () {
                            widget.LB_fuse_changed?.call(lbFuse.text);
                          },
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedhom_redesgin_avrdude/Resbonseive/screen_area.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';

class FuseInputRow extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const FuseInputRow({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 35,
          child: Text(
            label,
            style: TextStyle(fontSize: 30, color: APPColors.color_green),
          ),
        ),
        const Gap(20),
        Container(
          height: 50,
          width: ScreenArea.Width * 0.15,
          decoration: BoxDecoration(
            color: APPColors.input_field_color_in_container,
            borderRadius: BorderRadius.circular(AppBorderRaduis.border_raduis),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "0xFF",
            ),
            style: GoogleFonts.aDLaMDisplay(
              fontSize: 20,
              color: APPColors.icons_color,
            ),
            cursorColor: APPColors.icons_color,
            cursorWidth: 3.5,
            textCapitalization: TextCapitalization.characters,
          ),
        ),
      ],
    );
  }
}

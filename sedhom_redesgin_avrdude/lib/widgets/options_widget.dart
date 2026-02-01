import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "Options",
      icon: Icons.functions_outlined,
      short_cut_or_not: false,
      file_name_and_choose_icon_or_not: false,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            // hintText: "Enter command",
          ),
          style: GoogleFonts.aDLaMDisplay(
            fontSize: 20,
            color: APPColors.color_green,
          ),
          showCursor: false,
        ),
      ),
    );
  }
}

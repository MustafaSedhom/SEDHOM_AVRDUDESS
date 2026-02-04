import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedhom_redesgin_avrdude/Resbonseive/screen_area.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';

class BasicContainer extends StatelessWidget {
  final Widget? child;

  const BasicContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenArea.Width * 0.46,
      height: 350,
      decoration: BoxDecoration(
        color: APPColors.container_background,
        borderRadius: BorderRadius.circular(AppBorderRaduis.border_raduis_of_basic_containers),
      ),
      child: child,
    );
  }
}

class SecondContainer extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Function()? onTap;
  const SecondContainer({
    super.key,
    required this.title,
    required this.titleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,

      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(ScreenArea.Width * 0.46, 70),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          if (states.contains(MaterialState.pressed)) {
            return APPColors.color_green;
          }
          return APPColors.input_field_color_in_container; // default
        }),
      ),
      child: Center(
        child: Expanded(
          child: Text(
            title,
            style: GoogleFonts.alfaSlabOne(color: titleColor, fontSize: 20),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}

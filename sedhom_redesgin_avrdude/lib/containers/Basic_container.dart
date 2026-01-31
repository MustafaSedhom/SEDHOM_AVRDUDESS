import 'package:flutter/material.dart';
import 'package:sedhom_redesgin_avrdude/Resbonseive/screen_area.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';

class BasicContainer extends StatelessWidget {
  final Widget? child;

  const BasicContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenArea.Width * 0.46,
      height: ScreenArea.Height * 0.2,
      decoration: BoxDecoration(
        color: APPColors.container_background,
        borderRadius: BorderRadius.circular(20),
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ScreenArea.Width * 0.46,
        height: ScreenArea.Height * 0.05,
        decoration: BoxDecoration(
          color: APPColors.input_field_color_in_container,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

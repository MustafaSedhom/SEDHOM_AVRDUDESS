import 'package:flutter/material.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';

class BasicContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;

  const BasicContainer({
    super.key,
    required this.width,
    required this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: APPColors.container_background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
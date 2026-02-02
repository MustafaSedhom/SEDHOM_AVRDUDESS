import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({
    super.key,
    required this.color,
    this.color_pressed,
    required this.txt,
    required this.color_txt,
    required this.ontap,
  });

  final Color color;
  final Color? color_pressed;
  final String txt;
  final Color color_txt;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,

      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        minimumSize: MaterialStateProperty.all(const Size(100, 50)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          if (states.contains(MaterialState.pressed)) {
            return color_pressed ?? color.withOpacity(0.7);
          }
          return color; // default
        }),
      ),
      child: Text(
        txt,
        style: TextStyle(
          color: color_txt,
          fontSize: 25,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

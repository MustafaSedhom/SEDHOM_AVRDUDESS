import 'package:flutter/material.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';

class CheckBoxAndText extends StatefulWidget {
  final Map<String, bool> map;
  final String keyName;
  final Function? func_do;

  const CheckBoxAndText({
    super.key,
    required this.map,
    required this.keyName,
    this.func_do,
  });

  @override
  State<CheckBoxAndText> createState() => _CheckBoxAndTextState();
}

class _CheckBoxAndTextState extends State<CheckBoxAndText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Transform.scale(
          scale: 2,
          child: Checkbox(
            value: widget.map[widget.keyName] ?? false,
            onChanged: (val) {
              setState(() {
                widget.map[widget.keyName] = val!;
                widget.func_do?.call();
              });
            },
            activeColor: APPColors.icons_color,
            checkColor: APPColors.input_field_color_in_container,
            side: BorderSide(
              color: (widget.map[widget.keyName] ?? false)
                  ? Colors.green
                  : APPColors.icons_color,
              width: 2,
            ),
          ),
        ),
        // Gap(30),
        Text(
          widget.keyName,
          style: TextStyle(fontSize: 30, color: APPColors.color_green),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

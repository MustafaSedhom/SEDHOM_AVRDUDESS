import 'package:flutter/material.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';

class ProgrammerOption extends StatelessWidget {
  const ProgrammerOption({
    super.key,
    required this.icon,
    required this.title,
    required this.shortcut,
  });

  final IconData icon;
  final String title;
  final String shortcut;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, color: APPColors.icons_color, size: 30),
          Flexible(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18, color: APPColors.color_green),
            ),
          ),
          Flexible(
            child: Text(
              shortcut,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 16,
                color: APPColors.short_cut_in_cmd_command,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

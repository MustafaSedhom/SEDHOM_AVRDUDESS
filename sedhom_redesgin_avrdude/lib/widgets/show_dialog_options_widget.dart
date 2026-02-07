import 'package:flutter/material.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';


Future<int?> Sedhom_show_dialog({
  required BuildContext context,
  required String title,
  required IconData icon,
  required List<String> items,
  double height = 300,
  Function(int index)? onItemTap,
}) {
  return showDialog<int>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: APPColors.input_field_color_in_container,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(color: APPColors.color_green)),
              Gap(20),
              Icon(icon, color: APPColors.color_green, size: 30),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: TextStyle(color: APPColors.stop_word_color, fontSize: 20),
            ),
          ),
        ],
        content: SizedBox(
          width: double.minPositive,
          height: height,
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: APPColors.Termianl_background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    items[index],
                    style: TextStyle(color: APPColors.Blue_color_basic),
                  ),
                  onTap: () {
                    onItemTap?.call(index); // callback
                    Navigator.pop(context, index); // return index
                  },
                );
              },
            ),
          ),
        ),
      );
    },
  );
}


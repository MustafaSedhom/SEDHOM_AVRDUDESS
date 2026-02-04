import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({super.key});

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  final Map<String, bool> options = {
    "Force": false,
    "Erase Flash and EEPROM": false,
    "Disable Verfiy": false,
    "Donot Write": false,
    "Disable Flash erase": false,
    "Donot Read": false,
  };

  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "Options",
      icon: Icons.add_circle_rounded,
      short_cut_or_not: false,
      file_name_and_choose_icon_or_not: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 500,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(
                  AppBorderRaduis.border_raduis,
                ),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final key = options.keys.elementAt(index);
                  return CheckboxListTile(
                    activeColor: APPColors.icons_color,
                    checkColor: APPColors.input_field_color_in_container,
                    checkboxScaleFactor: 2,
                    side: BorderSide(
                      color: options[key]!
                          ? Colors.green
                          : APPColors.icons_color,
                      width: 2,
                    ),
                    title: Text(
                      key,
                      style: const TextStyle(
                        fontSize: 22,
                        color: APPColors.color_green,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: options[key],
                    onChanged: (bool? value) {
                      setState(() {
                        options[key] = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
          ),
          Gap(10),
          Row(
            children: [
              Text(
                "Verbosilty",
                style: TextStyle(fontSize: 25, color: APPColors.color_green),
                overflow: TextOverflow.ellipsis,
              ),
              Gap(30),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: APPColors.input_field_color_in_container,
                    borderRadius: BorderRadius.circular(
                      AppBorderRaduis.border_raduis,
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          "Writing only",
                          style: GoogleFonts.alfaSlabOne(
                            color: APPColors.Blue_color_basic,
                            fontSize: 15,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.install_desktop),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

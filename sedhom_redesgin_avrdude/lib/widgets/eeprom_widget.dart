import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedhom_redesgin_avrdude/Avr_data_base/my_data.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_button.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';
import 'package:sedhom_redesgin_avrdude/widgets/flash_widget.dart';

class EepromWidget extends StatefulWidget {
  final ValueChanged<String>? onFlashOptionSelected;
  final ValueChanged<String>? read_write_verify_selected;
  final ValueChanged<String>? format_selected;
  const EepromWidget({
    super.key,
    this.onFlashOptionSelected,
    this.read_write_verify_selected,
    this.format_selected,
  });

  @override
  State<EepromWidget> createState() => _EepromWidgetState();
}

class _EepromWidgetState extends State<EepromWidget> {
  final Map<String, bool> options = {
    "Read": false,
    "Write": false,
    "Verify": false,
  };
  FilePickerResult? eeprom_file_from_user;
  int files_index = 0;
  int format_index = 0;
  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "EEPROM",
      icon: AppIcons.eeprom_icon,
      file_name: eeprom_file_from_user != null
          ? eeprom_file_from_user!.files.single.name
          : "choose .eep file",
      ontap: () async {
        final result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.custom,
          allowedExtensions: ['eep'],
        );

        if (result != null) {
          setState(() {
            eeprom_file_from_user = result;
          });
        }
      },
      short_cut_or_not: false,
      choose: AppIcons.upload_icon,
      file_name_and_choose_icon_or_not: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // for check boxs
            Gap(10),
            Expanded(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(
                    AppBorderRaduis.border_raduis,
                  ),
                ),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: options.keys.map((key) {
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
                        style: TextStyle(
                          fontSize: 30,
                          color: APPColors.color_green,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      value: options[key],
                      onChanged: (bool? value) {
                        setState(() {
                          options.updateAll((k, v) => false);
                          options[key] = value ?? false;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            Gap(10),
            // formates and buttons
            Expanded(
              child: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Format",
                      style: TextStyle(
                        fontSize: 30,
                        color: APPColors.color_green,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    InkWell(
                      onTap: () {
                        format_options(context, (index) {
                          setState(() {
                            format_index = index;
                          });
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: APPColors.input_field_color_in_container,
                          borderRadius: BorderRadius.circular(
                            AppBorderRaduis.border_raduis,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  FormateOptions.format_options[format_index],
                                  style: GoogleFonts.alfaSlabOne(
                                    color: APPColors.Blue_color_basic,
                                    fontSize: 15,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  AppIcons.settings_icon,
                                  color: APPColors.icons_color,
                                ),
                                onPressed: () {
                                  format_options(context, (index) {
                                    setState(() {
                                      format_index = index;
                                    });
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    BasicButton(
                      ontap: () {
                        setState(() {
                          widget.onFlashOptionSelected?.call(
                            files.flash_file_name[files_index],
                          );
                          widget.read_write_verify_selected?.call(
                            options.keys.firstWhere(
                              (k) => options[k] == true,
                              orElse: () => "none selected",
                            ),
                          );
                          widget.format_selected?.call(
                            FormateOptions.format_options[format_index],
                          );
                        });
                      },
                      color: APPColors.input_field_color_in_container,
                      txt: "GO",
                      color_txt: APPColors.Blue_color_basic,
                      color_pressed: APPColors.color_green,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

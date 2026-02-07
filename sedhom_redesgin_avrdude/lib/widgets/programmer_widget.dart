import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedhom_redesgin_avrdude/Avr_data_base/my_data.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';
import 'package:sedhom_redesgin_avrdude/widgets/basic_program_widgets.dart'
    show ProgrammerOption;
import 'package:sedhom_redesgin_avrdude/widgets/basic_widget.dart';
import 'package:sedhom_redesgin_avrdude/widgets/show_dialog_options_widget.dart';

class ProgrammerWidget extends StatefulWidget {
  final ValueChanged<String>? onProgrammerSelected;
  final ValueChanged<String>? onPortSelected;
  final ValueChanged<String>? onBaudRateSelected;
  final ValueChanged<String>? onBitClockSelected;
  const ProgrammerWidget({
    super.key,
    this.onProgrammerSelected,
    this.onPortSelected,
    this.onBaudRateSelected,
    this.onBitClockSelected,
  });

  @override
  State<ProgrammerWidget> createState() => _ProgrammerWidgetState();
}

class _ProgrammerWidgetState extends State<ProgrammerWidget> {
  int port_index = 0;
  int Buadrate_index = 0;
  int programmer_index = 0;
  int speed_index = 0;
  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "Programmer",
      short_cut: "-p",
      icon: AppIcons.programmer_icon,
      file_name: progrmers.programers_name[programmer_index],
      ontap: () {
        Sedhom_show_dialog(
          context: context,
          title: "Programmer",
          icon: AppIcons.programmer_icon,
          items: progrmers.programers_name,
          onItemTap: (index) {
            setState(() {
              programmer_index = index;
            });
          },
        );
      },
      short_cut_or_not: true,
      choose: AppIcons.choose_icon,
      file_name_and_choose_icon_or_not: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // text and icons
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 1.2,
              children: const [
                ProgrammerOption(
                  icon: AppIcons.usb_icon,
                  title: "Port",
                  shortcut: "-P",
                ),
                ProgrammerOption(
                  icon: AppIcons.baud_rate_icon,
                  title: "Baud Rate",
                  shortcut: "-b",
                ),
                ProgrammerOption(
                  icon: AppIcons.bit_clock_icon,
                  title: "Bit Clock",
                  shortcut: "-B",
                ),
              ],
            ),

            // buttons and textfeilds
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Gap(5),
                // usb container
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Sedhom_show_dialog(
                        context: context,
                        title: "Port",
                        icon: AppIcons.usb_icon,
                        items: PortType.port_types,
                        onItemTap: (index) {
                          setState(() {
                            port_index = index;
                            widget.onPortSelected?.call(
                              PortType.port_types[port_index],
                            );
                          });
                        },
                      );
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
                            Flexible(
                              child: Text(
                                PortType.port_types[port_index],
                                style: GoogleFonts.alfaSlabOne(
                                  color: APPColors.Blue_color_basic,
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gap(5),
                            IconButton(
                              onPressed: () {
                                Sedhom_show_dialog(
                                  context: context,
                                  title: "Port",
                                  icon: AppIcons.usb_icon,
                                  items: PortType.port_types,
                                  onItemTap: (index) {
                                    setState(() {
                                      port_index = index;
                                      widget.onPortSelected?.call(
                                        PortType.port_types[port_index],
                                      );
                                    });
                                  },
                                );
                                ;
                              },
                              icon: Icon(AppIcons.settings_icon),
                              color: APPColors.icons_color,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(15),
                // BuadRate container
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Sedhom_show_dialog(
                        context: context,
                        title: "Baud Rate",
                        icon: AppIcons.baud_rate_icon,
                        items: BuadRates.baud_rates,
                        onItemTap: (index) {
                          setState(() {
                            Buadrate_index = index;
                            widget.onBaudRateSelected?.call(
                              BuadRates.baud_rates[Buadrate_index],
                            );
                          });
                        },
                      );
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
                            Flexible(
                              child: Text(
                                BuadRates.baud_rates[Buadrate_index],
                                style: GoogleFonts.alfaSlabOne(
                                  color: APPColors.Blue_color_basic,
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gap(5),
                            IconButton(
                              onPressed: () {
                                Sedhom_show_dialog(
                                  context: context,
                                  title: "Baud Rate",
                                  icon: AppIcons.baud_rate_icon,
                                  items: BuadRates.baud_rates,
                                  onItemTap: (index) {
                                    setState(() {
                                      Buadrate_index = index;
                                      widget.onBaudRateSelected?.call(
                                        BuadRates.baud_rates[Buadrate_index],
                                      );
                                    });
                                  },
                                );
                              },
                              icon: Icon(AppIcons.settings_icon),
                              color: APPColors.icons_color,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(10),
                //Bit clock container
                Gap(10),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Sedhom_show_dialog(
                        context: context,
                        title: "Bit Clock",
                        icon: AppIcons.bit_clock_icon,
                        items: speedOptions.speed_options,
                        onItemTap: (index) {
                          setState(() {
                            speed_index = index;
                            widget.onBitClockSelected?.call(
                              speedOptions.speed_options[speed_index],
                            );
                          });
                        },
                      );
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
                            Flexible(
                              child: Text(
                                speedOptions.speed_options[speed_index],
                                style: GoogleFonts.alfaSlabOne(
                                  color: APPColors.Blue_color_basic,
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gap(5),
                            IconButton(
                              onPressed: () {
                                Sedhom_show_dialog(
                                  context: context,
                                  title: "Bit Clock",
                                  icon: AppIcons.bit_clock_icon,
                                  items: speedOptions.speed_options,
                                  onItemTap: (index) {
                                    setState(() {
                                      speed_index = index;
                                      widget.onBitClockSelected?.call(
                                        speedOptions.speed_options[speed_index],
                                      );
                                    });
                                  },
                                );
                              },
                              icon: Icon(AppIcons.settings_icon),
                              color: APPColors.icons_color,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

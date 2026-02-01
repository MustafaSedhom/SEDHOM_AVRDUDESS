import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';
import 'package:sedhom_redesgin_avrdude/containers/Basic_container.dart';
import 'package:sedhom_redesgin_avrdude/Resbonseive/screen_area.dart';
import 'package:sedhom_redesgin_avrdude/Avr_data_base/my_data.dart';
import 'package:sedhom_redesgin_avrdude/widgets/eeprom_widget.dart';
import 'package:sedhom_redesgin_avrdude/widgets/flash_widget.dart';
import 'package:sedhom_redesgin_avrdude/widgets/fuses_and_lock_bits_widget.dart';
import 'package:sedhom_redesgin_avrdude/widgets/mcu_widget.dart';
import 'package:sedhom_redesgin_avrdude/widgets/options_widget.dart';
import 'package:sedhom_redesgin_avrdude/widgets/programmer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController(
    text: Additional_command.join(" "),
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenArea.init(context);
    return Scaffold(
      backgroundColor: APPColors.app_background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              // sedhom avrdude text
              Center(
                child: Text(
                  "SEDHOM AVRDUDESS",
                  style: GoogleFonts.abrilFatface(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: APPColors.Blue_color_basic,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Divider(
                color: APPColors.Divider_color,
                thickness: 2,
                indent: 16,
                endIndent: 16,
              ),
              Gap(10),
              // 1 and 2 containers
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BasicContainer(child: McuWidget()),
                    BasicContainer(child: FlashWidget()),
                  ],
                ),
              ),
              // 3 and 4 containers
              Gap(10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BasicContainer(child: ProgrammerWidget()),
                    BasicContainer(child: EepromWidget()),
                  ],
                ),
              ),
              // 5 and 6 containers
              Gap(10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BasicContainer(child: FusesAndLockBitsWidget()),
                    BasicContainer(child: OptionsWidget()),
                  ],
                ),
              ),
              Gap(10),
              Divider(
                color: APPColors.Divider_color,
                thickness: 2,
                indent: 16,
                endIndent: 16,
              ),
              // buttons
              Gap(10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SecondContainer(
                      title: "Stop",
                      titleColor: APPColors.stop_word_color,
                    ),
                    SecondContainer(
                      title: "Program !",
                      titleColor: APPColors.Blue_color_basic,
                    ),
                  ],
                ),
              ),
              Gap(10),
              Divider(
                color: APPColors.Divider_color,
                thickness: 2,
                indent: 16,
                endIndent: 16,
              ),
              // aditiona command argument
              Gap(10),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Additional command line arguments",
                      style: TextStyle(
                        color: APPColors.container_title,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Gap(10),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 0,
                      ),
                      width: ScreenArea.Width * 0.95,
                      height: 35,
                      decoration: BoxDecoration(
                        color: APPColors.Termianl_background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // hintText: "Enter command",
                        ),
                        style: GoogleFonts.aDLaMDisplay(
                          fontSize: 15,
                          color: APPColors.color_green,
                        ),
                        showCursor: false,
                      ),
                    ),
                  ),
                ],
              ),
              // total commands
              Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Total commands",
                      style: TextStyle(
                        color: APPColors.container_title,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Gap(10),
                  Center(
                    child: Container(
                      width: ScreenArea.Width * 0.95,
                      height: 35,
                      decoration: BoxDecoration(
                        color: APPColors.Termianl_background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5,
                        ),
                        child: Text(
                          total_commands.join(" "),
                          style: TextStyle(
                            color: APPColors.command_color_pathed_by_cmd,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // terminal
              Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "OUTPUT",
                      style: TextStyle(
                        color: APPColors.container_title,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Gap(10),
                  Center(
                    child: Container(
                      width: ScreenArea.Width * 0.95,
                      height: 200,
                      decoration: BoxDecoration(
                        color: APPColors.Termianl_background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Output_commands.join("\n"),
                                style: GoogleFonts.aDLaMDisplay(
                                  color: APPColors.color_green,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}

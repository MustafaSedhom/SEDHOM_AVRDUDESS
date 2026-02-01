import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';
import 'package:sedhom_redesgin_avrdude/containers/Basic_container.dart';
import 'package:sedhom_redesgin_avrdude/Resbonseive/screen_area.dart';
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
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<String> additional_commands_from_user = [];
  List<String> commandes_passed_on_terminal = ["avrdude", "-m atmega328p"];
  List<String> total_commands = [""];
  List<String> Termianl_output = [
    "Sedhom avrdude started...",
    "Connecting to programmer...",
    "Reading device signature...",
  ];

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void addOutput(String text) {
    setState(() {
      Termianl_output.add(text);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
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
                    fontSize: 40,
                    // fontWeight: FontWeight.bold,
                    color: APPColors.Blue_color_basic,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Gap(10),
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
                      onTap: () {
                        addOutput("Stop program");
                      },
                    ),
                    SecondContainer(
                      title: "Program !",
                      titleColor: APPColors.Blue_color_basic,
                      onTap: () {
                        addOutput("run program and burn it on CPU");
                        addOutput(total_commands.join(" "));
                      },
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      height: 50,
                      decoration: BoxDecoration(
                        color: APPColors.Termianl_background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _controller,
                        onSubmitted: (value) {
                          setState(() {
                            // addOutput(total_commands.join(" "));
                            total_commands =
                                commandes_passed_on_terminal +
                                additional_commands_from_user;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            additional_commands_from_user = value.split(" ");
                            total_commands =
                                commandes_passed_on_terminal +
                                additional_commands_from_user;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "additional commands",
                          hintStyle: GoogleFonts.aDLaMDisplay(
                            fontSize: 20,
                            color: APPColors.color_green.withOpacity(0.5),
                          ),
                        ),
                        style: GoogleFonts.aDLaMDisplay(
                          fontSize: 20,
                          color: APPColors.color_green,
                        ),
                        showCursor: true,
                        cursorWidth: 3.5,
                        cursorRadius: Radius.circular(20),
                        cursorColor: APPColors.color_green,
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
                      height: 50,
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
                          "${commandes_passed_on_terminal.join(" ")} ${additional_commands_from_user.join(" ")}",
                          // total_commands.join(" "),
                          style: GoogleFonts.aDLaMDisplay(
                            color: APPColors.command_color_pathed_by_cmd,
                            fontSize: 25,
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
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              controller: _scrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: Termianl_output.map(
                                        (line) => [
                                          const TextSpan(
                                            text: "\$\$\$?  ",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "$line\n",
                                            style: GoogleFonts.aDLaMDisplay(
                                              color: APPColors.color_green,
                                            ),
                                          ),
                                        ],
                                      ).expand((element) => element).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    Termianl_output = [];
                                  });
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: APPColors.container_title,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.cleaning_services_outlined,
                                      color: APPColors.stop_word_color,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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

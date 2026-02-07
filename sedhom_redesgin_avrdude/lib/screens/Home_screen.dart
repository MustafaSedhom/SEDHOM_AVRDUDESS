import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedhom_redesgin_avrdude/Avr_data_base/my_data.dart';
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
  List<String> commandes_passed_on_terminal = ["avrdude"];
  List<String> total_commands = [];
  List<String> Termianl_output = [
    "Sedhom avrdude started...",
    "Connecting to programmer...",
    "Reading device signature...",
  ];
  MCU? selected_mcu;

  List<BasicContainer> get widgets => [
    BasicContainer(
      child: McuWidget(
        onMcuSelected: (mcu) {
          setState(() {
            selected_mcu = mcu;
            addOutput("Selected MCU >>> ");
            addOutput(">>> mcu name : ${mcu.name}");
            addOutput(">>> mcu id name : ${mcu.partId}");
            addOutput(">>> mcu flash size : ${mcu.flashKB} KB");
            addOutput(">>> mcu eeprom size : ${mcu.eepromKB} KB");
            addOutput(">>> mcu pins : ${mcu.pins}");
          });
        },
      ),
    ),
    BasicContainer(
      child: FlashWidget(
        onFlashOptionSelected: (str) {
          addOutput("Selected flash file >>> $str");
        },
        read_write_verify_selected: (options) {
          addOutput("Selected flash options >>> ${options}");
        },
        format_selected: (format) {
          addOutput("Selected flash format >>> $format");
        },
      ),
    ),
    BasicContainer(
      child: ProgrammerWidget(
        onProgrammerSelected: (str) {
          addOutput("Selected programmer >>> $str");
        },
        onPortSelected: (str) {
          addOutput("Selected port >>> $str");
        },
        onBaudRateSelected: (str) {
          addOutput("Selected baud rate >>> $str");
        },
        onBitClockSelected: (str) {
          addOutput("Selected bit clock >>> $str");
        },
      ),
    ),
    BasicContainer(
      child: EepromWidget(
        onFlashOptionSelected: (str) {
          addOutput("Selected eeprom file >>> $str");
        },
        read_write_verify_selected: (options) {
          addOutput("Selected eeprom options >>> ${options}");
        },
        format_selected: (format) {
          addOutput("Selected eeprom format >>> $format");
        },
      ),
    ),
    BasicContainer(
      child: OptionsWidget(
        versibality_changed: (str) {
          addOutput("Selected versibality >>> $str");
        },
        options_changed: (options) {
          addOutput(
            "Selected options >>> ${options.entries.where((entry) => entry.value).map((entry) => entry.key).toList()}",
          );
        },
      ),
    ),
    BasicContainer(
      child: FusesAndLockBitsWidget(
        L_fuse_changed: (str) {
          addOutput("Selected L fuse >>> $str");
        },
        H_fuse_changed: (str) {
          addOutput("Selected H fuse >>> $str");
        },
        E_fuse_changed: (str) {
          addOutput("Selected E fuse >>> $str");
        },
        LB_fuse_changed: (str) {
          addOutput("Selected LB fuse >>> $str");
        },
        set_fuse_changed: (str) {
          addOutput("Set fuses >>> $str");
        },
        set_lock_read: (str) {
          addOutput("Set locks >>> $str");
        },
      ),
    ),
  ];
  @override
  void initState() {
    total_commands =
        additional_commands_from_user + commandes_passed_on_terminal;
    super.initState();
  }

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
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenArea.init(context);
    int columns = ScreenArea.Width > 800 ? 2 : 1;
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
              // sedhom avrdude text and install button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Center(
                    child: Text(
                      "SEDHOM AVRDUDESS",
                      style: GoogleFonts.abrilFatface(
                        fontSize: 40,
                        color: APPColors.Blue_color_basic,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: IconButton(
                      onPressed: () {
                        addOutput(
                          "installing avrdude to your computer terminal",
                        );
                      },
                      icon: Icon(
                        Icons.download_for_offline_outlined,
                        color: APPColors.icons_color,
                        size: 40,
                      ),
                      tooltip: "install AVRDUDE on you computer terminal's",
                      hoverColor: APPColors.container_background,
                    ),
                  ),
                  Gap(20),
                ],
              ),
              Gap(10),
              Divider(
                color: APPColors.Divider_color,
                thickness: 2,
                indent: 16,
                endIndent: 16,
              ),
              Gap(10),
              // containers
              Wrap(
                spacing: 20,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: widgets
                    .map(
                      (w) => SizedBox(
                        width: (ScreenArea.Width / columns) - 30,
                        child: w,
                      ),
                    )
                    .toList(),
              ),
              Gap(10),
              Divider(
                color: APPColors.Divider_color,
                thickness: 2,
                indent: 16,
                endIndent: 16,
              ),
              Gap(10),
              // buttons
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
                                      AppIcons.clear_terminal_icon,
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

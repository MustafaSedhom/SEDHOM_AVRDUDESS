import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedhom_redesgin_avrdude/constants/constant.dart';

class BasicWidget extends StatelessWidget {
  final String title;
  final String? short_cut;
  final IconData icon;
  final String? file_name;
  final IconData? choose;
  final bool short_cut_or_not;
  final bool file_name_and_choose_icon_or_not;
  final Widget child;
  final Function()? ontap;

  const BasicWidget( {
    super.key,
    required this.title,
    this.short_cut,
    required this.icon,
    this.file_name,
    required this.short_cut_or_not,
    this.choose,
    required this.file_name_and_choose_icon_or_not,
    required this.child,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, size: 40),
                  Flexible(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 30,
                        color: APPColors.container_title,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: short_cut_or_not
                        ? Text(
                            short_cut!,
                            style: TextStyle(
                              fontSize: 30,
                              color: APPColors.short_cut_in_cmd_command,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Gap(5),
                  ),
                ],
              ),
            ),
            Gap(5),
            file_name_and_choose_icon_or_not
                ? InkWell(
                    onTap: ontap,

                    child: Container(
                      decoration: BoxDecoration(
                        color: APPColors.input_field_color_in_container,
                        borderRadius: BorderRadius.circular(
                          AppBorderRaduis.border_raduis,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                file_name!,
                                style: GoogleFonts.alfaSlabOne(
                                  color: APPColors.Blue_color_basic,
                                  fontSize: 20,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: ontap,
                              icon: Icon(choose, size: 40),
                              color: APPColors.icons_color,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Gap(0),
            Container(child: child),
          ],
        ),
      ),
    );
  }
}

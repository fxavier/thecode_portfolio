import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:thecode_portfolio/models/design_process.dart';
import 'package:thecode_portfolio/utils/constants.dart';
import 'package:thecode_portfolio/utils/screen_helper.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "SOBRE NÓS",
    imagePath: "assets/design.png",
    subtitle: "Somos uma pequena empresa",
  ),
  DesignProcess(
    title: "CRIAÇÃO",
    imagePath: "assets/develop.png",
    subtitle:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusm",
  ),
  DesignProcess(
    title: "RELATÓRIOS",
    imagePath: "assets/write.png",
    subtitle:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusm",
  ),
  DesignProcess(
    title: "VISUALIZAÇÕES",
    imagePath: "assets/promote.png",
    subtitle:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusm",
  ),
];

class QuemSomos extends StatelessWidget {
  const QuemSomos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }
}

Widget _buildUi(BuildContext context, double width) {
  // we need the context to get maxWidth before the constraints below
  return ResponsiveWrapper(
    maxWidth: width,
    minWidth: width,
    defaultScale: false,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "BOM DESIGN,\nBOA EXPERIÊNCIA",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                height: 1.8,
                fontSize: 18.0,
              ),
            ),
            // GestureDetector(
            //   onTap: () {},
            //   child: MouseRegion(
            //     cursor: SystemMouseCursors.click,
            //     child: Text(
            //       "DOWNLOAD CV",
            //       style: GoogleFonts.oswald(
            //         color: kPrimaryColor,
            //         fontWeight: FontWeight.w900,
            //         fontSize: 16.0,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        const SizedBox(
          height: 50.0,
        ),
        LayoutBuilder(
          builder: (_context, constraints) {
            return ResponsiveGridView.builder(
              padding: const EdgeInsets.all(0.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              alignment: Alignment.topCenter,
              gridDelegate: ResponsiveGridDelegate(
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                        ScreenHelper.isMobile(context)
                    ? constraints.maxWidth / 2.0
                    : 250.0,
                // Hack to adjust child height
                childAspectRatio: ScreenHelper.isDesktop(context)
                    ? 1
                    : MediaQuery.of(context).size.aspectRatio * 1.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          designProcesses[index].imagePath,
                          width: 36.0,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          designProcesses[index].title,
                          style: GoogleFonts.oswald(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      designProcesses[index].subtitle,
                      style: const TextStyle(
                        color: kCaptionColor,
                        height: 1.5,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                );
              },
              itemCount: designProcesses.length,
            );
          },
        )
      ],
    ),
  );
}

import 'package:diet_macro/models/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconDir;

  const SettingCard({super.key, required this.title, required this.subtitle, required this.iconDir});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: InkWell(
        splashColor: Colors.black,
        onTap: () {
          if (title == 'RESET') {
            IsarService().deleteTargetData(1);

            showDialog(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 160),
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.zero,
                      content: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
                          children: [
                            Lottie.asset(
                              'lib/images/success_icon.json',
                              width: 200,
                            ),
                            SizedBox(height: 16), // Lottie와 텍스트 사이 간격
                            Text(
                              "Reset Complete !",
                              style: GoogleFonts.robotoCondensed(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4), // 텍스트 사이 간격
                            Text(
                              "restart your app",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.grey[100],
                    ),
                  );
                });
          } else if (title == '- - - - - -') {
            print('두번째 눌림');
          }
        },
        child: Card(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add padding around the row widget
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      iconDir,
                      width: 120.0,
                    ),

                    SizedBox(
                      width: 25,
                    ),
                    // Add an expanded widget to take up the remaining horizontal space
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            title,
                            style: GoogleFonts.roboto(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            subtitle,
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

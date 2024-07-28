import 'package:diet_macro/models/isar_service.dart';
import 'package:diet_macro/pages/first_intro.dart';
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
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 120),
                  child: _buildDialog(context, 'Reset Complete !', 'Re-Enter your calories goal'),
                );
              },
            );
          } else if (title == 'DELETE') {
            // DEBUG
            print('Clicked : DELETE');

            IsarService().deleteAllDailyData();

            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 120),
                  child: _buildDialog(context, 'Delete Complete !', 'Daily data has been removed'),
                );
              },
            );
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
              Padding(
                padding: const EdgeInsets.only(right: 35),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      iconDir,
                      height: 140,
                    ),
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

  Widget _buildDialog(BuildContext context, String title, String subtitle) {
    return AlertDialog(
      backgroundColor: Colors.grey[100],
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            if (title == 'Reset Complete !') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FirstIntro(),
                ),
              );
            } else {
              Navigator.pop(context);
            }
            ;
          },
          child: const Center(child: Text('OK')),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: EdgeInsets.zero,
      content: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'lib/images/success_icon.json',
              width: 200,
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.robotoCondensed(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: GoogleFonts.roboto(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

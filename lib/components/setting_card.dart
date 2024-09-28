import 'package:diet_macro/pages/food_list_page.dart';
import 'package:diet_macro/services/isar.service.dart';
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
          } else if (title == 'NUTRITION') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FoodListPage(),
              ),
            );
          }
        },
        child: Card(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
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
                      height: 120,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
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
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          onPressed: () {
            if (title == 'Reset Complete !') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const FirstIntro(),
                ),
              );
            } else {
              Navigator.pop(context);
            }
          },
          child: Center(
            child: Text(
              'Okay',
              style: GoogleFonts.roboto(),
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(44),
      ),
      contentPadding: EdgeInsets.zero,
      content: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'lib/images/success.json',
              width: 200,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.robotoCondensed(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: GoogleFonts.robotoCondensed(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

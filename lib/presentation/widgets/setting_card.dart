import 'package:diet_macro/presentation/views/food_search/food_search_page.dart';
import 'package:diet_macro/data/services/isar_service.dart';
import 'package:diet_macro/presentation/views/intro_screens/first_intro/first_intro.dart';
import 'package:diet_macro/core/styles/typography.dart';
import 'package:flutter/material.dart';
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
          switch (title) {
            case 'Reset':
              IsarService().deleteTargetData(1);

              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 120),
                    child: _buildDialog(context, 'Reset Complete', 'Re-Enter your calories goal'),
                  );
                },
              );
              break;
            case 'Delete':
              IsarService().deleteAllDailyData();

              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 120),
                    child: _buildDialog(context, 'Removed', 'Daily data has been removed'),
                  );
                },
              );
              break;
            case 'Nutrition':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FoodSearchPage(),
                ),
              );
              break;
            default:
              break;
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
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Image.asset(
                        iconDir,
                        height: 70,
                      ),
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
                            style: MyTypos.heading2ExtraBold,
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
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            if (title == 'Reset Complete') {
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
          child: const Center(
            child: Text(
              'Okay',
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: EdgeInsets.zero,
      content: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/images/success.json',
              width: 200,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: MyTypos.heading3ExtraBold,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: MyTypos.caption1,
            ),
          ],
        ),
      ),
    );
  }
}

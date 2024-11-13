import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[850],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
              Container(
                padding: const EdgeInsets.only(top: 55.0),
                child: Lottie.asset(
                  'lib/images/animated_icon.json',
                  width: 230,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: Divider(
                  color: Colors.grey[600],
                ),
              ),

              // other pages
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri.parse('https://github.com/squattlife/MyMacro');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Image.asset('lib/images/github.png', width: 28.0),
                    title: Text(
                      'Github',
                      style: GoogleFonts.roboto(color: Colors.grey[300]),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  print('on clicked');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Image.asset('lib/images/appstore.png', width: 28.0),
                    title: Text(
                      'App Store',
                      style: GoogleFonts.roboto(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  print('on clicked');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 27.0),
                  child: ListTile(
                    leading: Image.asset('lib/images/playstore.png', width: 26.0),
                    title: Text(
                      'Play Store',
                      style: GoogleFonts.roboto(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () async {
                  final Uri url = Uri.parse('https://www.fatsecret.com/calories-nutrition/');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.5),
                  child: ListTile(
                    leading: Image.asset('lib/images/fatsecret.png', width: 28.0),
                    title: Text(
                      'FatSecret',
                      style: GoogleFonts.roboto(color: Colors.grey[300]),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0, bottom: 35.0),
            child: ListTile(
              leading: Icon(
                Icons.copyright,
                color: Colors.grey,
              ),
              title: Text(
                'LEE JAEYOUNG',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
                padding: const EdgeInsets.only(top: 75.0),
                child: const Icon(
                  Icons.info,
                  size: 100.0,
                  color: Colors.grey,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                child: Divider(
                  color: Colors.grey[600],
                ),
              ),

              // other pages
              GestureDetector(
                onTap: () async {
                  final Uri _url = Uri.parse('http://github.com/squattlife/MyMacro');
                  if (!await launchUrl(_url)) {
                    throw Exception('Could not launch $_url');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Image.asset('lib/images/github.png', width: 28.0),
                    title: const Text(
                      'Github',
                      style: TextStyle(color: Colors.white),
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
                    title: const Text(
                      'App Store',
                      style: TextStyle(color: Colors.white),
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

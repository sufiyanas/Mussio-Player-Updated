import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_player/colortheame/color.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final Uri aboutourappURL =
      Uri.parse('https://github.com/sufiyanas/MUSSIO-PLAYER');

  final Uri aboutusURL =
      Uri.parse('https://sufiyanas.github.io/MohammedSufiyan/');

  final Uri githubUrl = Uri.parse('https://github.com/sufiyanas');

  final Uri instaUrl =
      Uri.parse('https://www.instagram.com/mohmd__sufiyan?r=nametag');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xFFff0A0A0A),
            Colors.white24,
          ])),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Settings',
              style: TextStyle(fontSize: 30, color: Colors.white)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.grey[850],
              // border: Border.all(width: 3.0),
              borderRadius: const BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: theamcoloryellow,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                // Settingsfirstitem(
                //     leadingIcon: Icons.notifications_active,
                //     title: "Notifications"),
                // const Divider(
                //   height: 1.5,
                //   color: Colors.white10,
                // ),
                InkWell(
                  onTap: () => showLicensePage(
                      useRootNavigator: true,
                      applicationVersion: '0.0.1',
                      context: context,
                      applicationName: 'Mussio Player',
                      applicationIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/image/Splash_screen.png'),
                      )),
                  child: settingsItems(
                    leadingIcon: Icons.admin_panel_settings,
                    title: "Privacy Policy",
                  ),
                ),
                const Divider(
                  height: 1.5,
                  color: Colors.white10,
                ),
                InkWell(
                  onTap: () => _launchUrl(url: aboutourappURL),
                  child: settingsItems(
                      leadingIcon: Icons.star_half, title: "About Our App"),
                ),
                const Divider(
                  height: 1.5,
                  color: Colors.white10,
                ),
                InkWell(
                  onTap: () {
                    log('Button pressed');
                    _launchUrl(url: aboutusURL);
                  },
                  child: settingsItems(
                      leadingIcon: Icons.help_outline, title: "About Us"),
                ),
                const Divider(
                  height: 1.5,
                  color: Colors.white10,
                ),
                settingsItems(leadingIcon: Icons.headset_mic, title: "Help"),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Made with ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.favorite,
                      color: theamcoloryellow,
                      size: 20,
                    ),
                    const Text(
                      ' by Developer',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Share.share(
                        //     'check out my website https://www.instagram.com/mohmd__sufiyan?r=nametag',
                        //     subject: 'Look what I made!');
                        applaucnher(url: instaUrl);
                      },
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/image/intagram.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl(url: githubUrl);
                      },
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/image/Github.png'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget Settingsfirstitem({required IconData leadingIcon, required title}) {
  //   bool switchvalue = true;
  //   return ListTile(
  //       leading: Icon(leadingIcon, color: theamcoloryellow),
  //       title: Text(
  //         title,
  //         style: const TextStyle(
  //           color: Colors.white,
  //           fontSize: 25,
  //         ),
  //       ),
  //       trailing: CupertinoSwitch(
  //           activeColor: theamcoloryellow,
  //           thumbColor: Colors.grey.shade700,
  //           value: (switchvalue),
  //           onChanged: (value) {}));
  // }

  Widget settingsItems({required IconData leadingIcon, required title}) {
    return InkWell(
      child: ListTile(
        leading: Icon(leadingIcon, color: theamcoloryellow),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right_sharp,
          color: theamcoloryellow,
        ),
      ),
    );
  }

//url launcher
  Future<void> _launchUrl({required url}) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  //app launcher
  Future<void> applaucnher({required url}) async {
    if (await launchUrl(url)) {
      await launch(url, universalLinksOnly: true);
    } else {
      throw 'There was a problem to open the url: $url';
    }
  }
}

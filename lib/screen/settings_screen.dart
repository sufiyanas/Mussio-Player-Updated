import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const Text('Settings',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                const SizedBox(
                  height: 30,
                ),
                Settingsfirstitem(leadingIcon: Icons.light_mode, title: "Mode"),
                const Divider(
                  height: 1.5,
                  color: Colors.white10,
                ),
                settingsItems(
                    leadingIcon: Icons.admin_panel_settings,
                    title: "Privacy Policy"),
                const Divider(
                  height: 1.5,
                  color: Colors.white10,
                ),
                settingsItems(
                    leadingIcon: Icons.star_half, title: "About Our App"),
                const Divider(
                  height: 1.5,
                  color: Colors.white10,
                ),
                settingsItems(
                    leadingIcon: Icons.help_outline, title: "About Us"),
                const Divider(
                  height: 1.5,
                  color: Colors.white10,
                ),
                settingsItems(leadingIcon: Icons.headset_mic, title: "Help"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Settingsfirstitem({required IconData leadingIcon, required title}) {
    const Color theamcoloryellow = Color.fromRGBO(230, 102, 23, 1);
    bool switchvalue = true;
    return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: ListTile(
            leading: Icon(leadingIcon, color: theamcoloryellow),
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            trailing: CupertinoSwitch(
                activeColor: theamcoloryellow,
                thumbColor: Colors.grey.shade700,
                value: (switchvalue),
                onChanged: (value) {
                  setState(() {
                    switchvalue = value;
                  });
                })));
  }

  Widget settingsItems({required IconData leadingIcon, required title}) {
    const Color theamcoloryellow = Color.fromRGBO(230, 102, 23, 1);

    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {},
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
}

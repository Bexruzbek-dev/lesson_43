import 'package:flutter/material.dart';
import 'package:lesson_43/views/screens/home_screen.dart';
import 'package:lesson_43/views/screens/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeModeChanged;
  final ValueChanged<Color> appBarColor;
  final ValueChanged<Color> bodyColor;
  final ValueChanged<double> textSize;
  final ValueChanged<Color> textColor;

  const CustomDrawer(
      {super.key,
      required this.onThemeModeChanged,
      required this.appBarColor,
      required this.bodyColor,
      required this.textSize,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text("MENYU"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (ctx) {
                return HomeScreen(
                  onThemeModeChanged: onThemeModeChanged,
                  appBarColor: appBarColor,
                  bodyColor: bodyColor,
                  textSize: textSize,
                  textColor: textColor,
                );
              }));
            },
            leading: const Icon(Icons.home),
            title: const Text("Bosh sahifa"),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (ctx) {
                return SettingsScreen(
                  onThemeModeChanged: onThemeModeChanged,
                  appBarColor: appBarColor,
                  bodyColor: bodyColor,
                  textSize: textSize,
                  textColor: textColor,
                );
              }));
            },
            leading: const Icon(Icons.settings),
            title: const Text("Sozlamalar"),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }
}

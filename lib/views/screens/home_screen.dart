import 'package:flutter/material.dart';
import 'package:lesson_43/utils/app_constants.dart';
import 'package:lesson_43/views/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<bool> onThemeModeChanged;
  final ValueChanged<Color> appBarColor;
  final ValueChanged<Color> bodyColor;
  final ValueChanged<double> textSize;
  final ValueChanged<Color> textColor;

  const HomeScreen({
    super.key,
    required this.onThemeModeChanged,
    required this.appBarColor,
    required this.bodyColor,
    required this.textSize,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        color: AppConstants.bodyColor,
        child: Center(
          child: Text(
            "Welcome Home",
            style: TextStyle(
              fontSize: AppConstants.textSize,
              color: AppConstants.textColor,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 24,
                  color: AppConstants.textColor,
                ),
              ),
              decoration: BoxDecoration(
                color: AppConstants.appBarColor,
              ),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(
                      onThemeModeChanged: onThemeModeChanged,
                      appBarColor: appBarColor,
                      bodyColor: bodyColor,
                      textSize: textSize,
                      textColor: textColor,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

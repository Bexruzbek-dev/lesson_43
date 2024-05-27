import 'package:flutter/material.dart';
import 'package:lesson_43/utils/app_constants.dart';
import 'package:lesson_43/views/screens/lock_screen.dart';
import 'package:lesson_43/views/screens/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUnlocked = false;

  void unlockApp() {
    setState(() {
      isUnlocked = true;
    });
  }

  void _updateThemeMode(bool isDark) {
    setState(() {
      AppConstants.themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _updateAppBarColor(Color color) {
    setState(() {
      AppConstants.appBarColor = color;
    });
  }

  void _updateBodyColor(Color color) {
    setState(() {
      AppConstants.bodyColor = color;
    });
  }

  void _updateTextSize(double size) {
    setState(() {
      AppConstants.textSize = size;
    });
  }

  void _updateTextColor(Color color) {
    setState(() {
      AppConstants.textColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lock Screen App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: AppConstants.themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(color: AppConstants.appBarColor),
        textTheme: TextTheme(bodyMedium: TextStyle(color: AppConstants.textColor, fontSize: AppConstants.textSize)),
      ),
      home: isUnlocked
          ? HomeScreen(
              onThemeModeChanged: _updateThemeMode,
              appBarColor: _updateAppBarColor,
              bodyColor: _updateBodyColor,
              textSize: _updateTextSize,
              textColor: _updateTextColor,
            )
          : LockScreen(
              onSuccessfulUnlock: unlockApp,
            ),
    );
  }
}

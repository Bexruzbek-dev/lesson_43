import 'package:flutter/material.dart';
import 'package:lesson_43/utils/app_constants.dart';
import 'package:lesson_43/views/screens/home_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void changeThemeMode(bool isDark) {
    AppConstants.themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  void appBarColor(Color appBarColor) {
    AppConstants.appBarColor;
    setState(() {});
  }

  void bodyColor(Color bodyColor) {
    AppConstants.bodyColor;
    setState(() {});
  }

  void textSize(double size) {
    AppConstants.textSize;
    setState(() {});
  }

  void textColor(Color textColor) {
    AppConstants.textColor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppConstants.appBarColor,
        ),
        scaffoldBackgroundColor: AppConstants.bodyColor,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: AppConstants.themeMode,
      home: HomeScreen(
        onThemeModeChanged: changeThemeMode,
        appBarColor: appBarColor,
        bodyColor: bodyColor,
        textSize: textSize,
        textColor: textColor,
      ),
    );
  }
}

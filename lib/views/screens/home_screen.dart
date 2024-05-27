import 'package:flutter/material.dart';
import 'package:lesson_43/utils/app_constants.dart';
import 'package:lesson_43/views/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<bool> onThemeModeChanged;
  final ValueChanged<Color> appBarColor;
  final ValueChanged<Color> bodyColor;
  final ValueChanged<double> textSize;
  final ValueChanged<Color> textColor;

  const HomeScreen(
      {super.key,
      required this.onThemeModeChanged,
      required this.appBarColor,
      required this.bodyColor,
      required this.textSize,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bosh sahifa"),
        centerTitle: true,
      ),
      drawer: CustomDrawer(
        onThemeModeChanged: onThemeModeChanged,
        appBarColor: appBarColor,
        bodyColor: bodyColor,
        textSize: textSize,
        textColor: textColor,
      ),
      body: Center(
        child: Text(
          """Ut tempor esse quis reprehenderit elit id laboris culpa occaecat eiusmod laborum culpa exercitation dolore. Voluptate et eiusmod voluptate fugiat veniam ullamco laborum laborum. Ex enim enim eiusmod elit officia nostrud esse consequat nulla sit laboris culpa. Consectetur aliqua mollit incididunt proident nisi pariatur fugiat. Id consectetur deserunt reprehenderit voluptate non minim proident ad culpa veniam aute.Aliqua sunt mollit consequat sint proident occaecat do velit officia do. Eiusmod in consectetur anim id occaecat sit. Do ea id aliqua eu nulla. Elit nostrud Lorem cillum id veniam deserunt dolor. Anim ullamco sint enim et officia. In ut est deserunt sint nostrud ipsum laboris ea sint magna.""",
          style: TextStyle(
            fontSize: AppConstants.textSize,
            color: AppConstants.textColor,
          ),
        ),
      ),
    );
  }
}

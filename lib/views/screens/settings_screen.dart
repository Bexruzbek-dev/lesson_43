import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:lesson_43/utils/app_constants.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeModeChanged;
  final ValueChanged<Color> appBarColor;
  final ValueChanged<Color> bodyColor;
  final ValueChanged<double> textSize;
  final ValueChanged<Color> textColor;

  const SettingsScreen({
    super.key,
    required this.onThemeModeChanged,
    required this.appBarColor,
    required this.bodyColor,
    required this.textSize,
    required this.textColor,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Color appBarPickerColor = AppConstants.appBarColor;
  Color bodyPickerColor = AppConstants.bodyColor;
  Color textPickerColor = AppConstants.textColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sozlamalar"),
        backgroundColor: appBarPickerColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == ThemeMode.dark,
              onChanged: (value) {
                widget.onThemeModeChanged(value);
                setState(() {
                  AppConstants.themeMode =
                      value ? ThemeMode.dark : ThemeMode.light;
                });
              },
              title: const Text("Tungi holat"),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showColorPickerDialog(context);
                },
                child: const Text('Change App Bar Color'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showColorPickerDialogBody(context);
                },
                child: const Text('Change Body Background Color'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showNumberInputDialog(context);
                },
                child: const Text('Enter Number for Body Text'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showColorPickerDialogText(context);
                },
                child: const Text('Change Body Text Color'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showColorPickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color tempPickerColor = appBarPickerColor;
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: tempPickerColor,
              onColorChanged: (Color color) {
                tempPickerColor = color;
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Done'),
              onPressed: () {
                setState(() {
                  appBarPickerColor = tempPickerColor;
                  AppConstants.appBarColor = tempPickerColor;
                });
                widget.appBarColor(tempPickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showColorPickerDialogBody(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color tempPickerColor = bodyPickerColor;
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: tempPickerColor,
              onColorChanged: (Color color) {
                tempPickerColor = color;
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Done'),
              onPressed: () {
                setState(() {
                  bodyPickerColor = tempPickerColor;
                  AppConstants.bodyColor = tempPickerColor;
                });
                widget.bodyColor(tempPickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showNumberInputDialog(BuildContext context) {
    TextEditingController numberController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter a number'),
          content: TextField(
            controller: numberController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
              hintText: 'Enter a number',
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Done'),
              onPressed: () {
                double enteredNumber = double.parse(numberController.text);
                setState(() {
                  AppConstants.textSize = enteredNumber;
                });
                widget.textSize(enteredNumber);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

 void _showColorPickerDialogText(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Color tempPickerColor = textPickerColor;
      return AlertDialog(
        title: const Text('Pick a color'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: tempPickerColor,
            onColorChanged: (Color color) {
              tempPickerColor = color;
            },
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Done'),
            onPressed: () {
              setState(() {
                textPickerColor = tempPickerColor;
                AppConstants.textColor = tempPickerColor;
              });
              widget.textColor(tempPickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}
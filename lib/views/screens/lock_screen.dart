import 'package:flutter/material.dart';

class LockScreen extends StatefulWidget {
  final VoidCallback onSuccessfulUnlock;

  const LockScreen({Key? key, required this.onSuccessfulUnlock})
      : super(key: key);

  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final String _correctPassword = '1234';

  void _checkPassword() {
    if (_passwordController.text == _correctPassword) {
      widget.onSuccessfulUnlock();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Incorrect Password'),
            content: Text('Please try again.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lock Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkPassword,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

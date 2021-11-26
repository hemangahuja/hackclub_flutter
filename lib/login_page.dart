
import "package:flutter/material.dart";
import 'package:regexpattern/regexpattern.dart';
import 'package:test_/main.dart';
void main() {
  runApp(const MaterialApp(home: LoginPage()));}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Appella",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(250.0),
            ),
            child: Center(
                child: Text(
                  "Let's get started.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      fontSize: 30.0),
                )),
          ),
          Container(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150.0),
              ),
              child: Center(
                child: Text(
                    "Make the school app "
                        "your personal assistant",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[600],
                    )),
              )),
          const MyStatefulWidget(
          ),
        ],
       ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value==null||(value.isEmail()==false)) {
                return 'Please enter valid email';
              }},
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your pass',
            ),
            obscureText: true,
            validator: (String? value) {
              if (value==null||(value.isPasswordEasy()==false)) {
                return 'Please enter valid password';
              } {

              }},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (_) => MyApp()), (r) => false);
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}


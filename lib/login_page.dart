
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
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Column(
              children: const [
                Text(
                  "Musiko",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30.0),
                ),
                Text(
                  "Let's get started.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(37,22,133,1),
                      fontSize: 30.0),
                ),
              ]),
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
          const Text("Username", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(37,22,133,1)),),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Your email',
                prefixIcon: Icon(Icons.person, color: Color.fromRGBO(75,52,223,1),)
            ),
            validator: (String? value) {
              if (value==null||(value.isEmail()==false)) {
                return 'Please enter valid email';
              }},
          ),
          const Text("Password", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(37,22,133,1)),),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Your pass',
              prefixIcon: Icon(Icons.lock, color: Color.fromRGBO(75,52,223,1),),
              suffixIcon: Icon(Icons.visibility_outlined,color: Color.fromRGBO(156,155,179,1),),
            ),
            obscureText: true,
            validator: (String? value) {
              if (value==null||(value.isPasswordEasy()==false)) {
                return 'Please enter valid password';
              } {

              }},
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text("Forgot password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color.fromRGBO(75,52,223,1)))
              ]
            ),
            Column(
              children: [
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(75,52,223,1)),
                    ),
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (_) => MyApp()), (r) => false);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('Submit',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                const Text("or sign in with qr code",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color.fromRGBO(75,52,223,1))),
              ],
            ),
        ],
      ),
    );
  }
}


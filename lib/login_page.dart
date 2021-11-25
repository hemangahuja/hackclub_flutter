
import "package:flutter/material.dart";
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
            height: 70.0,
            width: 1000.0,
            padding: EdgeInsets.only(top: 30.0),
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
              height: 70.0,
              width: 600.0,
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
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
          SizedBox(
            height:100.0,
            child: Column(
              children: <Widget>[
                Text(
                  "USERNAME",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.blue[900],
                  ),
                ),
                Row(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.blue[900],
                        ),
                        hintText: "your username",
                      ),
                    ),
                  ],
                ),
                Text(
                  "PASSWORD",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.blue[900],
                  ),
                ),
                Row(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.https,
                          color: Colors.blue[900],
                        ),
                        hintText: "your password",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



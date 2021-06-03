import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trivia50/src/screens/home.dart';
import 'package:trivia50/src/screens/reset.dart';
import 'package:trivia50/src/screens/verify.dart';
import 'package:trivia50/src/widgets/button-1.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
            ),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 160,
              child: Stack(
                children: [
                  Center(
                    child: Image(image: AssetImage('assets/img/img1.png')),
                  ),
                  Positioned(
                    top: 65,
                    left: (MediaQuery.of(context).size.width / 2) - 50,
                    child: Image(
                      width: 100,
                      height: 100,
                      image: AssetImage('assets/img/img2.png'),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white70),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white70),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _password = value.trim();
                        });
                      }),
                  SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button1(
                        onPress: () => _signin(_email, _password),
                        text: 'Sign In',
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Button1(
                        color1: Colors.red,
                        onPress: () => _signup(_email, _password),
                        text: 'Sign Up',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ResetPassworsPage()));
                        },
                        child: Text(
                          'Forgot Password?',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _signin(String _email, String _password) async {
    try {
      await auth.signInWithEmailAndPassword(email: _email, password: _password);
      // Success
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } on FirebaseAuthException catch (err) {
      print(err.message);
      Fluttertoast.showToast(msg: err.message, gravity: ToastGravity.BOTTOM);
    }
  }

  _signup(String _email, String _password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      // Success
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => VerifyPage(),
        ),
      );
    } on FirebaseAuthException catch (err) {
      print(err);
      if (err == null) {
        Fluttertoast.showToast(
            msg: 'Campos de texto vacios', gravity: ToastGravity.BOTTOM);
      }
      Fluttertoast.showToast(
        msg: err.message,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.redAccent,
        textColor: Colors.black,
        timeInSecForIosWeb: 2,
      );
    }
  }
}

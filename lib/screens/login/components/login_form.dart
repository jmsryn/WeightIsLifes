import 'package:WeightIsLife/screens/login/components/text_field_round.dart';
import 'package:WeightIsLife/services/auth.dart';
import 'package:flutter/material.dart';

import '../../../colors.dart';
import 'have_account.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email, _password;
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.99,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 30)),
          TextFieldContainer(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white, fontFamily: 'Proxima'),
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  fillColor: Colors.white,
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.white)),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          TextFieldContainer(
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(color: Colors.white, fontFamily: 'Proxima'),
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  fillColor: Colors.white,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white)),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          FlatButton(
              onPressed: () {
                auth.emailSignIn(_email, _password).whenComplete(() {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (Route<dynamic> route) => false);
                });
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                alignment: Alignment.center,
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: primaryyColor),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontFamily: 'Proxima', fontSize: 18, color: Colors.black),
                ),
              )),
          HaveAccount()
        ],
      ),
    );
  }
}

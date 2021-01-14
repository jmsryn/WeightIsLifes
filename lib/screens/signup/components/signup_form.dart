import 'package:WeightIsLife/screens/signup/components/text_field_round.dart';
import 'package:WeightIsLife/screens/signup/sign_form/form.dart';
import 'package:WeightIsLife/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../colors.dart';
import 'have_account.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  final AuthService _auth = AuthService();

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
                _auth.emailSignUp(_email, _password).whenComplete(() {
                  User user = auth.currentUser;
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Forms(
                            uid: user.uid,
                          )));
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
                  'Sign Up',
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

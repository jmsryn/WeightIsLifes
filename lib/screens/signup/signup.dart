import 'package:flutter/material.dart';

import '../../colors.dart';
import 'components/header.dart';
import 'components/signup_form.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: thirdColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [SignUpHeader(), SignUpForm()],
        ),
      ),
    );
  }
}

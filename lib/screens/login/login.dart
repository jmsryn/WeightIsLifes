import 'package:flutter/material.dart';

import '../../colors.dart';
import 'components/header.dart';
import 'components/login_form.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: thirdColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [Header(), LoginForm()],
        ),
      ),
    );
  }
}

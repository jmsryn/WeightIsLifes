import 'package:WeightIsLife/screens/dashboard/dashboard.dart';
import 'package:WeightIsLife/screens/login/login.dart';
import 'package:WeightIsLife/screens/signup/signup.dart';
import 'package:WeightIsLife/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => App(),
        '/signup': (context) => Signup(),
        '/home': (context) => App(),
      }));
}

class App extends StatelessWidget {
  final AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              alignment: Alignment.center,
              child: Text('Error'),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            User user = FirebaseAuth.instance.currentUser;
            if (user == null) {
              return Login();
            } else {
              return Dashboard(user.uid);
            }
          }
          return SpinKitRotatingCircle(
            color: primaryyColor,
            size: 50.0,
          );
        });
  }
}

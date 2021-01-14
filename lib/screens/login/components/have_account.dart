import 'package:flutter/material.dart';

class HaveAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account yet?",
            style: TextStyle(color: Colors.white, fontFamily: 'Proxima'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/signup');
            },
            child: Container(
                child: Text(
              ' Sign Up',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}

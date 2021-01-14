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
            "Already have an account?",
            style: TextStyle(color: Colors.white, fontFamily: 'Proxima'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Container(
                child: Text(
              ' Sign In',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../colors.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: thirdColor,
      height: MediaQuery.of(context).size.height / 2.2,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.1, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weight',
            style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.w900,
                fontFamily: 'Proxima'),
          ),
          Text(
            'is',
            style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.w900,
                fontFamily: 'Proxima'),
          ),
          Row(
            children: [
              Text(
                'Life',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Proxima'),
              ),
              Text(
                '.',
                style: TextStyle(
                    color: primaryyColor,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}

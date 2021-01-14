import 'package:flutter/material.dart';

import '../../../../colors.dart';

class Trends extends StatelessWidget {
  final List data;
  Trends(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: thirdColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: primaryyColor))),
              child: Text(
                'Trends',
                style: TextStyle(
                    color: Colors.white, fontSize: 25, fontFamily: 'Proxima'),
              ),
            ),
          ]),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: thirdColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'This Week',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Proxima'),
                    ),
                    Text(
                      '${getWeek()} kg',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Proxima'),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'This Month',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Proxima'),
                    ),
                    Text(
                      '${getMonth()} kg',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Proxima'),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Proxima'),
                    ),
                    Text(
                      '${getTotal()} kg',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Proxima'),
                    )
                  ],
                )
              ],
            ),
          )
        ]));
  }

  getTotal() {
    var sum = 0;
    for (int i = 0; i <= data.length - 1; i++) {
      sum = sum + data[0]['change'];
    }

    return sum;
  }

  getWeek() {
    double sum = 0;
    for (int i = 0; i <= data.length - 1; i++) {
      sum = sum + data[i]['change'];
      if (data.length <= 7) {
        if (i == 7) {
          break;
        } else {
          continue;
        }
      }
    }
    return sum;
  }

  getMonth() {
    double sum = 0;
    for (int i = 0; i <= data.length - 1; i++) {
      sum = sum + data[i]['change'];
      if (data.length <= 30) {
        if (i == 30) {
          break;
        } else {
          continue;
        }
      }
    }
    return sum;
  }
}

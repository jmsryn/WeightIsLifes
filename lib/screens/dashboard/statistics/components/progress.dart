import 'package:flutter/material.dart';

import '../../../../colors.dart';

class Progress extends StatelessWidget {
  final List weightData;
  Progress(this.weightData);
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
                'Progress',
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
                    Column(children: [
                      Text(
                        'Avg Change',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Proxima'),
                      ),
                      Text(
                        'Daily',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Proxima'),
                      ),
                    ]),
                    Text(
                      '${getDailyAvg()} kg',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Proxima'),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      Text(
                        'Avg Change',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Proxima'),
                      ),
                      Text(
                        'Weekly',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Proxima'),
                      ),
                    ]),
                    Text(
                      '${getWeeklyAvg()} kg',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Proxima'),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      Text(
                        'Avg Change',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Proxima'),
                      ),
                      Text(
                        'Monthly',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Proxima'),
                      ),
                    ]),
                    Text(
                      '${getMonthlyAvg()} kg',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Proxima'),
                    )
                  ],
                )
              ],
            ),
          )
        ]));
  }

  getDailyAvg() {
    double sum = 0;
    for (int i = 0; i <= weightData.length - 1; i++) {
      sum = sum + weightData[i]['change'];
    }
    return sum / weightData.length;
  }

  getWeeklyAvg() {
    double sum = 0;
    for (int i = 0; i <= weightData.length - 1; i++) {
      sum = sum + weightData[i]['change'];
      if (weightData.length <= 7) {
        if (i == 7) {
          break;
        } else {
          continue;
        }
      }
    }
    return sum / weightData.length;
  }

  getMonthlyAvg() {
    double sum = 0;
    for (int i = 0; i <= weightData.length - 1; i++) {
      sum = sum + weightData[i]['change'];
      if (weightData.length <= 30) {
        if (i == 30) {
          break;
        } else {
          continue;
        }
      }
    }
    return sum / weightData.length;
  }
}

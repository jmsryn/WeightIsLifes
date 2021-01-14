import 'package:flutter/material.dart';

import '../../../../colors.dart';

class Overall extends StatelessWidget {
  final List weightData;
  Overall(this.weightData);
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
                'Overall',
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
                      'Average',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Proxima'),
                    ),
                    Text(
                      '${(getAverage(weightData).toStringAsFixed(2))} kg',
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
                      'All-Time High',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Proxima'),
                    ),
                    Text(
                      '${getAllHigh()} kg',
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
                      'All-Time Low',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Proxima'),
                    ),
                    Text(
                      '${(getAllLow())} kg',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Proxima'),
                    )
                  ],
                )
              ],
            ),
          ),
        ]));
  }

  getAverage(data) {
    List weights = [];
    double sum = 0.0;
    for (int i = 0; i <= data.length - 1; i++) {
      weights.add(data[i]['weight']);
    }
    // calculate
    for (int j = 0; j <= weights.length - 1; j++) {
      sum = sum + weights[j];
    }

    return sum / weights.length;
  }

  getAllHigh() {
    List change = [];
    var highest;
    for (int i = 0; i <= weightData.length - 1; i++) {
      change.add(weightData[i]['change']);
    }

    return change.reduce((value, element) => value > element ? value : element);
  }

  getAllLow() {
    List change = [];
    for (int i = 0; i <= weightData.length - 1; i++) {
      change.add(weightData[i]['change']);
    }

    return change.reduce((value, element) => value < element ? value : element);
  }
}

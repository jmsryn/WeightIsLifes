import 'package:flutter/material.dart';

import '../../../../colors.dart';

class BMI extends StatelessWidget {
  final String uid;
  final Map<String, dynamic> data;
  final List weightData;
  BMI(this.uid, this.data, this.weightData);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.65,
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
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: primaryyColor))),
              child: Text(
                'BMI',
                style: TextStyle(
                    color: Colors.white, fontSize: 25, fontFamily: 'Proxima'),
              ),
            ),
          ]),
          (double.parse(getBMI()) >= 24.9)
              ? Image.asset(
                  'assets/image/sad.png',
                  width: 150,
                  height: 150,
                )
              : Image.asset(
                  'assets/image/happy.png',
                  width: 150,
                  height: 150,
                ),
          Text(
            'Your BMI',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontFamily: 'Proxima'),
          ),
          Text(
            '${(getBMI())}',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Proxima'),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 1.2,
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
                  children: [
                    Text(
                      'Normal',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Proxima'),
                    ),
                    Text('18.5 - 24.9',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Proxima'))
                  ],
                ),
                Column(
                  children: [
                    Text('Overweight',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Proxima')),
                    Text('25.0 - 29.9',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Proxima'))
                  ],
                ),
                Column(
                  children: [
                    Text('Obese',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Proxima')),
                    Text('30.0 - 34.9',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Proxima'))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 1.2,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Your weight(${(weightData[weightData.length - 1]['date'])})',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Proxima'),
                    ),
                    Text(
                      'Your BMI',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Proxima'),
                    ),
                    Text(
                      'You belong to category',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Proxima'),
                    ),
                    Text(
                      'Normal weight range',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Proxima'),
                    ),
                    Text(
                      'Difference to normal',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Proxima'),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${(data['current_weight'])} kg',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Proxima')),
                    Text('${(getBMI())}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Proxima')),
                    Text(
                        (double.parse(getBMI()) <= 24.9)
                            ? 'Normal'
                            : (double.parse(getBMI()) <= 29.9)
                                ? 'Overweight'
                                : 'Obese',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Proxima')),
                    Text('51 - 70 kg',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Proxima')),
                    Text(
                        (data['current_weight'] >= 51)
                            ? (data['current_weight'] <= 70)
                                ? '0 kg'
                                : '${(data['current_weight'] - 70)} kg'
                            : '${(data['current_weight'] - 51)} kg',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Proxima')),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  getBMI() {
    var weight = data['current_weight'];
    var height = data['height'];
    var m_height = height / 100;
    var bmi = weight / (m_height * m_height);
    return bmi.toStringAsFixed(2);
  }
}

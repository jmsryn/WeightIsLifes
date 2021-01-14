import 'package:WeightIsLife/colors.dart';
import 'package:flutter/material.dart';

import 'components/bmi.dart';
import 'components/overall.dart';
import 'components/progress.dart';
import 'components/trends.dart';

class Stats extends StatelessWidget {
  final String uid;
  final List weightData;
  final Map<String, dynamic> data;
  Stats(this.uid, this.data, this.weightData);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: secondaryColor,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            BMI(uid, data, weightData),
            Trends(weightData),
            Progress(weightData),
            Overall(weightData),
            SizedBox(
              height: 50,
            )
          ],
        ));
  }
}

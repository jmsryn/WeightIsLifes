import 'package:flutter/material.dart';

import '../../../colors.dart';
import 'components/change_goal.dart';
import 'components/chart.dart';
import 'components/start_goal.dart';

class Home extends StatelessWidget {
  final String uid;
  final Map<String, dynamic> data;
  final List weightData;
  Home(this.uid, this.data, this.weightData);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: secondaryColor,
        child: Column(
          children: [
            LineChart(uid, weightData),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              alignment: Alignment.center,
            ),
            StartModal(
              data: data,
            ),
            ChangeGoal(data: data)
          ],
        ),
      ),
    ]);
  }
}

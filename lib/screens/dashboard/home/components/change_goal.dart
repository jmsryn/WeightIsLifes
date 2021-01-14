import 'package:flutter/material.dart';
import '../../../../colors.dart';

class ChangeGoal extends StatelessWidget {
  final data;
  ChangeGoal({Key key, this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.13,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Text('  Change',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Proxima',
                        fontSize: 16)),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Text('Goal  ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Proxima',
                        fontSize: 16)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: primaryyColor))),
                alignment: Alignment.center,
                child: Row(children: [
                  (getChange() > 0)
                      ? Icon(Icons.arrow_drop_up, color: Colors.green)
                      : Icon(Icons.arrow_drop_down, color: Colors.red),
                  Text('${(getChange())} kg',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Proxima',
                          fontSize: 16)),
                ]),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: primaryyColor))),
                alignment: Alignment.center,
                child: Text('${(data['goal_weight'])} kg',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Proxima',
                        fontSize: 16)),
              )
            ],
          ),
          LinearProgressIndicator(
            value: valueLinear(),
            backgroundColor: secondaryColor,
            valueColor: AlwaysStoppedAnimation(primaryyColor),
          )
        ],
      ),
    );
  }

  getChange() {
    var start = data['start_weight'];
    var current = data['current_weight'];
    var goal = data['goal_weight'];
    if (start >= goal) {
      return start - current;
    } else {
      return current - start;
    }
  }

  valueLinear() {
    var result, total;
    var start = data['start_weight'];
    var goal = data['goal_weight'];
    var current = data['current_weight'];
    if (start >= goal) {
      result = start - current;
      total = start - goal;
      total = result / total;
      return (total * 100) / 100;
    } else if (goal >= start) {
      result = current - start;
      total = goal - start;
      total = result / total;
      return (total * 100) / 100;
    }
  }
}

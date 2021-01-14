import 'package:flutter/material.dart';

import '../../../../colors.dart';

class StartModal extends StatelessWidget {
  final data;
  StartModal({Key key, this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.14,
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
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  'Start',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Proxima', fontSize: 18),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1, color: primaryyColor))),
                  child: Text('${(data['start_weight'])} kg',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Proxima',
                          fontSize: 18)))
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text('Current',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Proxima',
                        fontSize: 18)),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1, color: primaryyColor))),
                  child: Text('${(data['current_weight'])} kg',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Proxima',
                          fontSize: 18)))
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text('Goal',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Proxima',
                        fontSize: 18)),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1, color: primaryyColor))),
                  child: Text('${(data['goal_weight'])} kg',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Proxima',
                          fontSize: 18)))
            ],
          )
        ],
      ),
    );
  }
}

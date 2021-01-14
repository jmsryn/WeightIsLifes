import 'package:WeightIsLife/services/crud.dart';
import 'package:flutter/material.dart';

import '../../../../colors.dart';

class BottomModal extends StatefulWidget {
  final String uid;
  BottomModal({Key key, this.uid});
  @override
  _BottomModalState createState() => _BottomModalState(uid);
}

class _BottomModalState extends State<BottomModal> {
  final String uid;
  _BottomModalState(this.uid);
  final _dateController = TextEditingController();
  Operations _op = Operations();
  double weight;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF121212),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 20, left: 30),
                  child: Text('Add Record',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Proxima',
                          fontSize: 20.0))),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: primaryyColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontFamily: 'Proxima'),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.fitness_center,
                      color: Colors.white,
                      size: 15,
                    ),
                    hintText: 'Weight | kg',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    border: InputBorder.none,
                  ),
                  onChanged: (val) {
                    setState(() {
                      weight = double.parse(val);
                    });
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: primaryyColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2021, 1, 13),
                        lastDate: DateTime(2022));
                    _dateController.text = date.toString().substring(0, 10);
                  },
                  controller: _dateController,
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontFamily: 'Proxima'),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.date_range,
                      color: Colors.white,
                      size: 15,
                    ),
                    hintText: 'Date',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: 40, top: 20),
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            color: primaryyColor,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Proxima',
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  FlatButton(
                    onPressed: () {
                      _op
                          .saveWeight(uid, _dateController.text, weight)
                          .whenComplete(() {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/home', (Route<dynamic> route) => false);
                      });
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            color: primaryyColor,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 40, top: 20),
                        child: Text('Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Proxima',
                                fontWeight: FontWeight.bold))),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

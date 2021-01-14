import 'package:WeightIsLife/main.dart';
import 'package:WeightIsLife/screens/signup/components/round_container.dart';
import 'package:WeightIsLife/services/crud.dart';
import 'package:flutter/material.dart';
import '../../colors.dart';

class SettingsForm extends StatefulWidget {
  final String uid;
  final Map<String, dynamic> userdata;
  SettingsForm({Key key, this.uid, this.userdata});

  @override
  _SettingsFormState createState() => _SettingsFormState(uid, userdata);
}

class _SettingsFormState extends State<SettingsForm> {
  final String uid;
  final userdata;
  _SettingsFormState(this.uid, this.userdata);
  Operations _op = Operations();
  int age;
  double height, weight, goal;
  String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontFamily: 'Proxima')),
        backgroundColor: secondaryColor,
      ),
      body: Container(
        color: thirdColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
                alignment: Alignment.center,
                color: thirdColor,
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Proxima',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                )),
            Container(
              height: MediaQuery.of(context).size.height / 1.25,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                children: [
                  RoundContainer(
                    child: DropdownButton(
                        dropdownColor: secondaryColor,
                        hint: Center(
                          child: Text("Select Gender",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Proxima')),
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: primaryyColor,
                        ),
                        isExpanded: true,
                        value: gender,
                        underline: SizedBox(),
                        items: [
                          DropdownMenuItem(
                            child: Center(
                              child: Text(
                                'Male',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Proxima'),
                              ),
                            ),
                            value: 'Male',
                          ),
                          DropdownMenuItem(
                            child: Center(
                              child: Text('Female',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Proxima')),
                            ),
                            value: 'Female',
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        }),
                  ),
                  RoundContainer(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Proxima'),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 20,
                          ),
                          border: InputBorder.none,
                          hintText: '${(userdata['age'])} | Age',
                          hintStyle: TextStyle(color: Colors.white)),
                      onChanged: (value) {
                        setState(() {
                          age = int.parse(value);
                        });
                      },
                    ),
                  ),
                  RoundContainer(
                    child: TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Proxima'),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.height,
                            color: Colors.white,
                            size: 20,
                          ),
                          border: InputBorder.none,
                          hintText: '${(userdata['height'])} | Height',
                          hintStyle: TextStyle(color: Colors.white)),
                      onChanged: (value) {
                        setState(() {
                          height = double.parse(value);
                        });
                      },
                    ),
                  ),
                  RoundContainer(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Proxima'),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 20,
                          ),
                          border: InputBorder.none,
                          hintText: '${(userdata['goal_weight'])} | kg',
                          hintStyle: TextStyle(color: Colors.white)),
                      onChanged: (value) {
                        setState(() {
                          goal = double.parse(value);
                        });
                      },
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        if (gender != null &&
                            age == null &&
                            height == null &&
                            goal == null) {
                          _op.updateProfile(uid, gender, userdata['age'],
                              userdata['height'], userdata['goal_weight']);
                          Navigator.pushNamedAndRemoveUntil(context, '/home',
                              (Route<dynamic> route) => false);
                        } else if (gender == null &&
                            age != null &&
                            height == null &&
                            goal == null) {
                          _op.updateProfile(uid, userdata['gender'], age,
                              userdata['height'], userdata['goal_weight']);
                          Navigator.pushNamedAndRemoveUntil(context, '/home',
                              (Route<dynamic> route) => false);
                        } else if (gender == null &&
                            age == null &&
                            height != null &&
                            goal == null) {
                          _op.updateProfile(uid, userdata['gender'],
                              userdata['age'], height, userdata['goal_weight']);
                          Navigator.pushNamedAndRemoveUntil(context, '/home',
                              (Route<dynamic> route) => false);
                        } else if (gender == null &&
                            age == null &&
                            height == null &&
                            goal != null) {
                          _op.updateProfile(uid, userdata['gender'],
                              userdata['age'], userdata['height'], goal);
                          Navigator.pushNamedAndRemoveUntil(context, '/home',
                              (Route<dynamic> route) => false);
                        } else if (gender == null &&
                            age == null &&
                            height == null &&
                            goal == null) {
                          _op.updateProfile(
                              uid,
                              userdata['gender'],
                              userdata['age'],
                              userdata['height'],
                              userdata['goal_weight']);
                          Navigator.pushNamedAndRemoveUntil(context, '/home',
                              (Route<dynamic> route) => false);
                        } else {
                          _op.updateProfile(uid, gender, age, height, goal);
                          Navigator.pushNamedAndRemoveUntil(context, '/home',
                              (Route<dynamic> route) => false);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.07),
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: primaryyColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Update',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Proxima',
                              fontSize: 18),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

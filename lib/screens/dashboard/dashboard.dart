import 'package:WeightIsLife/screens/dashboard/statistics/wrapper.dart';
import 'package:WeightIsLife/screens/settings/wrapper.dart';
import 'package:WeightIsLife/services/auth.dart';
import 'package:WeightIsLife/services/crud.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../colors.dart';
import 'history/wrapper.dart';
import 'home/components/add_modal.dart';
import 'home/wrapper.dart';

class Dashboard extends StatefulWidget {
  final String uid;
  Dashboard(this.uid);
  @override
  _DashboardState createState() => _DashboardState(uid);
}

class _DashboardState extends State<Dashboard> {
  final String uid;
  _DashboardState(this.uid);
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  int _currentIndex = 0;
  AuthService _auth = AuthService();
  Operations _op = Operations();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future:
            users.doc(uid).collection('userProfile').doc('userDetails').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> userData = snapshot.data.data();
            return StreamBuilder(
                stream: _op.getDatas(uid),
                builder: (BuildContext context, snapshot) {
                  if (!snapshot.hasData) {
                    return SpinKitRotatingCircle(
                      color: primaryyColor,
                      size: 50.0,
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    List weightData = snapshot.data;
                    final tabs = [
                      Home(uid, userData, weightData),
                      Stats(uid, userData, weightData),
                      History(uid, userData, weightData)
                    ];
                    return Scaffold(
                      appBar: AppBar(
                        title: (_currentIndex == 0)
                            ? Text(
                                'Overview',
                                style: TextStyle(fontFamily: 'Proxima'),
                              )
                            : (_currentIndex == 1)
                                ? Text(
                                    'Statistics',
                                    style: TextStyle(fontFamily: 'Proxima'),
                                  )
                                : Text(
                                    'History',
                                    style: TextStyle(fontFamily: 'Proxima'),
                                  ),
                        backgroundColor: secondaryColor,
                        actions: [
                          IconButton(
                              icon: Icon(
                                Icons.settings,
                                color: primaryyColor,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingsForm(
                                            uid: uid, userdata: userData)));
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.logout,
                                color: primaryyColor,
                              ),
                              onPressed: () async {
                                await _auth.signOut().whenComplete(() {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      '/', (Route<dynamic> route) => false);
                                });
                              })
                        ],
                      ),
                      bottomNavigationBar: BottomNavyBar(
                        backgroundColor: secondaryColor,
                        selectedIndex: _currentIndex,
                        showElevation: true,
                        itemCornerRadius: 24,
                        curve: Curves.easeIn,
                        onItemSelected: (index) =>
                            setState(() => _currentIndex = index),
                        items: <BottomNavyBarItem>[
                          BottomNavyBarItem(
                            icon: Icon(Icons.home),
                            title: Text('Home'),
                            activeColor: primaryyColor,
                            textAlign: TextAlign.center,
                          ),
                          BottomNavyBarItem(
                            icon: Icon(Icons.multiline_chart),
                            title: Text('Statistics'),
                            activeColor: primaryyColor,
                            textAlign: TextAlign.center,
                          ),
                          BottomNavyBarItem(
                            icon: Icon(Icons.history),
                            title: Text(
                              'History',
                            ),
                            activeColor: primaryyColor,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerFloat,
                      floatingActionButton: Builder(
                        builder: (context) => FloatingActionButton(
                          backgroundColor: primaryyColor,
                          child: Icon(Icons.add),
                          onPressed: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                backgroundColor: secondaryColor,
                                builder: (context) => SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: BottomModal(
                                          uid: uid,
                                        ),
                                      ),
                                    ));
                          },
                        ),
                      ),
                      body: tabs[_currentIndex],
                    );
                  }

                  return SpinKitRotatingCircle(
                    color: primaryyColor,
                    size: 50.0,
                  );
                });
          }
          return SpinKitRotatingCircle(
            color: primaryyColor,
            size: 50.0,
          );
        });
  }
}

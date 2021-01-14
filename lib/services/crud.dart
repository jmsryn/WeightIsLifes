import 'package:cloud_firestore/cloud_firestore.dart';

class Operations {
  CollectionReference userCollections =
      FirebaseFirestore.instance.collection('users');
  CollectionReference dataCollections =
      FirebaseFirestore.instance.collection('data');
  final String dateNow = DateTime.now().year.toString() +
      "-" +
      DateTime.now().month.toString() +
      "-" +
      DateTime.now().day.toString();

  Future earlyData(String uid, String gender, int age, double height,
      double weight, double goal) async {
    await userCollections
        .doc(uid)
        .collection('userProfile')
        .doc('userDetails')
        .set({
      'gender': gender,
      'age': age,
      'height': height,
      'current_weight': weight,
      'start_weight': weight,
      'goal_weight': goal
    });
    await dataCollections
        .doc(uid)
        .collection('weightDetails')
        .doc('1')
        .set({'weight': weight, 'date': dateNow, 'change': 0});
  }

  Stream<List> getDatas(uid) async* {
    List data = [];
    await dataCollections
        .doc(uid)
        .collection('weightDetails')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        data.add(element);
      });
    });
    yield data;
  }

  Future updateWeight(String uid, int docID, String date, double weight,
      double oldWeight) async {
    var newChange;

    if (weight != oldWeight) {
      var diff = weight - oldWeight;
      await dataCollections
          .doc(uid)
          .collection('weightDetails')
          .doc('$docID')
          .get()
          .then((value) {
        if (diff >= 0) {
          newChange = value.data()['change'] - diff;
        } else {
          newChange = value.data()['change'] + diff;
        }
      });

      await dataCollections
          .doc(uid)
          .collection('weightDetails')
          .doc('$docID')
          .update({'change': newChange, 'weight': weight, 'date': date});
    } else {
      await dataCollections
          .doc(uid)
          .collection('weightDetails')
          .doc('$docID')
          .update({'weight': weight, 'date': date});
    }
  }

  Future updateProfile(
      String uid, String gender, int age, double height, double weight) async {
    await userCollections
        .doc(uid)
        .collection('userProfile')
        .doc('userDetails')
        .update({
      'gender': gender,
      'age': age,
      'height': height,
      'goal_weight': weight
    });
  }

  Future deleteWeight(String uid, int docID) async {
    await dataCollections
        .doc(uid)
        .collection('weightDetails')
        .doc('$docID')
        .delete();
  }

  Future saveWeight(String uid, String date, double weight) async {
    var lastWeight, ids, newID;
    List data = [];
    await userCollections
        .doc(uid)
        .collection('userProfile')
        .doc('userDetails')
        .get()
        .then((value) {
      lastWeight = value.data()['current_weight'] - weight;
    });
    await dataCollections
        .doc(uid)
        .collection('weightDetails')
        .get()
        .then((value) {
      ids = value.docs.length;
      value.docs.forEach((element) {
        data.add(element.id);
      });
    });
    if (ids == 0) {
      newID = int.parse(data.last) + 2;
    } else {
      // print(id);
      newID = int.parse(data.last) + 1;
    }
    await dataCollections
        .doc(uid)
        .collection('weightDetails')
        .doc('$newID')
        .set({'weight': weight, 'date': date, 'change': lastWeight});
    await userCollections
        .doc(uid)
        .collection('userProfile')
        .doc('userDetails')
        .update({'current_weight': weight});
  }
}

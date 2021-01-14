import 'package:flutter/material.dart';

import '../../../colors.dart';
import 'components/update_modal.dart';

class History extends StatefulWidget {
  final String uid;
  final weightData;
  final Map<String, dynamic> data;
  History(this.uid, this.data, this.weightData);
  @override
  _HistoryState createState() => _HistoryState(uid, data, weightData);
}

class _HistoryState extends State<History> {
  final String uid;
  final weightData;
  final Map<String, dynamic> data;
  _HistoryState(this.uid, this.data, this.weightData);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: secondaryColor,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: generateWew(),
      ),
    );
  }

  generateWew() {
    List<Widget> wew = [];
    // List newData = new List.from(weightData.reversed);
    for (int i = 0; i <= weightData.length - 1; i++) {
      wew.add(
        Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: primaryyColor),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            dense: true,
            trailing: IconButton(
              icon: Icon(
                Icons.edit_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: secondaryColor,
                    builder: (context) => SingleChildScrollView(
                          child: Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: BottomModal(
                                uid: uid,
                                weightID: int.parse(weightData[i].id),
                                weightData: weightData[i]['weight'],
                                dateData: weightData[i]['date'],
                              )),
                        ));
              },
            ),
            title: Text(
              '${(weightData[i]['date'])}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Proxima'),
            ),
            subtitle: Text(
              'Weight: ${(weightData[i]['weight'])} kg',
              style: TextStyle(color: Colors.white),
            ),
            tileColor: secondaryColor,
            leading: SizedBox(
                width: 64,
                child: (weightData.length == 1)
                    ? Row(children: [
                        Text('0 kg', style: TextStyle(color: Colors.white))
                      ])
                    : (weightData[i]['change'] > 0)
                        ? Row(
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.green,
                              ),
                              Text(
                                '${(weightData[i]['change'])} kg',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              )
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.red,
                              ),
                              Text(
                                '${(weightData[i]['change'])} kg',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              )
                            ],
                          )),
          ),
        ),
      );
    }
    return wew;
  }
}

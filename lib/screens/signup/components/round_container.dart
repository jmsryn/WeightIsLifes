import 'package:flutter/material.dart';

import '../../../colors.dart';

class RoundContainer extends StatelessWidget {
  final Widget child;
  const RoundContainer({Key key, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
      padding: EdgeInsets.all(7),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width * 0.14,
      decoration: BoxDecoration(
          border: Border.all(color: primaryyColor, width: 1),
          borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}

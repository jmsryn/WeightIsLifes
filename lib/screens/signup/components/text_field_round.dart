import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key key, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          border: Border.all(color: Color(0xFFc495fe))),
      child: child,
    );
  }
}

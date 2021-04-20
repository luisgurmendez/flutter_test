import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  final Widget child;
  ScreenContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(child: this.child, color: Color(0xFFFFFFFF));
  }
}

import 'package:flutter/widgets.dart';
import 'package:test_app/general/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onTap;

  Button(this.text, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: this.onTap,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(this.text, style: TextStyle(fontSize: 24)),
          decoration: new BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 2.0, offset: Offset.fromDirection(1.0)),
                // BoxShadow(offset: Offset.fromDirection(1.0)),
              ],
              color: Colors.blue,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
    ;
  }
}

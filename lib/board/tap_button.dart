import 'package:flutter/widgets.dart';
import 'package:test_app/general/colors.dart';

import 'board_model.dart';

class TapButton extends StatelessWidget {
  TapButton({
    Key key,
    this.owner,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var color = Colors.lightgray;

    if (this.owner == BoardItem.ai) {
      color = Colors.red;
    }

    if (this.owner == BoardItem.player) {
      color = Colors.blue;
    }

    return SizedBox(
      child: GestureDetector(
        onTap: this.onTap,
        child: Container(
          decoration: new BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  final BoardItem owner;
  final GestureTapCallback onTap;
}

import 'package:flutter/widgets.dart';
import 'package:test_app/board/board_model.dart';
import 'package:test_app/board/tap_button.dart';

class Board extends StatelessWidget {
  final int size;
  final BoardModel board;
  final Function Function(int i, int j) handleUserTap;

  Board({this.size, this.board, this.handleUserTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: GridView.count(
        crossAxisCount: this.size,
        shrinkWrap: true,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        physics: NeverScrollableScrollPhysics(),
        children: this._generateBoard(),
      ),
    );
  }

  List<Widget> _generateBoard() {
    List<Widget> boardWidgets = [];

    for (var i = 0; i < this.size; i++) {
      for (var j = 0; j < this.size; j++) {
        boardWidgets.add(TapButton(
          owner: this.board[i][j],
          onTap: handleUserTap(i, j),
        ));
      }
    }

    return boardWidgets;
  }
}

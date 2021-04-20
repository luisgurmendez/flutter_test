import 'package:flutter/widgets.dart';
import 'package:test_app/board/board_model.dart';
import 'package:test_app/general/colors.dart';

class GameState extends StatelessWidget {
  final BoardModel board;
  GameState({this.board});

  @override
  Widget build(BuildContext context) {
    int aiCount = countBoardItem(BoardItem.ai);
    int playerCount = countBoardItem(BoardItem.player);

    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('$playerCount',
              style: TextStyle(color: Colors.blue, fontSize: 56)),
          Text('$aiCount', style: TextStyle(color: Colors.red, fontSize: 56)),
        ]);
  }

  int countBoardItem(BoardItem item) {
    int itemCount = 0;
    for (var i = 0; i < this.board.board.length; i++) {
      for (var j = 0; j < this.board.board[i].length; j++) {
        if (this.board.board[i][j] == item) itemCount++;
      }
    }
    return itemCount;
  }
}

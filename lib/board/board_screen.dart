import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:test_app/board/board.dart';
import 'package:test_app/game/ai_stream.dart';
import 'package:test_app/game/game_model.dart';
import 'package:test_app/game/game_move.dart';
import 'package:test_app/game/game_state.dart';

import 'board_model.dart';

class BoardScreen extends StatefulWidget {
  final int size;
  BoardScreen({@required this.size})
      : assert(size != null && size > 0),
        super();

  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  GameModel game;
  TapTapAi ai;
  StreamSubscription aiStreamSubscription;

  @override
  void initState() {
    game = GameModel(this.widget.size);
    ai = TapTapAi(this.widget.size);
    aiStreamSubscription = ai.getStream().listen(handleMove);
    ai.start();
    game.start();
    super.initState();
  }

  handleMove(GameMove move) {
    setState(() {
      game.move(move);
    });
  }

  Function handleUserTap(int i, int j) {
    return () {
      handleMove(new GameMove(i, j, BoardItem.player));
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: Color(0xFFFFFFFF),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            GameState(board: this.game.board),
            Board(
              size: this.widget.size,
              board: this.game.board,
              handleUserTap: this.handleUserTap,
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    aiStreamSubscription.cancel();
    ai.end();
    game.end();
    super.dispose();
  }
}

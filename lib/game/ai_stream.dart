import 'dart:async';
import 'dart:math';

import 'package:test_app/board/board_model.dart';
import 'package:test_app/game/game_move.dart';

class TapTapAi {
  // ignore: close_sinks
  StreamController controller;
  int boardSize;
  Timer timer;

  TapTapAi(int boardSize) {
    this.boardSize = boardSize;
    this.controller = StreamController<GameMove>();
  }

  _play(_) {
    // Randomize the periodicity in which the ai makes a move
    bool shouldTakeAMove = Random().nextInt(10) > 4;
    if (shouldTakeAMove) {
      int i = Random().nextInt(this.boardSize);
      int j = Random().nextInt(this.boardSize);
      GameMove move = GameMove(i, j, BoardItem.ai);
      this.controller.add(move);
    }
  }

  start() {
    if (this.controller.hasListener) {
      this.timer = Timer.periodic(Duration(milliseconds: 100), _play);
    } else {
      throw Exception('No one listening');
    }
  }

  end() {
    if (this.timer != null) {
      this.timer.cancel();
    }
    this.controller.close();
  }

  Stream<GameMove> getStream() => this.controller.stream;
}

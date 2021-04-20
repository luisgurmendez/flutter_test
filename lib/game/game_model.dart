import 'package:test_app/board/board_model.dart';
import 'game_move.dart';

class GameModel {
  BoardModel board;
  bool isPlaying;
  int boardSize;

  GameModel(int size) {
    this.boardSize = size;
    this.board = new BoardModel(size);
    this.isPlaying = false;
  }

  move(GameMove move) {
    if (isPlaying) {
      this.board.update(move.i, move.j, move.item);
    } else {
      throw Exception('Not currently playing');
    }
  }

  start() {
    this.isPlaying = true;
  }

  end() {
    this.isPlaying = false;
  }
}

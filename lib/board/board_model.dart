enum BoardItem { empty, player, ai }

class BoardModel {
  List<List<BoardItem>> board;

  BoardModel(int size) {
    // inits empty board
    board =
        List.generate(size, (i) => List.generate(size, (j) => BoardItem.empty));
  }

  List<BoardItem> operator [](int index) => this.board[index];

  update(int i, int j, BoardItem item) {
    board[i][j] = item;
  }
}

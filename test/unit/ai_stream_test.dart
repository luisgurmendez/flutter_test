import 'package:test/test.dart';
import 'package:test_app/board/board_model.dart';
import 'package:test_app/game/ai_stream.dart';
import 'package:test_app/game/game_move.dart';

void main() {
  test('should get a GameMove from ai stream', () {
    TapTapAi ai = TapTapAi(4);
    ai.getStream().listen(expectAsync1((event) {
      expect(event, isA<GameMove>());
      expect(event.item, BoardItem.ai);
    }));
    ai.start();
  });

  test('should throw if no is listening', () {
    TapTapAi ai = TapTapAi(4);
    expect(() => ai.start(), throwsException);
  });
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/board/board_model.dart';
import 'package:test_app/board/tap_button.dart';

import 'package:test_app/main.dart';

import 'utils.dart';

void main() {
  group('Game screen tests', () {
    setUp(() {});
    testWidgets('should start with an empty game state',
        (WidgetTester tester) async {
      setAsMobileDeviceSize(tester);

      await tester.pumpWidget(TapTapApp());
      await goToGameScreen(tester);

      expect(find.text('0'), findsNWidgets(2));
      expect(find.byType(TapButton), findsNWidgets(25));
    });

    testWidgets('should tap on a button and change ownership',
        (WidgetTester tester) async {
      setAsMobileDeviceSize(tester);

      await tester.pumpWidget(TapTapApp());
      await goToGameScreen(tester);

      await tester.tap(find.byType(TapButton).first);
      await tester.pump();

      expect(
          find.byWidgetPredicate((widget) =>
              widget is TapButton && widget.owner == BoardItem.player),
          findsNWidgets(1));
    });
  });
}

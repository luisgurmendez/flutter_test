import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/home_screen.dart';
import 'package:test_app/main.dart';

import 'utils.dart';

void main() {
  group('Home screen tests', () {
    testWidgets('should start on home screen', (WidgetTester tester) async {
      setAsMobileDeviceSize(tester);
      await tester.pumpWidget(TapTapApp());
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}

import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

Future<void> goToGameScreen(WidgetTester tester) async {
  await tester.tap(find.text('Start!'));
  await tester.pump();
}

// simulate iphone 11 size
void setAsMobileDeviceSize(WidgetTester tester) {
  tester.binding.window.devicePixelRatioTestValue = 1.0;
  tester.binding.window.physicalSizeTestValue = Size(375, 812);
}

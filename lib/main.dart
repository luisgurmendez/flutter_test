import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/shared/screen_container.dart';
import 'home_screen.dart';
import 'board/board_screen.dart';

void main() {
  runApp(TapTapApp());
}

class TapTapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Color(0xFFFFFFFF),
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenContainer(child: HomeScreen()),
        '/game': (context) => ScreenContainer(child: BoardScreen(size: 5)),
      },
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

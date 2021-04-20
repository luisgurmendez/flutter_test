import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/widgets.dart';

import 'general/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void handleGoToGameBoard() {
      Navigator.pushNamed(context, '/game');
    }

    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(bottom: 56),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TapTap',
                style: TextStyle(fontSize: 64, color: Colors.green),
              ),
              ElevatedButton(
                child: Text('Start!', style: TextStyle(fontSize: 24)),
                onPressed: handleGoToGameBoard,
              ),
            ]),
      ),
    );
  }
}

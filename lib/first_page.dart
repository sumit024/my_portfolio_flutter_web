import 'package:flutter/material.dart';
import 'package:intro_web/colors.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  /// some important changes
  /// we are doing other changes, second commit

  ///changes from master branch, second commit from master
  ///some more code in master
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            gradientColorStart,gradientColorEnd
          ], begin: Alignment.centerLeft,
              end: Alignment.centerRight)
        ),
      )
    );
  }
}

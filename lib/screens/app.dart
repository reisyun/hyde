import 'package:flutter/material.dart';
import 'package:hyde/widgets/atoms/icon.dart';
import 'package:hyde/widgets/atoms/text.dart';
import 'package:hyde/widgets/templates/layout.dart';
import 'package:hyde/screens/home/account/index.dart';
import 'package:hyde/screens/home/discover/index.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        username: 'viichan',
        avatar: 'https://bit.ly/3LP3K2b',
        contents: [
          Content(
            FlutterRemix.function_fill,
            AccountScreen(),
          ),
          Content(
            FlutterRemix.compass_fill,
            DiscoverScreen(),
          ),
          const Content(
            FlutterRemix.group_fill,
            Center(child: HydeText("커뮤니티")),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'index/index_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 750) {
            return const IndexPage();
          } else {
            return const Scaffold(
              body: Center(child: Text("View in Big Screen")),
            );
          }
        },
      ),
    );
  }
}

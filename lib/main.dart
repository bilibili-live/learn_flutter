import 'package:flutter/material.dart';

import 'app.dart';
import 'pages/loading.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        "/": (BuildContext ctx)=> LoadingWrapper(),
        "app": (BuildContext ctx)=> Application()
      },
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacknewsapp/routes/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HackNews App",
      initialRoute: '/',
      routes: routes,
    );
  }
}

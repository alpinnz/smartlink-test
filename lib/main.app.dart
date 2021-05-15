import 'package:flutter/material.dart';
import 'package:smartlink/screen/home.screen.dart';
import 'package:smartlink/screen/service.screen.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ServiceScreen(),
    );
  }
}

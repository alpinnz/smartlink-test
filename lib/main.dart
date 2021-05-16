import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartlink/main.app.dart';
import 'package:smartlink/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Routes.createRoutes();
  runApp(MainApp());
}

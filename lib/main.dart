import 'package:flutter/material.dart';
import 'package:test_booble_translator/home_screen.dart';
import 'package:test_booble_translator/settings_screen.dart';
import 'package:test_booble_translator/test.dart';
import 'package:test_booble_translator/database.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseWithCopyrightTexts.createInstance();
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}
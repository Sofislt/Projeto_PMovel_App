import 'package:flutter/material.dart' hide PageController;
import 'package:projetofelype/pages/lojaRoupinhasPage.dart';
import 'package:projetofelype/pages/configPage.dart';
import 'package:projetofelype/pages/mainPageController.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPageController(),
    ),
  );
}
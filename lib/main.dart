import 'package:flutter/material.dart';
import 'package:projetofelype/pages/lojaRoupinhasPage.dart';
import 'package:projetofelype/pages/loginPage.dart';
import 'package:projetofelype/pages/mainPageController.dart';
import 'package:projetofelype/pages/splashPage.dart';
import 'package:projetofelype/providers/profile_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    ),
    /*
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    ),
    */
  );
}
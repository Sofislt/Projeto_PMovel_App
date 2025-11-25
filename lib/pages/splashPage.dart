import 'package:projetofelype/db/shared_prefs.dart';
import 'package:projetofelype/pages/mainPageController.dart';
import 'package:projetofelype/pages/loginPage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    await Future.delayed(Duration(seconds: 3));
    bool status = await SharedPrefs().getUserStatus();
    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MainPageController();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE395C),
      body: Center(
        child: Image.network(
            'https://a0.muscache.com/pictures/09104ce1-4a66-4284-80b2-ad0ea3e46c24.jpg'),
      ),
    );
  }
}
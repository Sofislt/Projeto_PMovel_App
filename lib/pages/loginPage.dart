import 'package:projetofelype/pages/mainPageController.dart';
import 'package:projetofelype/db/shared_prefs.dart';
import 'package:projetofelype/db/user_dao.dart';
import 'package:projetofelype/pages/mainPageController.dart';
import 'package:flutter/material.dart';
import 'package:projetofelype/pages/registerPage.dart';
import 'package:projetofelype/api/user_api.dart';
import 'package:projetofelype/Domain/user.dart';
import 'package:projetofelype/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Entre ou cadastre-se no MaréFocus',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  hintText: 'Usuário',
                  focusedBorder: buildUserOutlineInputBorder(),
                  border: buildUserOutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  focusedBorder: buildPasswordOutlineInputBorder(),
                  border: buildPasswordOutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF006A71),
                ),
                onPressed: onPressed,
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    String username = userController.text;
    String password = passwordController.text;

    User? user = await UserApi().login(username, password);

    if (user != null) {
      SharedPrefs().setUserId(user.id);
      ProfileProvider provider = context.read<ProfileProvider>();
      provider.setUser(user);
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MainPageController();
          },
        ),
      );
    } else {
      print('Usuario e/ou senha incorretos!');
    }
  }

  OutlineInputBorder buildPasswordOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }

  OutlineInputBorder buildUserOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }

  void onPressedRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return RegisterPage();
        },
      ),
    );
  }
}
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projetofelype/card_frase.dart';

class ConfigApp extends StatelessWidget {
  const ConfigApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ConfigScreen());
  }
}

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      endDrawer: NavigationDrawer(),
      body: buildAppBody(),
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(),
    ));
  }
}

buildAppBody() {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF006A71), Color(0xFF9ACBD0)],
        ),
      ),
    ),
  );
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Color(0xFF9ACBD0),
        child: ListView(
          children: <Widget>[buildHeader(context), buildMenuItems(context)],
        ),
      );

  Widget buildHeader(BuildContext context) => Container();

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading:
                  const Icon(Icons.person_rounded, color: Color(0xFFFFFFFF)),
              title: const Text(
                'Usuario',
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              onTap: () {},
            ),
            Divider(color: Color(0xFFFFFFFF)),
            ListTile(
              leading:
                  const Icon(Icons.person_rounded, color: Color(0xFFFFFFFF)),
              title: const Text(
                'Frase motivacional',
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return CardFrase(
                    );
                  },
                );
              },
            ),
            Divider(color: Color(0xFFFFFFFF)),
            ListTile(
              leading:
                  const Icon(Icons.person_rounded, color: Color(0xFFFFFFFF)),
              title: const Text(
                'Configurações',
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              onTap: () {},
            ),
            Divider(color: Color(0xFFFFFFFF)),
            ListTile(
              leading: const Icon(
                Icons.local_grocery_store,
                color: Color(0xFFFFFFFF),
              ),
              title: const Text(
                'Log out',
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              onTap: () {},
            ),
            Divider(color: Color(0xFFFFFFFF)),
          ],
        ),
      );
}

buildBottomNavigationBar() {
  return Container(
    height: 60,
    color: Color(0xFF005E65),
    child: Padding(
      padding: EdgeInsets.only(
        top: 4.0,
        bottom: 4.0,
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.home, size: 37),
          Icon(Icons.sports_esports, size: 37),
          Icon(Icons.bar_chart, size: 37),
        ],
      ),
    ),
  );
}

buildAppBar() {
  return AppBar(
    backgroundColor: Color(0xFF005E65),
    leading: Icon(Icons.person, size: 35),
    actions: [],
  );
}

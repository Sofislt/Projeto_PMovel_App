import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pathPage.dart';

class menuAvatar extends StatefulWidget {
  const menuAvatar ({super.key});

  @override
  State<menuAvatar> createState() => _menuAvatar();
}

class _menuAvatar extends State<menuAvatar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Color(0xFFF6FBF7),
          appBar: buildAppBar(),
          //body: buildListView(),
          drawer: avatarNavigationDrawer(),
          endDrawer: menuNavigationDrawer(),
          body: buildBody(),
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: buildFloatingActionButton(),
          bottomNavigationBar: buildBottomAppBar(),
        ),
      ),
    );
  }
}

class avatarNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
    backgroundColor: Color(0xFF9ACBD0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context)
        ],
      ),
    ),
  );
  Widget buildHeader(BuildContext context) => Container();
  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [

          ListTile(
            leading: const Icon(Icons.person_rounded, color: Color(0xFFFFFFFF),),
            title: const Text('Personalizar Avatar', style: TextStyle(color: Color(0xFFFFFFFF),),),
            onTap: () {},
          ),
          const Divider (color: Color(0xFFFFFFFF)),
          ListTile(
            leading: const Icon(Icons.local_grocery_store, color: Color(0xFFFFFFFF),),
            title: const Text('Loja de Cosméticos', style: TextStyle(color: Color(0xFFFFFFFF),),),
            onTap: () {},
          ),
        ],
      )
  );
}

class menuNavigationDrawer extends StatelessWidget { //aqui o
  @override
  Widget build(BuildContext context) => Drawer(
    backgroundColor: Color(0xFF9ACBD0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[buildHeader(context), buildMenuItems(context)],
      ),
    ),
  );
  Widget buildHeader(BuildContext context) => Container();
  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.person_rounded, color: Color(0xFFFFFFFF)),
          title: const Text(
            'Usuario',
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
          onTap: () {},
        ),
        Divider(color: Color(0xFFFFFFFF)),
        ListTile(
          leading: const Icon(Icons.person_rounded, color: Color(0xFFFFFFFF)),
          title: const Text(
            'Frase diária',
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
          onTap: () {},
        ),
        Divider(color: Color(0xFFFFFFFF)),
        ListTile(
          leading: const Icon(Icons.person_rounded, color: Color(0xFFFFFFFF)),
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

buildAppBar() {
  return AppBar(
    //leading: IconButton(onPressed: () {}, icon: Icon(Icons.person_rounded),),
    centerTitle: true,
    backgroundColor: Color(0xFF005E65),
    title: Text(
      'App Name',
      style: TextStyle(
        fontSize: 26,
        color: Colors.black,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

buildBody() {
  return Column(
    children: [
      Container(
          color: Color(0xFF138990),
          child: Column(
            children: [
              const TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0, color: Colors.white),
                  insets: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 13.0), // move up by reducing bottom inset
                ),
                tabs: [
                  Tab(text: 'Diário'),
                  Tab(text: 'Semanal'),
                  Tab(text: 'Mensal'),
                  Tab(text: 'Anual'),
                ],
              ),
            ],
          )
      ),
      PathPage(),
    ],
  );
}

buildFloatingActionButton() {
  return FloatingActionButton(
    onPressed: () {},
    elevation: 0,
    backgroundColor: Color(0xFF006A71),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32.0),
    ),
    foregroundColor: Color(0xFF000000),
    child: const Icon(
      Icons.add,
      size: 40.0,
    ),
  );
}

buildBottomAppBar() {
  return BottomAppBar(
    shape: const CircularNotchedRectangle(),
    color: Color(0xFF006A71),
    child: IconTheme(
      data: IconThemeData(),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 40.0,
              onPressed: () {},
              icon: Icon(Icons.home_filled),
            ),
            SizedBox(width: 24.0),
            IconButton(
              iconSize: 40.0,
              onPressed: () {},
              icon: Icon(Icons.bar_chart_rounded),
            ),
          ],
        ),
      ),
    ),
  );
}
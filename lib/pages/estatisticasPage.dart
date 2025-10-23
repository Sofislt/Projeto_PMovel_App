import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Estatisticas extends StatefulWidget {
  const Estatisticas({super.key});

  @override
  State<Estatisticas> createState() => _EstatisticasState();
}

class _EstatisticasState extends State<Estatisticas> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: buildStatisticsBody(),
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

buildStatisticsBody() {

}
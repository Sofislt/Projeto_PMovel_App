import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menuAvatar extends StatefulWidget {
  const menuAvatar ({super.key});

  @override
  State<menuAvatar> createState() => _menuAvatar();
}

class _menuAvatar extends State<menuAvatar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF6FBF7),
        appBar: buildAppBar(),
        //body: buildListView(),
        drawer: NavigationDrawer(),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF006A71),
                    Color(0xFF9ACBD0),
                  ],
                )
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          color: Color(0xFF005E65),
          child: Padding(
            padding:  EdgeInsets.only(top: 4.0, bottom: 4.0, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.home, size: 37),
                Icon(Icons.sports_esports, size: 37),
                Icon(Icons.bar_chart, size: 37),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
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

buildAppBar() {
  return AppBar(
    //leading: IconButton(onPressed: () {}, icon: Icon(Icons.person_rounded),),
    centerTitle: true,
    backgroundColor: Color(0xFF005E65),
    actions: [
      IconButton(onPressed: () => NavigationDrawer, icon: Icon(
        Icons.list,
        color: Colors.black,
        size: 36,
      ),),
    ],

  );
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal ({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF6FBF7),
        appBar: buildAppBar(),
        body: buildBody(), //body: buildListView(),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: buildFloatingActionButton(),
        bottomNavigationBar: buildBottomAppBar(),
      ),
    );
  }
}

buildAppBar() {
  return AppBar(
    centerTitle: true,
    backgroundColor: Color(0xFF006A71),

    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.person_4_rounded,
          color: Colors.black,
          size: 36,
        ),

        Text(
          'App Name',
          style: TextStyle(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),

        Icon(
          Icons.list,
          color: Colors.black,
          size: 36,
        ),
      ],
    ),


  );
}

buildBody() {

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
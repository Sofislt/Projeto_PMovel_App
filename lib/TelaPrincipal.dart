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
          //body: buildListView(),
        ),
    );
  }
}

buildAppBar() {
  return AppBar(
    centerTitle: true,
    backgroundColor: Color(0xFF006A71),
    actions: [

      Icon(
        Icons.person_4_rounded,
        color: Colors.black,
        size: 36,
      ),
      Icon(
        Icons.list,
        color: Colors.black,
        size: 36,
      ),
    ],
    title: Text(
      'App Name',
        style: TextStyle(
          fontSize: 26,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
}

buildAppBarContainer() {

}

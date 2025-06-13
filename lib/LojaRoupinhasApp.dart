import 'package:flutter/material.dart';


class LojaRoupinhasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LojaPage(),
    );
  }
}


class LojaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loja de Roupinhas'),
        backgroundColor: Color(0xFF006A71),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            child: Column(
              children: [
                Image.asset('assets/vestido.jpg'),
                Text('Vestido Encantado'),
                Text('Um vestido mágico com brilho especial.'),
                Text('R\$ 120'),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Image.asset('assets/camisa.jpg'),
                Text('Blusa Fashion'),
                Text('Sempre estiloso.'),
                Text('R\$ 250'),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingActionButton(),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }
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
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
        title: Text('Loja de Roupinhas', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xFF006A71),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16), // Espaçamento da grade da borda da tela
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Borda mais arredondada
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: [
                  Image.asset('assets/vestido.jpg',
                    width: 92,  // largura desejada em pixels
                    height: 92, // altura desejada em pixels
                    fit: BoxFit.cover, // como a imagem deve se ajustar ao espaço
                  ),
                  Text(
                    'Vestido',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Um vestido mágico com brilho especial.',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'R\$ 120',
                    style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Borda mais arredondada
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: [
                  Image.asset('assets/chapeu.jpg',
                    width: 92,  // largura desejada em pixels
                    height: 92, // altura desejada em pixels
                    fit: BoxFit.cover, // como a imagem deve se ajustar ao espaço
                  ),
                  Text(
                    'Chapéu de praia',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Um ótimo chapéu para ir à praia.',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'R\$ 30',
                    style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingActionButton(),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }
}

buildText({required text, color, fontSize, fontWeight}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
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
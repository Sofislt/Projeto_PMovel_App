import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TaskCard.dart';

class PathPage extends StatefulWidget {
  const PathPage({super.key});

  @override
  State<PathPage> createState() => _PathPageState();
}

class _PathPageState extends State<PathPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.only(top: 20.0,bottom: 40.0),

                decoration: BoxDecoration(
                  color: Color(0xFF006A71),// border color
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF006A71),// border color
                  shape: BoxShape.circle,
                ),
              ),
              ListTile(title: Text('Diário - Item 1')),
              ListTile(title: Text('Diário - Item 2')),
              ListTile(title: Text('Diário - Item 3')),
              TaskCard(titulo: 'Ler o roteiro da feira literária', descricao: '17 páginas',),
              TaskCard(titulo: 'Costurar saia jeans', descricao: '',),
            ],
          ),
          Center(child: Text("Diário Conteúdo")),
          Center(child: Text("Semanal Conteúdo")),
          Center(child: Text("Mensal Conteúdo")),
          Center(child: Text("Anual Conteúdo")),
        ],
      ),
    );
  }
}
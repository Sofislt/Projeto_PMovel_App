import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetofelype/Widgets/TaskCard.dart';
import 'package:projetofelype/db/taskcard_dao.dart';

class PathPage extends StatefulWidget {
  const PathPage({super.key});

  @override
  State<PathPage> createState() => _PathPageState();
}

class _PathPageState extends State<PathPage> {
  List listaTaskCard = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaTaskCard = await TaskCardDao().listarTaskCards();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          ListView.builder(
              padding: EdgeInsets.all(16.0),
              //buildTaskBullet(),
              itemCount: listaTaskCard.length,
              itemBuilder: (context, i) {
                return TaskCard(
                  task: listaTaskCard[i],
                );
              }
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

buildTaskBullet() {
  return Container(
    width: 60,
    height: 60,
    margin: const EdgeInsets.only(top: 20.0,bottom: 40.0),

    decoration: BoxDecoration(
      color: Color(0xFF006A71),// border color
      shape: BoxShape.circle,
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:projetofelype/Domain/task.dart';
import 'package:projetofelype/Widgets/LocalCard.dart';
import 'package:projetofelype/Domain/Local.dart';
import 'package:projetofelype/pages/homePage.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  late Future<List<Local>> futurelistaLocais;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: FutureBuilder<List<Local>>(
          future: futurelistaLocais,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Local> lista = snapshot.requireData;
              return buildListView(lista);
            }

            return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }

  buildListView(List<Local> listaLocais) {
    return ListView.builder(
      itemCount: listaLocais.length,
      itemBuilder: (context, i) {
        return LocalCard(
            local: listaLocais[i],
        );
      },
    );
  }
}

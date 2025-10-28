import 'package:flutter/material.dart';
import 'package:projetofelype/api/tasks_api.dart';
import 'package:projetofelype/Widgets/TaskCard.dart';
import 'package:projetofelype/Domain/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Task>> futureListaTask;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    futureListaTask = TasksApi().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: DefaultTabController(
        length: 4,
        child:  Column(
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
                      insets: EdgeInsets.fromLTRB(
                        40.0,
                        0.0,
                        40.0,
                        13.0,
                      ), // move up by reducing bottom inset
                    ),
                    tabs: [
                      Tab(text: 'Diário'),
                      Tab(text: 'Semanal'),
                      Tab(text: 'Mensal'),
                      Tab(text: 'Anual'),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: FutureBuilder<List<Task>>(
                      future: futureListaTask,
                      builder: (context, snapshot) {
                        if(snapshot.hasData) {
                          List<Task> lista = snapshot.requireData;
                          return buildListView(lista);
                        }
                        return Center(child: CircularProgressIndicator());
                      }
                    ),
                  ),
                  Center(child: Text("Semanal Conteúdo")),
                  Center(child: Text("Mensal Conteúdo")),
                  Center(child: Text("Anual Conteúdo")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

buildListView(List<Task> listaTask) {
  return ListView.builder(
    padding: const EdgeInsets.all(16.0),
    itemCount: listaTask.length,
    itemBuilder: (context, i) {
      return TaskCard(
        task: listaTask[i],
      );
    },
  );
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
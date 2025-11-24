import 'package:flutter/material.dart';
import 'package:projetofelype/Domain/chart.dart';
import 'package:projetofelype/api/chart_api.dart';

class Estatisticas extends StatefulWidget {
  const Estatisticas({super.key});

  @override
  State<Estatisticas> createState() => _EstatisticasState();
}

class _EstatisticasState extends State<Estatisticas> {
  late Future<Chart> futureChart;

  @override
  void initState() {
    super.initState();
    futureChart = ChartApi().get();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: const Color(0xFFF6FBF7),
          appBar: buildAppBar(),
          //body: buildListView(),
          drawer: AvatarNavigationDrawer(),
          endDrawer: MenuNavigationDrawer(),
          body: buildStatisticsBody(),
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: buildFloatingActionButton(),
          bottomNavigationBar: buildBottomAppBar(),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      //leading: IconButton(onPressed: () {}, icon: Icon(Icons.person_rounded),),
      centerTitle: true,
      backgroundColor: Color(0xFF005E65),
      title: Text(
        'App Name',
        style: TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.w800),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      elevation: 0,
      backgroundColor: Color(0xFF006A71),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      foregroundColor: Color(0xFF000000),
      child: const Icon(Icons.add, size: 40.0),
    );
  }

  BottomAppBar buildBottomAppBar() {
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
              IconButton(iconSize: 40.0, onPressed: () {}, icon: Icon(Icons.home_filled)),
              SizedBox(width: 24.0),
              IconButton(iconSize: 40.0, onPressed: () {}, icon: Icon(Icons.bar_chart_rounded)),
            ],
          ),
        ),
      ),
    );
  }

  buildStatisticsBody() {
    return FutureBuilder<Chart>(
      future: futureChart,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          print(snapshot.requireData.url);

          final chart = snapshot.data!;
          if (chart.url.isEmpty) {
            return const Center(child: Text('Nenhuma imagem disponível.'));
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                chart.url,
                fit: BoxFit.contain,
                errorBuilder:
                    (context, error, stackTrace) => const Text('Erro ao carregar imagem.'),
              ),
            ),
          );
        } else {
          print(snapshot.requireData.url);
          return const Center(child: Text('Sem dados.'));
        }
      },
    );
  }
}

class AvatarNavigationDrawer extends StatelessWidget {
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
          title: const Text('Personalizar Avatar', style: TextStyle(color: Color(0xFFFFFFFF))),
          onTap: () {},
        ),
        const Divider(color: Color(0xFFFFFFFF)),
        ListTile(
          leading: const Icon(Icons.local_grocery_store, color: Color(0xFFFFFFFF)),
          title: const Text('Loja de Cosméticos', style: TextStyle(color: Color(0xFFFFFFFF))),
          onTap: () {},
        ),
      ],
    ),
  );
}

class MenuNavigationDrawer extends StatelessWidget {
  //aqui o
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
          title: const Text('Usuario', style: TextStyle(color: Color(0xFFFFFFFF))),
          onTap: () {},
        ),
        Divider(color: Color(0xFFFFFFFF)),
        ListTile(
          leading: const Icon(Icons.person_rounded, color: Color(0xFFFFFFFF)),
          title: const Text('Frase diária', style: TextStyle(color: Color(0xFFFFFFFF))),
          onTap: () {},
        ),
        Divider(color: Color(0xFFFFFFFF)),
        ListTile(
          leading: const Icon(Icons.person_rounded, color: Color(0xFFFFFFFF)),
          title: const Text('Configurações', style: TextStyle(color: Color(0xFFFFFFFF))),
          onTap: () {},
        ),
        Divider(color: Color(0xFFFFFFFF)),
        ListTile(
          leading: const Icon(Icons.local_grocery_store, color: Color(0xFFFFFFFF)),
          title: const Text('Log out', style: TextStyle(color: Color(0xFFFFFFFF))),
          onTap: () {},
        ),
        Divider(color: Color(0xFFFFFFFF)),
      ],
    ),
  );
}

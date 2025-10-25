//i have modified the tela principal file, but it has the same problem:
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'estatisticasPage.dart';
import 'calendarPage.dart';
import 'pomodoroPage.dart';

class MainPageController extends StatefulWidget {
  const MainPageController({super.key});

  @override
  State<MainPageController> createState() => _MainPageControllerState();
}

class _MainPageControllerState extends State<MainPageController> {
  bool showActions = false;
  int selectedIndex = 0;

  var pages = [
    HomePage(),
    Estatisticas(),
    CalendarPage(),
    PomodoroPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Color(0xFFF6FBF7),
            appBar: buildAppBar(),
            //body: buildListView(),
            drawer: avatarNavigationDrawer(),
            endDrawer: menuNavigationDrawer(),
            body: buildBody(),
            /*body: pages[selectedIndex],*/
            extendBody: true,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: buildFloatingActionButton(),
            bottomNavigationBar: buildBottomNavigationBar(),
          ),
        ),
    );
  }

  buildAppBar() {
    return AppBar(
      //leading: IconButton(onPressed: () {}, icon: Icon(Icons.person_rounded),),
      centerTitle: true,
      backgroundColor: Color(0xFF005E65),
      title: Text(
        'App Name',
        style: TextStyle(
          fontSize: 26,
          color: Colors.black,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  buildBody() {
    return Stack(
      children: [
        Positioned.fill(child: pages[selectedIndex]),
        if(showActions)
          Positioned.fill(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  showActions = false;
                });
              },

              child: Container(
                color: Colors.black.withOpacity(0.5), // translucent overlay
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Adicionar nota',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ),
            )
          ),
      ],
    );
  }

  buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      elevation: 0,
      backgroundColor: Color(0xFF006A71),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      foregroundColor: Color(0xFF000000),
      child: const Icon(Icons.add, size: 40.0),
    );
  }

  buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      backgroundColor: Color(0xFF006A71),
      unselectedItemColor: Colors.black45,
      selectedItemColor: Colors.black,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_rounded),
          label: "Estatísticas",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_sharp),
          label: "Calendário",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time_filled),
          label: "Pomodoro",
        ),
      ],
    );
  }
}

class avatarNavigationDrawer extends StatelessWidget {
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
          title: const Text(
            'Personalizar Avatar',
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
          onTap: () {},
        ),
        const Divider(color: Color(0xFFFFFFFF)),
        ListTile(
          leading: const Icon(
            Icons.local_grocery_store,
            color: Color(0xFFFFFFFF),
          ),
          title: const Text(
            'Loja de Cosméticos',
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
          onTap: () {},
        ),
      ],
    ),
  );
}

class menuNavigationDrawer extends StatelessWidget {
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
          title: const Text(
            'Usuario',
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
          onTap: () {},
        ),
        Divider(color: Color(0xFFFFFFFF)),
        ListTile(
          leading: const Icon(Icons.person_rounded, color: Color(0xFFFFFFFF)),
          title: const Text(
            'Frase diária',
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
          onTap: () {},
        ),
        Divider(color: Color(0xFFFFFFFF)),
        ListTile(
          leading: const Icon(Icons.person_rounded, color: Color(0xFFFFFFFF)),
          title: const Text(
            'Configurações',
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
          onTap: () {},
        ),
        Divider(color: Color(0xFFFFFFFF)),
        ListTile(
          leading: const Icon(
            Icons.local_grocery_store,
            color: Color(0xFFFFFFFF),
          ),
          title: const Text(
            'Log out',
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
          onTap: () {},
        ),
        Divider(color: Color(0xFFFFFFFF)),
      ],
    ),
  );
}
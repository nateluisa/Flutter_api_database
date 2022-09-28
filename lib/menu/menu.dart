import 'package:flutter/material.dart';
import 'package:flutter_api/pages/login.dart';

import '../pages/clients/ListClient.dart';
import '../pages/sales/SaleList.dart';

void main() {
  runApp(const Menu());
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Container(
              width: 60.0,
              child: PopupMenuButton<String>(
                  icon: ClipOval(
                    child: Align(
                      heightFactor: 1,
                      widthFactor: 1,
                      child: Image.asset('assets/images/userlogo.png'),
                    ),
                  ),
                  // onSelected: choiceAction,
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: '1',
                        child: Text('Usuário: Isadora'),
                      ),
                      PopupMenuItem<String>(
                        value: '2',
                        child: Text('Precisa de ajuda?'),
                      ),
                      PopupMenuItem<String>(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contextNew) =>
                                  LoginPage(loginContext: context),
                            ),
                          );
                        },
                        value: '3',
                        child: Text('Sair'),
                      ),
                    ];
                  }),
            )
          ],
          backgroundColor: Color.fromARGB(255, 80, 62, 115),
          automaticallyImplyLeading: false,
          title: const Text(''),
        ),
        body: Container(
          color: Colors.deepPurple[10],
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsetsDirectional.all(30),
          height: 600,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 200.0,
                color: Colors.deepPurple[900],
              ),
              Container(
                width: 200.0,
                color: Colors.deepPurple[700],
              ),
              Container(
                width: 200.0,
                color: Colors.deepPurple[500],
              ),
              Container(
                width: 200.0,
                color: Colors.deepPurple[300],
              ),
              Container(
                width: 200.0,
                color: Colors.deepPurple[100],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 80, 62, 115),
          onPressed: () {
            print('voltou pra home');
          },
          tooltip: 'Inicio',
          child: const Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _DemoBottomAppBar(
          fabLocation: _fabLocation,
        ),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Color.fromARGB(255, 80, 62, 115),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Vendas',
              icon: const Icon(Icons.sell),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextNew) => SallesScreen(
                      sallesContext: context,
                    ),
                  ),
                );
              },
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Financeiro',
              icon: const Icon(Icons.monetization_on_rounded),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Clientes',
              icon: const Icon(Icons.account_circle_sharp),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contextNew) => ClientsScreen(
                        context,
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

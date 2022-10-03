import 'package:flutter/material.dart';
import 'package:flutter_api/pages/login.dart';
import 'package:flutter_api/widgets/dashboard.dart';
import 'package:flutter_api/widgets/main_cards.dart';

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
        body: MyDashboard(),
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
                    builder: (contextNew) => SalesScreen(
                      salesContext: context,
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

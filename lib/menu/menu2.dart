import 'package:flutter/material.dart';
import 'package:flutter_api/pages/clients/ListClient.dart';
import 'package:flutter_api/pages/home.dart';
import 'package:flutter_api/pages/login.dart';
import 'package:flutter_api/pages/sales/SaleList.dart';

class Menu2 extends StatelessWidget {
  const Menu2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromARGB(255, 80, 62, 115),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_outlined),
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_circle_outlined),
            icon: Icon(Icons.account_circle),
            label: 'Clientes',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_basket_outlined),
            icon: Icon(Icons.shopping_basket_rounded),
            label: 'Vendas',
          ),
        ],
      ),
      body: <Widget>[
        IndexedStack(
          index: 0,
          //children: _pages,
        ),
        IndexedStack(
          index: 1,
          //children: _pages,
        ),
        IndexedStack(
          index: 2,
          //children: _pages,
        )
      ][currentPageIndex],
    );
  }
}

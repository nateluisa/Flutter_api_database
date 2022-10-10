import 'package:flutter/material.dart';
import 'package:flutter_api/widgets/dashboard.dart';
import '../animations/list.dart';
import '../pages/clients/ListClient.dart';
import '../pages/login.dart';
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
  final FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;

  bool visivel = true;

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
                      const PopupMenuItem<String>(
                        value: '1',
                        child: Text('Usuário: Isadora'),
                      ),
                      const PopupMenuItem<String>(
                        value: '2',
                        child: Text('Precisa de ajuda?'),
                      ),
                      PopupMenuItem<String>(
                        onTap: () {
                         // Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (newContext) =>
                                      LoginPage(loginContext: context)));
                        },
                        value: '3',
                        child: const Text('Sair'),
                      ),
                    ];
                  }),
            )
          ],
          backgroundColor: const Color.fromARGB(255, 80, 62, 115),
          automaticallyImplyLeading: false,
          title: const Text(''),
        ),
        body: Container(
          color: Colors.deepPurple[100],
          child: AnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              opacity: visivel ? 1 : 0,
              child: const MyDashboard()),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 80, 62, 115),
          onPressed: () {
            setState(() {
              visivel = !visivel;
            });
          },
          tooltip: 'Visibilidade da dashboard',
          child: const Icon(Icons.remove_red_eye),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.deepPurple[100],
        bottomNavigationBar: MyBottomAppBar(
          fabLocation: _fabLocation,
        ),
      ),
    );
  }
}

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    super.key,
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
      color: const Color.fromARGB(255, 80, 62, 115),
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
            //if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Financeiro',
              icon: const Icon(Icons.monetization_on_rounded),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Clientes',
              icon: const Icon(Icons.account_circle_sharp),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, anotherAnimation) {
                      return ClientsScreen(context);
                    },
                    transitionDuration: Duration(milliseconds: 400),
                    transitionsBuilder:
                        (context, animation, anotherAnimation, child) {
                      animation = CurvedAnimation(
                          curve: Curves.bounceIn, parent: animation);
                      return Align(
                        child: SizeTransition(
                          sizeFactor: animation,
                          child: child,
                          axisAlignment: 0.0,
                        ),
                      );
                    }));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (contextNew) => ClientsScreen(
                //         context,
                //       ),
                //     ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

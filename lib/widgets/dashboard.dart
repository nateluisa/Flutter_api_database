import 'package:flutter/material.dart';
import 'package:flutter_api/pages/buy/ShoppingList.dart';
import 'package:flutter_api/pages/clients/ListClient.dart';
import 'package:flutter_api/pages/financial/ListFinancial.dart';
import 'package:flutter_api/pages/financial/payment.dart';
import 'package:flutter_api/pages/financial/receive.dart';
import 'package:flutter_api/pages/provider/ProviderList.dart';
import 'package:flutter_api/pages/sales/SaleList.dart';
import 'package:flutter_api/widgets/card_picture.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

bool visivel = true;

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: GridView.count(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 1,
        mainAxisSpacing: 3,
        crossAxisCount: 1,
        primary: false,
        childAspectRatio: 4 / 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(1),
            alignment: Alignment.center,
            height: 180,
            child: SizedBox(
              height: 180,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1500),
                opacity: visivel ? 1 : 0,
                child: Card(
                  elevation: 6,
                  shadowColor: Colors.grey,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.monetization_on,
                            size: 35,
                            color: Colors.deepPurple,
                          ),
                          title: Text(
                            'Financeiro',
                            style: TextStyle(fontSize: 23),
                          ),
                          subtitle: Text(
                              'Deseja buscar pelo ultimo lançamento realizado?'),
                          isThreeLine: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text('ESCONDER'),
                              onPressed: () {
                                setState(() {
                                  visivel = !visivel;
                                });
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('IR PARA'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (contextNew) => FinancialList(
                                      financialContext: context,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 180,
            child: SizedBox(
              height: 180,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.shopping_basket_rounded,
                          size: 35,
                          color: Colors.deepPurple,
                        ),
                        title: Text(
                          'Compras',
                          style: TextStyle(fontSize: 23),
                        ),
                        subtitle:
                            Text('Deseja buscar pela ultima compra realizada?'),
                        isThreeLine: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            child: const Text('ESCONDER'),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('IR PARA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (contextNew) => ShoppingList(
                                    shoppingContext: context,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 180,
            child: SizedBox(
              height: 180,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.sell,
                          size: 35,
                          color: Colors.deepPurple,
                        ),
                        title: Text(
                          'Vendas',
                          style: TextStyle(fontSize: 23),
                        ),
                        subtitle:
                            Text('Deseja buscar pela ultima venda realizada?'),
                        isThreeLine: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            child: const Text('ESCONDER'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('IR PARA'),
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
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 180,
            child: SizedBox(
              height: 180,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.account_circle,
                          size: 35,
                          color: Colors.deepPurple,
                        ),
                        title: Text(
                          'Clientes',
                          style: TextStyle(fontSize: 23),
                        ),
                        subtitle:
                            Text('Deseja navegar ate a lista de clientes?'),
                        isThreeLine: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            child: const Text('ESCONDER'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('IR PARA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (contextNew) => ClientsScreen(
                                    context,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 180,
            child: SizedBox(
              height: 180,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.account_circle_outlined,
                          size: 35,
                          color: Colors.deepPurple,
                        ),
                        title: Text(
                          'Fornecedores',
                          style: TextStyle(fontSize: 23),
                        ),
                        subtitle:
                            Text('Deseja navegar ate a lista de fornecedores?'),
                        isThreeLine: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            child: const Text('ESCONDER'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('IR PARA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (contextNew) => ProviderScreen(
                                    providerContext: context,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_api/pages/buy/ShoppingList.dart';
import 'package:flutter_api/pages/clients/ListClient.dart';
import 'package:flutter_api/pages/financial/ListFinancial.dart';
import 'package:flutter_api/pages/provider/ProviderList.dart';
import 'package:flutter_api/pages/sales/SaleList.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[100],
      child: GridView.count(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 1,
        mainAxisSpacing: 3,
        crossAxisCount: 1,
        primary: false,
        childAspectRatio: 10 / 4,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(1),
            alignment: Alignment.center,
            height: 150,
            child: SizedBox(
              height: 150,
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
                          // TextButton(
                          //   child: const Text('REMOVER'),
                          //   onPressed: () {
                          //
                          //   },
                          // ),
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
          Container(
            alignment: Alignment.center,
            height: 150,
            child: SizedBox(
              height: 150,
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
                          // TextButton(
                          //   child: const Text('REMOVER'),
                          //   onPressed: () {},
                          // ),
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
            height: 150,
            child: SizedBox(
              height: 150,
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
                          // TextButton(
                          //   child: const Text('REMOVER'),
                          //   onPressed: () {
                          //     /* ... */
                          //   },
                          // ),
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
            height: 150,
            child: SizedBox(
              height: 150,
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
                          // TextButton(
                          //   child: const Text('REMOVER'),
                          //   onPressed: () {
                          //     /* ... */
                          //   },
                          // ),
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
            height: 150,
            child: SizedBox(
              height: 150,
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
                          // TextButton(
                          //   child: const Text('REMOVER'),
                          //   onPressed: () {
                          //     /* ... */
                          //   },
                          // ),
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

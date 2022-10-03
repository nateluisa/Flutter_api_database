import 'package:flutter/material.dart';
import 'package:flutter_api/pages/clients/ListClient.dart';
import 'package:flutter_api/pages/financial/ListFinancial.dart';
import 'package:flutter_api/pages/financial/payment.dart';
import 'package:flutter_api/pages/financial/receive.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

List<int> top = <int>[];
List<int> bottom = <int>[0];

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Container(
      color: Colors.grey[300],
      child: GridView.count(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(4),
        crossAxisSpacing: 1,
        mainAxisSpacing: 3,
        crossAxisCount: 1,
        primary: false,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 8,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                color: Colors.deepPurple[70],
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Financeiro',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle:
                      const Text('Deseja buscar pela lista de lançamentos?'),
                      leading: Icon(
                        Icons.monetization_on,
                        color: Colors.deepPurple[500],
                        size: 37,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contextNew) => PaymentScreen(
                              paymentContext: context,
                            ),
                          ),
                        );
                      },
                      title: const Text(
                        'Contas a pagar',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      leading: Icon(
                        Icons.money_off,
                        color: Colors.deepPurple[500],
                        size: 30,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contextNew) => ReceiveScreen(
                              receiveContext: context,
                            ),
                          ),
                        );
                      },
                      title: const Text(
                        'Contas a receber',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      leading: Icon(
                        Icons.attach_money,
                        color: Colors.deepPurple[500],
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(1),
            alignment: Alignment.center,
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.monetization_on, size: 35),
                        title: Text(
                          'Financeiro',
                          style: TextStyle(fontSize: 23),
                        ),
                        subtitle:
                            Text('Deseja buscar pelo ultimo lançamento realizado?'),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.sell, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.account_circle, size: 35),
                        title: Text(
                          'Clientes',
                          style: TextStyle(fontSize: 23),
                        ),
                        subtitle: Text('Deseja navegar ate a lista de clientes?'),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.account_circle_outlined, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[50],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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
            height: 250 ,
            child: SizedBox(
              height: 250,
              child: Card(
                elevation: 6,
                shadowColor: Colors.grey,
                color: Colors.deepPurple[50],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.shopping_basket_rounded, size: 35),
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

        ],
      ),
    );
  }
}




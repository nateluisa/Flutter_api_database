import 'package:flutter/material.dart';

import 'SaleList.dart';

class NewSalle extends StatefulWidget {
  final name;
  final adress;
  final number;
  final district;
  final telephone;

  const NewSalle(
      {Key? key,
      this.name,
      this.adress,
      this.number,
      this.district,
      this.telephone,
      BuildContext? sallesContext})
      : super(key: key);

  @override
  State<NewSalle> createState() => _NewSalleState();
}

class _NewSalleState extends State<NewSalle> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sellerController = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _creditController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 80, 62, 115),
        body: DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 80, 62, 115),
                title: const Text('Nova venda'),
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.sell),
                    ),
                    Tab(
                      icon: Icon(Icons.add_shopping_cart),
                    ),
                    Tab(
                      icon: Icon(Icons.monetization_on_rounded),
                    ),
                    Tab(
                      icon: Icon(Icons.settings),
                    )
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  ListView(
                    padding: EdgeInsets.only(bottom: 85),
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _nameController,
                                      validator: (String? value) {
                                        if (value != null && value.isEmpty) {
                                          return 'Informe o cliente';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Cliente',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _paymentController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Informe a forma de pagamento';
                                      }
                                    },
                                    decoration: (InputDecoration(
                                        hintText: 'Forma de pagamento')),
                                  ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _sellerController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Informe o vendedor';
                                  }
                                },
                                decoration:
                                    (InputDecoration(hintText: 'Vendedor')),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Area de tabela de produtos',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: ListView(
                        padding: EdgeInsets.only(bottom: 85),
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _valueController,
                                          decoration: InputDecoration(
                                            hintText: 'Valor total',
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: _creditController,
                                        decoration: (InputDecoration(
                                            hintText: 'Credito restante')),
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _sellerController,
                                    decoration: (InputDecoration(
                                        hintText: 'Comissão vendedor')),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _districtController,
                                    decoration:
                                        (InputDecoration(hintText: 'Crédito')),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Teste de input4',
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Teste de input 5'),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                elevation: 2.0,
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
                child: Icon(Icons.save),
                backgroundColor: Color.fromARGB(255, 80, 62, 115),
              ),
            )),
      ),
    );
  }
}

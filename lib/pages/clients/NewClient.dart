import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api/pages/clients/ListClient.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter_api/widgets/countries_autocomplete.dart';
import 'package:flutter_api/widgets/decimal_input.dart';
import 'package:http/http.dart' as http;
import '../../models/client.dart';
import '../home.dart';

class ClientsNewScreen extends StatefulWidget {
  ClientsNewScreen(BuildContext context);

  @override
  State<ClientsNewScreen> createState() => _ClientsNewScreenState();
}

class _ClientsNewScreenState extends State<ClientsNewScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 80, 62, 115),
                title: const Text('Novo cliente'),
                leading: GestureDetector(
                  onTap: () {
                    print('clicou no backbutton');
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, anotherAnimation) {
                          return ClientsScreen(context);
                        },
                        transitionDuration: Duration(milliseconds: 600),
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
                  },
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    // add custom icons also
                  ),
                ),
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.account_box_outlined),
                    ),
                    Tab(
                      icon: Icon(Icons.settings),
                    ),
                    Tab(
                      icon: Icon(Icons.add),
                    ),
                    Tab(
                      icon: Icon(Icons.add_a_photo_rounded),
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
                                          return 'Informe o nome';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Nome',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _numberController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Informe o numero';
                                      }
                                    },
                                    decoration:
                                        (InputDecoration(hintText: 'Numero')),
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
                                controller: _adressController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Informe o endereço';
                                  }
                                },
                                decoration:
                                    (InputDecoration(hintText: 'Endereço')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _districtController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Informe o bairro';
                                  }
                                },
                                decoration:
                                    (InputDecoration(hintText: 'Bairro')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: _telephoneController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Informe o telefone';
                                  }
                                },
                                decoration:
                                    (InputDecoration(hintText: 'Telefone')),
                              ),
                            )
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
                              children: const [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Teste de input',
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children:  [
                               Expanded(child: CountriesAutocomplete())
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
                                  child: DecimalFormater(), // input decimal
                                ),
                                Expanded(
                                  child: TextField(
                                    // input money
                                    inputFormatters: [
                                      CurrencyTextInputFormatter(
                                        locale: 'pt-br',
                                        symbol: 'R\$',
                                      )
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: 'Teste de input currency'),
                                  ),
                                ),
                                Expanded(
                                    child: TextField(
                                  // input percentual
                                  inputFormatters: [
                                    CurrencyTextInputFormatter(
                                        locale: 'pt-br',
                                        symbol: '%',
                                        decimalDigits: 2,
                                        turnOffGrouping: true)
                                  ],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: 'Teste de input percentual'),
                                ))
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
                  Client client = Client(
                    id: 0,
                    name: _nameController.text,
                    adress: _adressController.text,
                    number: int.parse(_numberController.text),
                    district: _districtController.text,
                    telephone: _telephoneController.text,
                  );

                  saveClient(client).then((id) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ClientsScreen(context),
                        ),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Salvo com sucesso!'),
                  ));
                  // saveClient(widget.name, widget.adress, widget.number,
                  //     widget.district, widget.telephone);
                },
                backgroundColor: const Color.fromARGB(255, 80, 62, 115),
                child: const Icon(Icons.save),
              ),
            )),
      ),
    );
  }

  Future<String> saveClient(Client client) async {
    var headers = {
      'Authorization': 'Basic YWxiYXRyb3M6c2VuaGExMjM=',
      'Content-Type': 'application/json',
      'Cookie': 'JSESSIONID=1B02186E6BCAC7340DBAA37DA12BFDF5'
    };
    var request =
        http.Request('POST', Uri.parse('http://192.168.0.32:8080/clients'));
    var clientMap = client.toMap();
    print(jsonEncode(clientMap));
    request.body = jsonEncode(clientMap);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    return (request.body);
  }
}

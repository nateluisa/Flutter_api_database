import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../dao/clients_dao.dart';
import '../../models/client.dart';
import 'ListClient.dart';

class ClientsEditScreen extends StatefulWidget {
  final Client client;

  const ClientsEditScreen(clientsEditContext,
      {Key? key,
        required this.client,
        required BuildContext })
      : super(key: key);

  @override
  State<ClientsEditScreen> createState() => _ClientsEditScreenState();
}

class _ClientsEditScreenState extends State<ClientsEditScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();

  final ClientsDao _dao = ClientsDao();

  // late Bank bank;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.client.name;
    _adressController.text = widget.client.adress;
    _districtController.text = widget.client.district;
    _numberController.text = widget.client.number.toString();
    _telephoneController.text = widget.client.telephone.toString();
    return Form(
      key: _formKey,
      child: Scaffold(
        body: DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Editar cliente'),
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
                              children: [
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
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Teste de input2',
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Teste de input3'),
                                    )),
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
                  print('salvou');
                  final String name = _nameController.text;
                  final String adress = _adressController.text;
                  final int number = int.parse(_numberController.text);
                  final String district = _districtController.text;
                  final String telephone = _telephoneController.text;
                  final Client newClient =
                  Client(name: name, adress: adress, number: number, district: district, telephone: telephone, id: 0);
                  _dao.saveClient(newClient).then((id) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ClientsScreen(context),
                    ),
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Editado com sucesso!'),
                  ));
                },
                child: Icon(Icons.save),
                backgroundColor: Colors.blueGrey,
              ),
            )),
      ),
    );
  }
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/models/client.dart';
import 'package:http/http.dart' as http;

class ClientsNewScreen extends StatefulWidget {
  final name;
  final adress;
  final number;
  final district;
  final telephone;

  const ClientsNewScreen(
      {Key? key,
      this.name,
      this.adress,
      this.number,
      this.district,
      this.telephone,
      required BuildContext clientsNewContext})
      : super(key: key);

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
                  saveClient(widget.name, widget.adress, widget.number,
                      widget.district, widget.telephone);
                },
                child: Icon(Icons.save),
                backgroundColor: Color.fromARGB(255, 80, 62, 115),
              ),
            )),
      ),
    );
  }

  Future<String> saveClient(String name, String adress, int number,
      String district, int telephone) async {
    var headers = {
      'Authorization': 'Basic YWxiYXRyb3M6c2VuaGExMjM=',
      'Content-Type': 'application/json',
      'Cookie': 'JSESSIONID=1B02186E6BCAC7340DBAA37DA12BFDF5'
    };
    var request =
        http.Request('POST', Uri.parse('http://192.168.0.32:8080/clients'));
    request.body = json.encode({
      "name": _nameController,
      "adress": widget.adress,
      "number": widget.adress,
      "district": widget.district,
      "telephone": widget.telephone
    });
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

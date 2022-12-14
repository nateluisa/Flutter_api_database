import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api/pages/clients/EditClient.dart';
import 'package:flutter_api/pages/clients/ViewClient.dart';
import 'package:flutter_api/widgets/alert_dialog.dart';
import 'package:flutter_api/widgets/dashboard.dart';
import 'package:flutter_api/widgets/progress.dart';
import '../../models/client.dart';
import '../home.dart';
import 'NewClient.dart';
import 'package:http/http.dart' as http;

class ClientsScreen extends StatefulWidget {
  ClientsScreen(BuildContext context, {super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  late Future<List<Client>> futureClient;

  @override
  void initState() {
    super.initState();
    futureClient = findAllClients();
  }


  @override
  late final Client client;

  var clients = <Client>[];

  void _moveToScreen2(BuildContext context) =>
      Navigator.pushReplacementNamed(context, "screen2");

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.white),
          actionsIconTheme: const IconThemeData(
              size: 30.0, color: Colors.white, opacity: 10.0),
          backgroundColor: const Color.fromARGB(255, 80, 62, 115),
          title: const Text(
            "Clientes",
            style: TextStyle(color: Colors.white),
          ),
          leading: GestureDetector(
            onTap: () {

              //Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (contextNew) =>
                        HomePage(context, homeContext: context)),
              );
            },
            child: GestureDetector(
              onTap: () {
                print('clicou no backbutton');
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, anotherAnimation) {
                      return HomePage(context, homeContext: context,);
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
              },
              child: const Icon(
                Icons.arrow_back_outlined,
                // add custom icons also
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.more_vert),
                )),
          ],
        ),
        body: Center(
          child: FutureBuilder<List<Client>>(
            future: futureClient,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 85),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      shadowColor: Colors.blueGrey,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        trailing: PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  value: '1',
                                  child: const Text('Editar'),
                                  onTap: () {
                                    editClient(client.id);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ClientsEditScreen(
                                          context,
                                          client: client,
                                          BuildContext: context,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                PopupMenuItem<String>(
                                  value: '2',
                                  onTap: () {
                                    editClient(client.id).then((cli) =>
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    ClientsViewScreen(context,
                                                        client: client,
                                                        BuildContext:
                                                            BuildContext))));
                                  },
                                  child: const Text('Visualizar'),
                                ),
                                PopupMenuItem<String>(
                                  onTap: () {
                                    print('delete');
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return MyAlertDialog(
                                            icon:
                                                const Icon(Icons.warning_amber, size: 50, color: Colors.red),
                                            title: const Text(
                                                'Deseja realmente excluir?'),
                                            content: const Text(
                                              'Ap??s a confirma????o o cliente ser?? definitivamente exclu??do!',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            onCancel: () {
                                              Navigator.pop(context);
                                            },
                                            onConfirm: () {
                                              print('dialogo aberto');
                                              deleteClient(client.id).then(
                                                  (id) => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                ClientsScreen(
                                                                    context),
                                                          ))
                                                      .then((value) =>
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                            content: Text(
                                                                'Cliente deletado!'),
                                                          ))));
                                            },
                                          );
                                        });
                                  },
                                  value: '3',
                                  child: const Text('Excluir'),
                                ),
                              ];
                            }),
                        leading: const Icon(
                          Icons.account_circle_outlined,
                          size: 38,
                          color: Colors.deepPurple,
                        ),
                        title: Text(
                          '${snapshot.data?[index].name}',
                          style: const TextStyle(
                            fontSize: 19,
                          ),
                        ),
                        subtitle: Text(
                          '${snapshot.data?[index].adress}',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Progress();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 2.0,
          onPressed: () {
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, anotherAnimation) {
                  return ClientsNewScreen(context);
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (contextNew) => ClientsNewScreen(
            //       context,
            //     ),
            //   ),
            // );
          },
          child: const Icon(Icons.add),
          backgroundColor: const Color.fromARGB(255, 80, 62, 115),
        ),
      ),
    );
  }

  Future<List<Client>> findAllClients() async {
    var headers = {
      'Authorization': 'Basic YWxiYXRyb3M6c2VuaGExMjM=',
      'Cookie': 'JSESSIONID=07E7969F1D017A05181A4FEE32C08FDC'
    };
    var request =
        http.Request('GET', Uri.parse('http://192.168.0.32:8080/clients'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    List<Client> clients = [];

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      Iterable l = json.decode(body);
      clients = List<Client>.from(l.map((model) => Client.fromJson(model)));
    } else {
      print(response.reasonPhrase);
    }
    return clients;
  }

  Future<Client> editClient(int id) async {
    final response = await http.get(
      Uri.parse('http://192.168.0.32:8080/clients/$id'),
    );

    if (response.statusCode == 200) {
      return Client.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar cliente');
    }
  }

  Future<String> deleteClient(int id) async {
    var headers = {
      'Authorization': 'Basic YWxiYXRyb3M6c2VuaGExMjM=',
      'Content-Type': 'application/json',
      'Cookie': 'JSESSIONID=1B02186E6BCAC7340DBAA37DA12BFDF5'
    };
    var request = http.Request(
        'DELETE', Uri.parse('http://192.168.0.32:8080/clients/$id'));
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

// Future<Object> deleteClient(int id) async {
//   final http.Response response = await http.delete(
//     Uri.parse('http://192.168.0.32:8080/clients/$id'),
//     headers: <String, String>{
//       'Authorization': 'Basic YWxiYXRyb3M6c2VuaGExMjM=',
//       'Cookie': 'JSESSIONID=07E7969F1D017A05181A4FEE32C08FDC'
//     },
//   );
//   if (response.statusCode == 200) {
//     return Client.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Nao ?? possivel excluir!');
//   }
//
//   return response;
// }
}

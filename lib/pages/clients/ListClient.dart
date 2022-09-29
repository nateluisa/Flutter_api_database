import 'dart:convert';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme:
            const IconThemeData(size: 30.0, color: Colors.white, opacity: 10.0),
        backgroundColor: Color.fromARGB(255, 80, 62, 115),
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
                builder: (contextNew) => HomePage(
                  homeContext: context,
                ),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back_outlined, // add custom icons also
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
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    shadowColor: Colors.blueGrey,
                    child: ListTile(
                      title: Text(
                        '${snapshot.data?[index].name}',
                        style: const TextStyle(fontSize: 18),
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
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => ClientsNewScreen ( context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 80, 62, 115),
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
}

import 'package:flutter/material.dart';
import '../../models/client.dart';
import '../../widgets/progress.dart';
import '../home.dart';
import 'NewClient.dart';
import 'package:http/http.dart' as http;

class ClientsScreen extends StatelessWidget {
  ClientsScreen(BuildContext context, {super.key});

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
      body: FutureBuilder(
        future: findAllClients(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Progress();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.data != null) {
                final List<Client> clients = snapshot.data as List<Client>;
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 85),
                  itemBuilder: (context, index) {
                    final Client client = clients[index];
                    return _ClientItem(client);
                  },
                  itemCount: clients.length,
                );
              }
              break;
          }
          return Center(
            child: const Text(
            'Erro ao realizar carregamento',
            style: TextStyle(
              fontSize: 20,
            ),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => ClientsNewScreen(
                context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 80, 62, 115),
      ),
    );
  }

  Future<Client> findAllClients() async {
    var headers = {
      'Authorization': 'Basic YWxiYXRyb3M6c2VuaGExMjM=',
      'Cookie': 'JSESSIONID=1B02186E6BCAC7340DBAA37DA12BFDF5'
    };
    var request = http.Request('GET', Uri.parse('192.168.0.32:8080/clients'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    return (findAllClients());
  }
}

class _ClientItem extends StatelessWidget {
  // widget privado que fara parte apenas da tela cliente - lista
  final Client client;

  _ClientItem(this.client);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          client.name,
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: Text(
          client.adress,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

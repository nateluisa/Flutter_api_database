import 'package:sqflite/sqlite_api.dart';

import '../data/projectDB.dart';
import '../models/client.dart';

class ClientsDao {
  static const String tableClients = 'clients';

  static const String tableSql = 'CREATE TABLE clients('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'adress TEXT, '
      'number INTEGER, '
      'district TEXT, '
      'telephone INTEGER)';

  Future<int> saveClient(Client client) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> clientMap = {};
    clientMap['name'] = client.name;
    clientMap['adress'] = client.adress;
    clientMap['number'] = client.number;
    clientMap['district'] = client.district;
    clientMap['telephone'] = client.telephone;

    return db.insert('clients', clientMap);
  }

  Future<List<Client>> findAllClients() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query('clients');
    final List<Client> clients = [];
    for (Map<String, dynamic> row in result) {
      final Client client = Client(
          id: row['id'],
          name: row['name'],
          adress: row['adress'],
          number: row['number'],
          district: row['district'],
          telephone: row['telephone']);
      clients.add(client);
    }
    return clients;
  }

  Future<Client> findById(Client client) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(tableClients, where: 'id =?', whereArgs: [client.id]);
    for (Map<String, dynamic> row in result) {
      final Client client = Client(
          id: row['id'],
          name: row['name'],
          adress: row['adress'],
          number: row['number'],
          district: row['district'],
          telephone: row['telephone']);
      break;
    }
    return client;
  }

  Future<void> updateClient(Client client) async {
    final db = await createDatabase();
    await db.update(
      tableClients,
      client.toMap(),
      where: 'id = ?',
      whereArgs: [client.id],
    );
  }

  Future<void> deleteClient(int id) async {
    final db = await createDatabase();
    await db.delete(
      'clients',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

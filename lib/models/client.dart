import 'dart:convert';

class Client {
  final int id;
  final String name;
  final String adress;
  final int number;
  final String district;
  final int telephone;


  Client({
    required this.id,
    required this.name,
    required this.adress,
    required this.number,
    required this.district,
    required this.telephone,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'adress': adress,
      'number': number,
      'district': district,
      'telephone': telephone,

    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'],
      name: map['name'],
      adress: map['adress'],
      number: map['number'],
      district: map['district'],
      telephone: map['telephone'],

    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Client(id: $id, name: $name, adress: $adress, number: $number, district: $district, telephone: $telephone)';
  }
}

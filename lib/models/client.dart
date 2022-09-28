class Client {
  final int id;
  late String name;
  String adress;
  int number;
  String district;
  int telephone;

  Client(this.id, this.name, this.adress, this.number, this.district,
      this.telephone);

  factory Client.fromJson(dynamic json) {
    return Client(
        json['id'] as int,
        json['name'] as String,
        json['adress'] as String,
        json['number'] as int,
        json['district'] as String,
        json['telephone' as int]);
  }

  @override
  String toString() {
    return toMap().toString();
  }

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['adress'] = adress;
    data['number'] = number;
    data['district'] = district;
    data['telephone'] = telephone;
    return data;
  }
}

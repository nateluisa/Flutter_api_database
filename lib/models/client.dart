class Client {
  final int id;
  String name;
  String adress;
  int number;
  String district;
  int telephone;

  Client(this.id, this.name, this.adress, this.number, this.district,
      this.telephone);

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
}

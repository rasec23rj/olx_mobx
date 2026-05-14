class CityModel {
  final int id;
  final String name;

  CityModel({required this.id, required this.name});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      CityModel(id: json['id'], name: json['nome']);

  CityModel copyWith({int? id, String? name}) {
    return CityModel(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  String toString() {
    return 'UF{id: $id, name: $name}';
  }
}

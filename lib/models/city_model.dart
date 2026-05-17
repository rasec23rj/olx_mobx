class CityModel {
  final int? id;
  final String? name;

  CityModel({this.id, required this.name});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      CityModel(id: json['id'], name: json['nome']);

  CityModel copyWith({int? id, String? name}) {
    return CityModel(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  String toString() {
    return 'CITY{id: $id, name: $name}';
  }
}

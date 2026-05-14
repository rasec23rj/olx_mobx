class UfModel {
  final int id;
  final String initials;
  final String name;

  UfModel({required this.id, required this.initials, required this.name});

  UfModel copyWith({int? id, String? initials, String? name}) {
    return UfModel(
      id: id ?? this.id,
      initials: initials ?? this.initials,
      name: name ?? this.name,
    );
  }

  factory UfModel.fromJson(Map<String, dynamic> json) =>
      UfModel(id: json['id'], initials: json['sigla'], name: json['nome']);

  @override
  String toString() {
    return 'UF{id: $id, initials: $initials, name: $name}';
  }
}

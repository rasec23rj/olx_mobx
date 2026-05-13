import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AnuncioModel {
  final String title;
  final String description;
  final String category;
  final String cep;
  final String preco;
  final List<ParseFile> imagePath;

  AnuncioModel({
    required this.title,
    required this.description,
    required this.category,
    required this.cep,
    required this.preco,
    required this.imagePath,
  });
}

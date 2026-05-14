import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AnuncioModel {
  final String? id;
  final String title;
  final String description;
  final String category;
  final String cep;
  final String preco;
  final List<dynamic> imagePath;

  AnuncioModel.fromParse(ParseObject parseObject)
    : id = parseObject.objectId!,
      title = parseObject.get('title'),
      description = parseObject.get('description'),
      category = parseObject.get('category'),
      cep = parseObject.get('cep'),
      preco = parseObject.get('preco'),
      imagePath = parseObject.get('imagePath');

  AnuncioModel({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.cep,
    required this.preco,
    required this.imagePath,
  });
}

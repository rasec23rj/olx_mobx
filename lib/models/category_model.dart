import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CategoryModel {
  final String id;
  final String title;

  CategoryModel({required this.title, required this.id});

  CategoryModel.fromParse(ParseObject parseObject)
    : id = parseObject.objectId!,
      title = parseObject.get('title');

  @override
  String toString() {
    return 'Category{id: $id, title: $title}';
  }
}

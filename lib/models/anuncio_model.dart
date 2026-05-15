import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

enum AnuncioModelStatus { PENDING, ACTIVE, SOLD, DELETED }

class AnuncioModel {
  String? id;
  String? title;
  String? description;
  String? category;
  String? cep;
  String? preco;
  String? district;
  String? city;
  String? uf;
  List<dynamic>? imagePath;
  bool? hidePhone;
  AnuncioModelStatus? status;
  DateTime? createdAt;
  String? user;
  int? views;

  AnuncioModel.empty()
    : title = '',
      description = '',
      category = '',
      cep = '',
      preco = '',
      district = '',
      city = '',
      uf = '',
      imagePath = [],
      hidePhone = false,
      status = AnuncioModelStatus.PENDING,
      createdAt = DateTime.now(),
      user = '',
      views = 0;

  AnuncioModel.fromParse(ParseObject parseObject)
    : id = parseObject.objectId!,
      title = parseObject.get('title'),
      description = parseObject.get('description'),
      category = parseObject.get('category'),
      cep = parseObject.get('cep'),
      preco = parseObject.get('preco'),
      imagePath = parseObject
          .get<List>('imagePath')!
          .map((image) => image)
          .toList(),
      hidePhone = parseObject.get('hidePhone'),
      user = parseObject.get('user'),
      views = parseObject.get('views'),
      district = parseObject.get('district'),
      city = parseObject.get('city'),
      uf = parseObject.get('uf'),
      status = statusFromString(parseObject.get('status')),
      createdAt = parseObject.get('createdAt');

  AnuncioModel({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.cep,
    required this.preco,
    required this.imagePath,
    required this.hidePhone,
    this.status,
    required this.createdAt,
    required this.user,
    required this.views,
    required this.district,
    required this.city,
    required this.uf,
  });
}

AnuncioModelStatus? statusFromString(String? value) {
  if (value == null) return null;

  return AnuncioModelStatus.values.firstWhere(
    (e) => e.name.toLowerCase() == value.toLowerCase(),
  );
}

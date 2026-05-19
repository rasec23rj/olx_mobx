import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.celular,
    this.password,
    this.id,
    this.type = UserType.PARTICULAR,
    this.createdAt,
  });

  String? id;
  String? name;
  String? email;
  String? celular;
  String? password;
  UserType? type;
  DateTime? createdAt;

  UserModel.fromParse(ParseObject parseObject)
    : id = parseObject.objectId!,
      name = parseObject.get('name'),
      email = parseObject.get('email'),
      celular = parseObject.get('celular');

  @override
  String toString() {
    return "User{id: $id, name: $name, celular: $celular, type: $type, createdAt: $createdAt}";
  }
}

enum UserType { PARTICULAR, PROFFISIONAL }

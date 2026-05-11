import 'package:flutter/rendering.dart';
import 'package:olx_mobx/core/utils/parser_errors.dart';
import 'package:olx_mobx/models/user_model.dart';
import 'package:olx_mobx/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserRepository {
  Future<UserModel> sinUp(UserModel user) async {
    final parserUser = ParseUser(user.email, user.password, user.email);

    parserUser.set<String>(userName, user.name);
    parserUser.set<String>(userCelular, user.celular);
    parserUser.set<int>(userType, user.type.index);

    final response = await parserUser.signUp();

    if (response.success) {
      return mapParserToUser(response.result);
    } else {
      return Future.error(
        ParseErrors.getDescription(response.error!.code) ?? 'Erro desconhecido',
      );
    }
  }

  UserModel mapParserToUser(ParseUser parserUser) {
    return UserModel(
      id: parserUser.objectId,
      name: parserUser.get(userName),
      email: parserUser.get(userEmail),
      celular: parserUser.get(userCelular),
      type: UserType.values[parserUser.get(userType)],
      createdAt: parserUser.get(createdAt),
    );
  }
}

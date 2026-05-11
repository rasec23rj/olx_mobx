import 'package:olx_mobx/core/utils/parser_errors.dart';
import 'package:olx_mobx/models/user_model.dart';
import 'package:olx_mobx/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserRepository {
  Future<void> sinUp(UserModel user) async {
    final parserUser = ParseUser(user.email, user.password, user.email);

    parserUser.set<String>(userName, user.name);
    parserUser.set<String>(userCelular, user.celular);
    parserUser.set<String>(userType, user.type.name);

    final response = await parserUser.signUp();

    if (response.success) {
      print(response.result);
    } else {
      print(response.error);
      return Future.error(
        ParseErrors.getDescription(response.error!.code) ?? 'Erro desconhecido',
      );
    }
  }
}

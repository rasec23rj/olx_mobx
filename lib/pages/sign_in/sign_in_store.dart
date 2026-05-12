import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_mobx/core/session/session_store_user.dart';
import 'package:olx_mobx/repositories/user_repository.dart';
part 'sign_in_store.g.dart';

class SignInStore = _SignInStore with _$SignInStore;

abstract class _SignInStore with Store {
  @observable
  bool obscuretxt = true;

  @action
  bool setObscuretxt() {
    return obscuretxt = !obscuretxt;
  }

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailInvalid => email.contains('@');
  String get emailError {
    if (emailInvalid) {
      return '';
    } else {
      return 'Email invalido';
    }
  }

  @observable
  String senha = '';

  @action
  void setSenha(String value) => senha = value;

  @computed
  bool get senhaValid => senha.length >= 5;
  String get senhaError {
    if (senhaValid) {
      return '';
    } else {
      return 'Senha invalido';
    }
  }

  @observable
  bool loading = false;

  @action
  void setlLading(bool value) => loading = value;

  @computed
  VoidCallback? get loginPressed =>
      emailInvalid && senhaValid && !loading ? _login : null;

  @observable
  String? error;

  @action
  Future<void> _login() async {
    setlLading(true);
    try {
      final user = await UserRepository().sinIn(email, senha);

      GetIt.I<SessionStoreUser>().setUser(user);
      error = '';
    } catch (e) {
      error = e.toString();
    }
    setlLading(false);
  }
}

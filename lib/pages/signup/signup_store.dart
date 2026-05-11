import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  @observable
  String name = '';

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name.length >= 6;
  String get nameError {
    if (nameValid) {
      return '';
    } else if (name.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
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
    } else if (email.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Email muito curto';
    }
  }

  @observable
  String celular = '';

  @action
  void setCelular(String value) => celular = value;

  @computed
  bool get celularValid => celular.length >= 14;
  String get celularError {
    if (celularValid) {
      return '';
    } else if (celular.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Celular muito curto';
    }
  }

  @observable
  String senha = '';

  @action
  void setSenha(String value) => senha = value;

  @computed
  bool get senhaValid => senha != null && celular.length > 6;
  String get senhaError {
    if (senhaValid) {
      return '';
    } else if (senha.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senha muito curto';
    }
  }

  @observable
  String comfirmaSenha = '';

  @action
  void setComfirmaSenha(String value) => comfirmaSenha = value;

  @computed
  bool get comfirmaSenhaValid =>
      comfirmaSenha != null && comfirmaSenha == senha;
  String get comfirmaSenhaError {
    if (comfirmaSenhaValid) {
      return '';
    } else if (senha.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senha não coincidem';
    }
  }

  @computed
  bool get isFormValid =>
      nameValid &&
      emailInvalid &&
      celularValid &&
      senhaValid &&
      comfirmaSenhaValid;

  @computed
  VoidCallback? get sinUpPress => (isFormValid && !loading) ? _sinUp : null;

  @observable
  bool loading = false;

  @action
  Future<void> _sinUp() async {
    loading = true;
    await Future.delayed(Duration(seconds: 2));
    loading = false;
  }
}

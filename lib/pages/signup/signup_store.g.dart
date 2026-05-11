// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupStore on _SignupStoreBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid => (_$nameValidComputed ??= Computed<bool>(
    () => super.nameValid,
    name: '_SignupStoreBase.nameValid',
  )).value;
  Computed<bool>? _$emailInvalidComputed;

  @override
  bool get emailInvalid => (_$emailInvalidComputed ??= Computed<bool>(
    () => super.emailInvalid,
    name: '_SignupStoreBase.emailInvalid',
  )).value;
  Computed<bool>? _$celularValidComputed;

  @override
  bool get celularValid => (_$celularValidComputed ??= Computed<bool>(
    () => super.celularValid,
    name: '_SignupStoreBase.celularValid',
  )).value;
  Computed<bool>? _$senhaValidComputed;

  @override
  bool get senhaValid => (_$senhaValidComputed ??= Computed<bool>(
    () => super.senhaValid,
    name: '_SignupStoreBase.senhaValid',
  )).value;
  Computed<bool>? _$comfirmaSenhaValidComputed;

  @override
  bool get comfirmaSenhaValid =>
      (_$comfirmaSenhaValidComputed ??= Computed<bool>(
        () => super.comfirmaSenhaValid,
        name: '_SignupStoreBase.comfirmaSenhaValid',
      )).value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid => (_$isFormValidComputed ??= Computed<bool>(
    () => super.isFormValid,
    name: '_SignupStoreBase.isFormValid',
  )).value;
  Computed<VoidCallback?>? _$sinUpPressComputed;

  @override
  VoidCallback? get sinUpPress =>
      (_$sinUpPressComputed ??= Computed<VoidCallback?>(
        () => super.sinUpPress,
        name: '_SignupStoreBase.sinUpPress',
      )).value;

  late final _$nameAtom = Atom(name: '_SignupStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(
    name: '_SignupStoreBase.email',
    context: context,
  );

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$celularAtom = Atom(
    name: '_SignupStoreBase.celular',
    context: context,
  );

  @override
  String get celular {
    _$celularAtom.reportRead();
    return super.celular;
  }

  @override
  set celular(String value) {
    _$celularAtom.reportWrite(value, super.celular, () {
      super.celular = value;
    });
  }

  late final _$senhaAtom = Atom(
    name: '_SignupStoreBase.senha',
    context: context,
  );

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$comfirmaSenhaAtom = Atom(
    name: '_SignupStoreBase.comfirmaSenha',
    context: context,
  );

  @override
  String get comfirmaSenha {
    _$comfirmaSenhaAtom.reportRead();
    return super.comfirmaSenha;
  }

  @override
  set comfirmaSenha(String value) {
    _$comfirmaSenhaAtom.reportWrite(value, super.comfirmaSenha, () {
      super.comfirmaSenha = value;
    });
  }

  late final _$loadingAtom = Atom(
    name: '_SignupStoreBase.loading',
    context: context,
  );

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom = Atom(
    name: '_SignupStoreBase.error',
    context: context,
  );

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$_sinUpAsyncAction = AsyncAction(
    '_SignupStoreBase._sinUp',
    context: context,
  );

  @override
  Future<void> _sinUp() {
    return _$_sinUpAsyncAction.run(() => super._sinUp());
  }

  late final _$_SignupStoreBaseActionController = ActionController(
    name: '_SignupStoreBase',
    context: context,
  );

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
      name: '_SignupStoreBase.setName',
    );
    try {
      return super.setName(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
      name: '_SignupStoreBase.setEmail',
    );
    try {
      return super.setEmail(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCelular(String value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
      name: '_SignupStoreBase.setCelular',
    );
    try {
      return super.setCelular(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
      name: '_SignupStoreBase.setSenha',
    );
    try {
      return super.setSenha(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComfirmaSenha(String value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
      name: '_SignupStoreBase.setComfirmaSenha',
    );
    try {
      return super.setComfirmaSenha(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
celular: ${celular},
senha: ${senha},
comfirmaSenha: ${comfirmaSenha},
loading: ${loading},
error: ${error},
nameValid: ${nameValid},
emailInvalid: ${emailInvalid},
celularValid: ${celularValid},
senhaValid: ${senhaValid},
comfirmaSenhaValid: ${comfirmaSenhaValid},
isFormValid: ${isFormValid},
sinUpPress: ${sinUpPress}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInStore on _SignInStore, Store {
  Computed<bool>? _$emailInvalidComputed;

  @override
  bool get emailInvalid => (_$emailInvalidComputed ??= Computed<bool>(
    () => super.emailInvalid,
    name: '_SignInStore.emailInvalid',
  )).value;
  Computed<bool>? _$senhaValidComputed;

  @override
  bool get senhaValid => (_$senhaValidComputed ??= Computed<bool>(
    () => super.senhaValid,
    name: '_SignInStore.senhaValid',
  )).value;
  Computed<VoidCallback?>? _$loginPressedComputed;

  @override
  VoidCallback? get loginPressed =>
      (_$loginPressedComputed ??= Computed<VoidCallback?>(
        () => super.loginPressed,
        name: '_SignInStore.loginPressed',
      )).value;

  late final _$obscuretxtAtom = Atom(
    name: '_SignInStore.obscuretxt',
    context: context,
  );

  @override
  bool get obscuretxt {
    _$obscuretxtAtom.reportRead();
    return super.obscuretxt;
  }

  @override
  set obscuretxt(bool value) {
    _$obscuretxtAtom.reportWrite(value, super.obscuretxt, () {
      super.obscuretxt = value;
    });
  }

  late final _$emailAtom = Atom(name: '_SignInStore.email', context: context);

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

  late final _$senhaAtom = Atom(name: '_SignInStore.senha', context: context);

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

  late final _$loadingAtom = Atom(
    name: '_SignInStore.loading',
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

  late final _$errorAtom = Atom(name: '_SignInStore.error', context: context);

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

  late final _$_loginAsyncAction = AsyncAction(
    '_SignInStore._login',
    context: context,
  );

  @override
  Future<void> _login() {
    return _$_loginAsyncAction.run(() => super._login());
  }

  late final _$_SignInStoreActionController = ActionController(
    name: '_SignInStore',
    context: context,
  );

  @override
  bool setObscuretxt() {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
      name: '_SignInStore.setObscuretxt',
    );
    try {
      return super.setObscuretxt();
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
      name: '_SignInStore.setEmail',
    );
    try {
      return super.setEmail(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
      name: '_SignInStore.setSenha',
    );
    try {
      return super.setSenha(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setlLading(bool value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
      name: '_SignInStore.setlLading',
    );
    try {
      return super.setlLading(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscuretxt: ${obscuretxt},
email: ${email},
senha: ${senha},
loading: ${loading},
error: ${error},
emailInvalid: ${emailInvalid},
senhaValid: ${senhaValid},
loginPressed: ${loginPressed}
    ''';
  }
}

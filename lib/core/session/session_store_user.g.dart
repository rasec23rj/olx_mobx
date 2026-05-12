// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_store_user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SessionStoreUser on _SessionStoreUserBase, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn => (_$isLoggedInComputed ??= Computed<bool>(
    () => super.isLoggedIn,
    name: '_SessionStoreUserBase.isLoggedIn',
  )).value;

  late final _$userAtom = Atom(
    name: '_SessionStoreUserBase.user',
    context: context,
  );

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$_SessionStoreUserBaseActionController = ActionController(
    name: '_SessionStoreUserBase',
    context: context,
  );

  @override
  void setUser(UserModel value) {
    final _$actionInfo = _$_SessionStoreUserBaseActionController.startAction(
      name: '_SessionStoreUserBase.setUser',
    );
    try {
      return super.setUser(value);
    } finally {
      _$_SessionStoreUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}

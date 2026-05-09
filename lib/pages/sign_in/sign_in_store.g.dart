// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInStore on _SignInStore, Store {
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
  String toString() {
    return '''
obscuretxt: ${obscuretxt}
    ''';
  }
}

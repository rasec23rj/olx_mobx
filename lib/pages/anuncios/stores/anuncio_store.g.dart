// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anuncio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnuncioStore on _AnuncioStoreBase, Store {
  late final _$imageFileAtom = Atom(
    name: '_AnuncioStoreBase.imageFile',
    context: context,
  );

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$croppedFileAtom = Atom(
    name: '_AnuncioStoreBase.croppedFile',
    context: context,
  );

  @override
  CroppedFile? get croppedFile {
    _$croppedFileAtom.reportRead();
    return super.croppedFile;
  }

  @override
  set croppedFile(CroppedFile? value) {
    _$croppedFileAtom.reportWrite(value, super.croppedFile, () {
      super.croppedFile = value;
    });
  }

  late final _$pickImageAsyncAction = AsyncAction(
    '_AnuncioStoreBase.pickImage',
    context: context,
  );

  @override
  Future<void> pickImage(BuildContext context) {
    return _$pickImageAsyncAction.run(() => super.pickImage(context));
  }

  late final _$gelleryImageAsyncAction = AsyncAction(
    '_AnuncioStoreBase.gelleryImage',
    context: context,
  );

  @override
  Future<void> gelleryImage(BuildContext context) {
    return _$gelleryImageAsyncAction.run(() => super.gelleryImage(context));
  }

  late final _$_AnuncioStoreBaseActionController = ActionController(
    name: '_AnuncioStoreBase',
    context: context,
  );

  @override
  void onImageSelected(dynamic croppedFile) {
    final _$actionInfo = _$_AnuncioStoreBaseActionController.startAction(
      name: '_AnuncioStoreBase.onImageSelected',
    );
    try {
      return super.onImageSelected(croppedFile);
    } finally {
      _$_AnuncioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageFile: ${imageFile},
croppedFile: ${croppedFile}
    ''';
  }
}

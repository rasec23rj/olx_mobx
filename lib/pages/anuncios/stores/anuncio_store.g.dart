// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anuncio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnuncioStore on _AnuncioStoreBase, Store {
  Computed<bool>? _$imagesValidComputed;

  @override
  bool get imagesValid => (_$imagesValidComputed ??= Computed<bool>(
    () => super.imagesValid,
    name: '_AnuncioStoreBase.imagesValid',
  )).value;
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid => (_$titleValidComputed ??= Computed<bool>(
    () => super.titleValid,
    name: '_AnuncioStoreBase.titleValid',
  )).value;
  Computed<bool>? _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
    () => super.descriptionValid,
    name: '_AnuncioStoreBase.descriptionValid',
  )).value;
  Computed<bool>? _$categoryValidComputed;

  @override
  bool get categoryValid => (_$categoryValidComputed ??= Computed<bool>(
    () => super.categoryValid,
    name: '_AnuncioStoreBase.categoryValid',
  )).value;
  Computed<bool>? _$cepValidComputed;

  @override
  bool get cepValid => (_$cepValidComputed ??= Computed<bool>(
    () => super.cepValid,
    name: '_AnuncioStoreBase.cepValid',
  )).value;
  Computed<bool>? _$precoValidComputed;

  @override
  bool get precoValid => (_$precoValidComputed ??= Computed<bool>(
    () => super.precoValid,
    name: '_AnuncioStoreBase.precoValid',
  )).value;
  Computed<VoidCallback?>? _$anuncioPressComputed;

  @override
  VoidCallback? get anuncioPress =>
      (_$anuncioPressComputed ??= Computed<VoidCallback?>(
        () => super.anuncioPress,
        name: '_AnuncioStoreBase.anuncioPress',
      )).value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid => (_$isFormValidComputed ??= Computed<bool>(
    () => super.isFormValid,
    name: '_AnuncioStoreBase.isFormValid',
  )).value;

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

  late final _$titleAtom = Atom(
    name: '_AnuncioStoreBase.title',
    context: context,
  );

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom = Atom(
    name: '_AnuncioStoreBase.description',
    context: context,
  );

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$categoryAtom = Atom(
    name: '_AnuncioStoreBase.category',
    context: context,
  );

  @override
  CategoryModel get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(CategoryModel value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$cepAtom = Atom(name: '_AnuncioStoreBase.cep', context: context);

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  late final _$precoAtom = Atom(
    name: '_AnuncioStoreBase.preco',
    context: context,
  );

  @override
  String get preco {
    _$precoAtom.reportRead();
    return super.preco;
  }

  @override
  set preco(String value) {
    _$precoAtom.reportWrite(value, super.preco, () {
      super.preco = value;
    });
  }

  late final _$loadingAtom = Atom(
    name: '_AnuncioStoreBase.loading',
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
    name: '_AnuncioStoreBase.error',
    context: context,
  );

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$savedAtom = Atom(
    name: '_AnuncioStoreBase.saved',
    context: context,
  );

  @override
  AnuncioModel get saved {
    _$savedAtom.reportRead();
    return super.saved;
  }

  @override
  set saved(AnuncioModel value) {
    _$savedAtom.reportWrite(value, super.saved, () {
      super.saved = value;
    });
  }

  late final _$listAnunciosAtom = Atom(
    name: '_AnuncioStoreBase.listAnuncios',
    context: context,
  );

  @override
  List<AnuncioModel> get listAnuncios {
    _$listAnunciosAtom.reportRead();
    return super.listAnuncios;
  }

  @override
  set listAnuncios(List<AnuncioModel> value) {
    _$listAnunciosAtom.reportWrite(value, super.listAnuncios, () {
      super.listAnuncios = value;
    });
  }

  late final _$searchAtom = Atom(
    name: '_AnuncioStoreBase.search',
    context: context,
  );

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$hidePhoneAtom = Atom(
    name: '_AnuncioStoreBase.hidePhone',
    context: context,
  );

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
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

  late final _$createAnuncioAsyncAction = AsyncAction(
    '_AnuncioStoreBase.createAnuncio',
    context: context,
  );

  @override
  Future<void> createAnuncio() {
    return _$createAnuncioAsyncAction.run(() => super.createAnuncio());
  }

  late final _$loadAnunciosAsyncAction = AsyncAction(
    '_AnuncioStoreBase.loadAnuncios',
    context: context,
  );

  @override
  Future<void> loadAnuncios() {
    return _$loadAnunciosAsyncAction.run(() => super.loadAnuncios());
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
  void setTitle(String value) {
    final _$actionInfo = _$_AnuncioStoreBaseActionController.startAction(
      name: '_AnuncioStoreBase.setTitle',
    );
    try {
      return super.setTitle(value);
    } finally {
      _$_AnuncioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_AnuncioStoreBaseActionController.startAction(
      name: '_AnuncioStoreBase.setDescription',
    );
    try {
      return super.setDescription(value);
    } finally {
      _$_AnuncioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(CategoryModel value) {
    final _$actionInfo = _$_AnuncioStoreBaseActionController.startAction(
      name: '_AnuncioStoreBase.setCategory',
    );
    try {
      return super.setCategory(value);
    } finally {
      _$_AnuncioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCep(String value) {
    final _$actionInfo = _$_AnuncioStoreBaseActionController.startAction(
      name: '_AnuncioStoreBase.setCep',
    );
    try {
      return super.setCep(value);
    } finally {
      _$_AnuncioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPreco(String value) {
    final _$actionInfo = _$_AnuncioStoreBaseActionController.startAction(
      name: '_AnuncioStoreBase.setPreco',
    );
    try {
      return super.setPreco(value);
    } finally {
      _$_AnuncioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_AnuncioStoreBaseActionController.startAction(
      name: '_AnuncioStoreBase.setError',
    );
    try {
      return super.setError(value);
    } finally {
      _$_AnuncioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnuncios(List<AnuncioModel> anuncios) {
    final _$actionInfo = _$_AnuncioStoreBaseActionController.startAction(
      name: '_AnuncioStoreBase.setAnuncios',
    );
    try {
      return super.setAnuncios(anuncios);
    } finally {
      _$_AnuncioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_AnuncioStoreBaseActionController.startAction(
      name: '_AnuncioStoreBase.setSearch',
    );
    try {
      return super.setSearch(value);
    } finally {
      _$_AnuncioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool value) {
    final _$actionInfo = _$_AnuncioStoreBaseActionController.startAction(
      name: '_AnuncioStoreBase.setHidePhone',
    );
    try {
      return super.setHidePhone(value);
    } finally {
      _$_AnuncioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageFile: ${imageFile},
croppedFile: ${croppedFile},
title: ${title},
description: ${description},
category: ${category},
cep: ${cep},
preco: ${preco},
loading: ${loading},
error: ${error},
saved: ${saved},
listAnuncios: ${listAnuncios},
search: ${search},
hidePhone: ${hidePhone},
imagesValid: ${imagesValid},
titleValid: ${titleValid},
descriptionValid: ${descriptionValid},
categoryValid: ${categoryValid},
cepValid: ${cepValid},
precoValid: ${precoValid},
anuncioPress: ${anuncioPress},
isFormValid: ${isFormValid}
    ''';
  }
}

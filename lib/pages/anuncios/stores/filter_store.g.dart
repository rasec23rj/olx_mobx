// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FilterStore on _FilterStoreBase, Store {
  Computed<String?>? _$priceErrorComputed;

  @override
  String? get priceError => (_$priceErrorComputed ??= Computed<String?>(
    () => super.priceError,
    name: '_FilterStoreBase.priceError',
  )).value;
  Computed<bool>? _$isFormValidFilterComputed;

  @override
  bool get isFormValidFilter => (_$isFormValidFilterComputed ??= Computed<bool>(
    () => super.isFormValidFilter,
    name: '_FilterStoreBase.isFormValidFilter',
  )).value;

  late final _$orderAtom = Atom(
    name: '_FilterStoreBase.order',
    context: context,
  );

  @override
  OrdeBy get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(OrdeBy value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$minPriceAtom = Atom(
    name: '_FilterStoreBase.minPrice',
    context: context,
  );

  @override
  int get minPrice {
    _$minPriceAtom.reportRead();
    return super.minPrice;
  }

  @override
  set minPrice(int value) {
    _$minPriceAtom.reportWrite(value, super.minPrice, () {
      super.minPrice = value;
    });
  }

  late final _$maxPriceAtom = Atom(
    name: '_FilterStoreBase.maxPrice',
    context: context,
  );

  @override
  int get maxPrice {
    _$maxPriceAtom.reportRead();
    return super.maxPrice;
  }

  @override
  set maxPrice(int value) {
    _$maxPriceAtom.reportWrite(value, super.maxPrice, () {
      super.maxPrice = value;
    });
  }

  late final _$tipoAnuncioByAtom = Atom(
    name: '_FilterStoreBase.tipoAnuncioBy',
    context: context,
  );

  @override
  TipoAnuncioBy get tipoAnuncioBy {
    _$tipoAnuncioByAtom.reportRead();
    return super.tipoAnuncioBy;
  }

  @override
  set tipoAnuncioBy(TipoAnuncioBy value) {
    _$tipoAnuncioByAtom.reportWrite(value, super.tipoAnuncioBy, () {
      super.tipoAnuncioBy = value;
    });
  }

  late final _$selectedUFAtom = Atom(
    name: '_FilterStoreBase.selectedUF',
    context: context,
  );

  @override
  int get selectedUF {
    _$selectedUFAtom.reportRead();
    return super.selectedUF;
  }

  @override
  set selectedUF(int value) {
    _$selectedUFAtom.reportWrite(value, super.selectedUF, () {
      super.selectedUF = value;
    });
  }

  late final _$selectedCityAtom = Atom(
    name: '_FilterStoreBase.selectedCity',
    context: context,
  );

  @override
  int get selectedCity {
    _$selectedCityAtom.reportRead();
    return super.selectedCity;
  }

  @override
  set selectedCity(int value) {
    _$selectedCityAtom.reportWrite(value, super.selectedCity, () {
      super.selectedCity = value;
    });
  }

  late final _$initialValueUfAtom = Atom(
    name: '_FilterStoreBase.initialValueUf',
    context: context,
  );

  @override
  UfModel get initialValueUf {
    _$initialValueUfAtom.reportRead();
    return super.initialValueUf;
  }

  @override
  set initialValueUf(UfModel value) {
    _$initialValueUfAtom.reportWrite(value, super.initialValueUf, () {
      super.initialValueUf = value;
    });
  }

  late final _$initialValueCityAtom = Atom(
    name: '_FilterStoreBase.initialValueCity',
    context: context,
  );

  @override
  CityModel get initialValueCity {
    _$initialValueCityAtom.reportRead();
    return super.initialValueCity;
  }

  @override
  set initialValueCity(CityModel value) {
    _$initialValueCityAtom.reportWrite(value, super.initialValueCity, () {
      super.initialValueCity = value;
    });
  }

  late final _$loadingUfListAsyncAction = AsyncAction(
    '_FilterStoreBase.loadingUfList',
    context: context,
  );

  @override
  Future<void> loadingUfList() {
    return _$loadingUfListAsyncAction.run(() => super.loadingUfList());
  }

  late final _$selectedcityListAsyncAction = AsyncAction(
    '_FilterStoreBase.selectedcityList',
    context: context,
  );

  @override
  Future<void> selectedcityList({required UfModel ufModel}) {
    return _$selectedcityListAsyncAction.run(
      () => super.selectedcityList(ufModel: ufModel),
    );
  }

  late final _$_FilterStoreBaseActionController = ActionController(
    name: '_FilterStoreBase',
    context: context,
  );

  @override
  void setOrder(OrdeBy value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
      name: '_FilterStoreBase.setOrder',
    );
    try {
      return super.setOrder(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMinPrice(int value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
      name: '_FilterStoreBase.setMinPrice',
    );
    try {
      return super.setMinPrice(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxPrice(int value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
      name: '_FilterStoreBase.setMaxPrice',
    );
    try {
      return super.setMaxPrice(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTipoAnuncioBy(TipoAnuncioBy value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
      name: '_FilterStoreBase.setTipoAnuncioBy',
    );
    try {
      return super.setTipoAnuncioBy(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save() {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
      name: '_FilterStoreBase.save',
    );
    try {
      return super.save();
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetLoading() {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
      name: '_FilterStoreBase.resetLoading',
    );
    try {
      return super.resetLoading();
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
order: ${order},
minPrice: ${minPrice},
maxPrice: ${maxPrice},
tipoAnuncioBy: ${tipoAnuncioBy},
selectedUF: ${selectedUF},
selectedCity: ${selectedCity},
initialValueUf: ${initialValueUf},
initialValueCity: ${initialValueCity},
priceError: ${priceError},
isFormValidFilter: ${isFormValidFilter}
    ''';
  }
}

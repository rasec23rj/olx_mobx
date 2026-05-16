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
  String toString() {
    return '''
order: ${order},
minPrice: ${minPrice},
maxPrice: ${maxPrice},
tipoAnuncioBy: ${tipoAnuncioBy},
priceError: ${priceError}
    ''';
  }
}

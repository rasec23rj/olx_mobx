// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryStore on _CategoryStoreBase, Store {
  late final _$errorAtom = Atom(
    name: '_CategoryStoreBase.error',
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

  late final _$categoryAtom = Atom(
    name: '_CategoryStoreBase.category',
    context: context,
  );

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$categorySelectedAtom = Atom(
    name: '_CategoryStoreBase.categorySelected',
    context: context,
  );

  @override
  CategoryModel get categorySelected {
    _$categorySelectedAtom.reportRead();
    return super.categorySelected;
  }

  @override
  set categorySelected(CategoryModel value) {
    _$categorySelectedAtom.reportWrite(value, super.categorySelected, () {
      super.categorySelected = value;
    });
  }

  late final _$_CategoryStoreBaseActionController = ActionController(
    name: '_CategoryStoreBase',
    context: context,
  );

  @override
  void setCategories(List<CategoryModel> categories) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
      name: '_CategoryStoreBase.setCategories',
    );
    try {
      return super.setCategories(categories);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
      name: '_CategoryStoreBase.setError',
    );
    try {
      return super.setError(value);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(String value) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
      name: '_CategoryStoreBase.setCategory',
    );
    try {
      return super.setCategory(value);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCategorySelected(CategoryModel value) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
      name: '_CategoryStoreBase.setCategorySelected',
    );
    try {
      return super.setCategorySelected(value);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
category: ${category},
categorySelected: ${categorySelected}
    ''';
  }
}

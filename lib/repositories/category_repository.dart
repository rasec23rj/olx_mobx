import 'package:olx_mobx/core/utils/parser_errors.dart';
import 'package:olx_mobx/models/category_model.dart';
import 'package:olx_mobx/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getList() async {
    final queryBuilder = QueryBuilder(ParseObject(categoryTable))
      ..orderByAscending(categoryTitle);

    final response = await queryBuilder.query();

    if (response.success) {
      return response.results!
          .map((value) => CategoryModel.fromParse(value))
          .toList();
    } else {
      throw ParseErrors.getDescription(response.error!.code) ?? '';
    }
  }
}

import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/category_model.dart';
import 'package:olx_mobx/repositories/category_repository.dart';
part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  _CategoryStoreBase() {
    _loadCategories();
  }

  ObservableList<CategoryModel> categoryList = ObservableList<CategoryModel>();

  Future<void> _loadCategories() async {
    try {
      final categories = await CategoryRepository().getList();
      setCategories(categories);
    } catch (e) {
      setError(e.toString());
    }
  }

  @action
  void setCategories(List<CategoryModel> categories) {
    categoryList.clear();
    categoryList.addAll(categories);
  }

  @action
  void setError(String value) => error = value;

  @observable
  String error = '';

  @observable
  String category = '';

  @action
  void setCategory(String value) => category = value;

  @observable
  CategoryModel categorySelected = CategoryModel.empty();

  @action
  setCategorySelected(CategoryModel value) => categorySelected = value;
}

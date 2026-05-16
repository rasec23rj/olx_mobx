import 'package:mobx/mobx.dart';
part 'filter_store.g.dart';

enum OrdeBy { DATE, PRICE }

class FilterStore = _FilterStoreBase with _$FilterStore;

abstract class _FilterStoreBase with Store {
  @observable
  OrdeBy order = OrdeBy.DATE;

  @action
  void setOrder(OrdeBy value) => order = value;
}

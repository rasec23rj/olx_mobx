import 'package:mobx/mobx.dart';
part 'filter_store.g.dart';

enum OrdeBy { DATE, PRICE }

enum TipoAnuncioBy { PARTICULAR, PROFISSIONAL }

class FilterStore = _FilterStoreBase with _$FilterStore;

abstract class _FilterStoreBase with Store {
  @observable
  OrdeBy order = OrdeBy.DATE;

  @action
  void setOrder(OrdeBy value) => order = value;

  @observable
  int minPrice = 0;

  @action
  void setMinPrice(int value) => minPrice = value;

  @observable
  int maxPrice = 0;

  @action
  void setMaxPrice(int value) => maxPrice = value;

  @computed
  String? get priceError =>
      maxPrice != null && minPrice != null && maxPrice < minPrice
      ? 'Faixa de preço inválida'
      : null;

  @observable
  TipoAnuncioBy tipoAnuncioBy = TipoAnuncioBy.PARTICULAR;

  @action
  void setTipoAnuncioBy(TipoAnuncioBy value) => tipoAnuncioBy = value;
}

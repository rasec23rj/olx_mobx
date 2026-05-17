import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/city_model.dart';
import 'package:olx_mobx/models/uf_model.dart';
import 'package:olx_mobx/repositories/ibge_repository.dart';
part 'filter_store.g.dart';

enum OrdeBy { DATE, PRICE }

enum TipoAnuncioBy { PARTICULAR, PROFISSIONAL }

class FilterStore = _FilterStoreBase with _$FilterStore;

abstract class _FilterStoreBase with Store {
  _FilterStoreBase() {
    loadingUfList();
  }

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

  ObservableList ufList = ObservableList();
  ObservableList cityList = ObservableList();

  @observable
  int selectedUF = 0;

  @observable
  int selectedCity = 0;

  @observable
  UfModel initialValueUf = UfModel(id: null, initials: '', name: '');

  @observable
  CityModel initialValueCity = CityModel(id: null, name: '');

  @action
  Future<void> loadingUfList() async {
    final uf = await IbgeRepository().getUFListFromApi();
    ufList.clear();
    cityList.clear();
    initialValueUf = UfModel(id: null, initials: '', name: '');
    ufList.addAll(uf);
  }

  @action
  Future<void> selectedcityList({required UfModel ufModel}) async {
    cityList.clear();
    initialValueCity = CityModel(id: null, name: '');
    final city = await IbgeRepository().getCityListFromApi(ufModel);
    cityList.addAll(city);
  }
}

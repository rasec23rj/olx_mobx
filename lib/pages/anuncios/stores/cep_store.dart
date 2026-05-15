import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/cep_model.dart';
import 'package:olx_mobx/repositories/cep_repository.dart';
part 'cep_store.g.dart';

class CepStore = _CepStoreBase with _$CepStore;

abstract class _CepStoreBase with Store {
  _CepStoreBase() {
    cep = '';
    address = CepModel.empty();
    autorun((_) {
      if (clearCep.length != 8) {
        _reset();
      } else {
        _searchCep();
      }
    });
  }

  @observable
  String cep = '';

  @action
  void setCep(String value) => cep = value;

  @computed
  String get clearCep => cep.trim().replaceAll(RegExp('[^0-9]'), '');
  bool get cepValid => clearCep.length == 8;
  String get cepError {
    if (cepValid) {
      return '';
    } else if (cep.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'cep muito curto';
    }
  }

  @observable
  CepModel address = CepModel.empty();

  @observable
  bool isAddress = false;

  @observable
  String error = '';

  @observable
  bool loading = false;

  @action
  Future<void> _searchCep() async {
    loading = true;
    isAddress = false;
    try {
      address = await CepRepository().getCepApi(cep: clearCep);
      error = '';
      loading = false;
      isAddress = true;
    } catch (e) {
      error = e.toString();
      loading = false;
      isAddress = false;
      address = CepModel.empty();
      cep = '';
    }
  }

  @action
  void _reset() {
    error = '';
    address = CepModel.empty();
    isAddress = false;
  }
}

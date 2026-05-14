import 'package:dio/dio.dart';
import 'package:olx_mobx/models/cep_model.dart';
import 'package:olx_mobx/models/city_model.dart';
import 'package:olx_mobx/repositories/ibge_repository.dart';

class CepRepository {
  Future<CepModel> getCepApi({required String cep}) async {
    if (cep == null || cep.isEmpty) {
      return Future.error('CEP invalido');
    }

    final clearCep = cep.replaceAll(RegExp('[^0-9]'), '');
    if (clearCep.length != 8) {
      return Future.error('CEP invalido');
    }

    final endpoint = 'http://viacep.com.br/ws/$clearCep/json';

    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data!.containsKey('erro') && response.data!['erro']) {
        return Future.error('CEP invalido');
      }

      final ufList = await IbgeRepository().getUFListFromApi();

      return CepModel(
        cep: response.data!['cep'],
        logradouro: response.data!['logradouro'],
        complemento: response.data!['complemento'],
        bairro: response.data!['bairro'],
        localidade: CityModel(name: response.data!['localidade']),
        uf: ufList.firstWhere((uf) => uf.initials == response.data!['uf']),
        ddd: response.data!['ddd'],
      );
    } catch (e) {
      return Future.error('CEP invalido');
    }
  }
}

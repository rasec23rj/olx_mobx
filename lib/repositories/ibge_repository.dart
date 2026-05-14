import 'package:dio/dio.dart';
import 'package:olx_mobx/models/city_model.dart';
import 'package:olx_mobx/models/uf_model.dart';

class IbgeRepository {
  Future<List<UfModel>> getUFListFromApi() async {
    const endpont =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    final response = await Dio().get<List>(endpont);
    try {
      return response.data!.map<UfModel>((uf) => UfModel.fromJson(uf)).toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } on DioException {
      return Future.error('Falha em obter lista de estados');
    }
  }

  Future<List<CityModel>> getCityListFromApi(UfModel uf) async {
    var endpont =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';
    final response = await Dio().get<List>(endpont);

    try {
      return response.data!
          .map<CityModel>((city) => CityModel.fromJson(city))
          .toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } on DioException {
      return Future.error('Falha em obter lista de cidades');
    }
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:olx_mobx/models/city_model.dart';
import 'package:olx_mobx/models/uf_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IbgeRepository {
  Future<List<UfModel>> getUFListFromApi() async {
    final preferencs = await SharedPreferences.getInstance();

    if (preferencs.containsKey('UF_LIST')) {
      debugPrint('FOUND_CACHE');
      final jsonDecode = json.decode(preferencs.get('UF_LIST').toString());
      return jsonDecode.map<UfModel>((uf) => UfModel.fromJson(uf)).toList()
        ..sort(
          (UfModel a, UfModel b) =>
              a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
    }

    const endpont =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    final response = await Dio().get<List>(endpont);

    try {
      preferencs.setString('UF_LIST', json.encode(response.data));

      debugPrint('NOT FOUND_CACHE');
      return response.data!.map<UfModel>((uf) => UfModel.fromJson(uf)).toList()
        ..sort(
          (UfModel a, UfModel b) =>
              a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
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
        ..sort(
          (CityModel a, CityModel b) =>
              a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
    } on DioException {
      return Future.error('Falha em obter lista de cidades');
    }
  }
}

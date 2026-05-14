import 'package:olx_mobx/models/city_model.dart';
import 'package:olx_mobx/models/uf_model.dart';

class CepModel {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  CityModel? localidade;
  UfModel? uf;
  String? ddd;

  CepModel.empty()
    : bairro = null,
      cep = null,
      complemento = null,
      ddd = null,
      localidade = null,
      logradouro = null,
      uf = null;

  CepModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  factory CepModel.fromJson(Map<String, dynamic> json) => CepModel(
    cep: json['cep'],
    logradouro: json['logradouro'],
    complemento: json['complemento'],
    bairro: json['bairro'],
    localidade: json['localidade'],
    uf: json['uf'],
    ddd: json['ddd'],
  );

  @override
  String toString() {
    return 'CEP{cep: $cep, logradouro: $logradouro,complemento: $complemento, bairro: $bairro,localidade: $localidade, uf: $uf,ddd: $ddd}';
  }
}

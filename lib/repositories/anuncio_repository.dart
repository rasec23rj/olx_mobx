import 'package:olx_mobx/core/utils/parser_errors.dart';
import 'package:olx_mobx/models/anuncio_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AnuncioRepository {
  Future<AnuncioModel> createAnuncio(AnuncioModel anuncio) async {
    final parserUser = ParseObject('Anuncios');

    parserUser.set<String>('title', anuncio.title!);
    parserUser.set<String>('description', anuncio.description!);
    parserUser.set<String>('category', anuncio.category!);
    parserUser.set<String>('cep', anuncio.cep!);
    parserUser.set<String>('preco', anuncio.preco!);
    parserUser.set<bool>('hidePhone', anuncio.hidePhone!);
    parserUser.set<int>('views', anuncio.views!);
    parserUser.set<String>('status', anuncio.status!.name);
    parserUser.set<String>('user', anuncio.user!);
    parserUser.set<String>('district', anuncio.district!);
    parserUser.set<String>('city', anuncio.city!);
    parserUser.set<String>('uf', anuncio.uf!);
    parserUser.set<List<dynamic>>('imagePath', anuncio.imagePath!);
    final userParse = ParseUser('', '', '')..objectId = anuncio.user;
    final parseACL = ParseACL(owner: userParse);
    parseACL.setPublicReadAccess(allowed: true);
    parseACL.setPublicWriteAccess(allowed: false);
    parserUser.setACL(parseACL);
    final response = await parserUser.save();

    if (response.success) {
      return AnuncioModel.fromParse(response.result);
    } else {
      return Future.error(
        ParseErrors.getDescription(response.error!.code) ?? 'Erro desconhecido',
      );
    }
  }

  Future<List<AnuncioModel>> getList() async {
    final queryBuilder = QueryBuilder(ParseObject('Anuncios'))
      ..orderByAscending('title');

    final response = await queryBuilder.query();

    if (response.success) {
      return response.results!
          .map((value) => AnuncioModel.fromParse(value))
          .toList();
    } else {
      throw ParseErrors.getDescription(response.error!.code) ?? '';
    }
  }
}

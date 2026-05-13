import 'package:olx_mobx/core/utils/parser_errors.dart';
import 'package:olx_mobx/models/anuncio_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AnuncioRepository {
  Future<void> createAnuncio(AnuncioModel anuncio) async {
    final parserUser = ParseObject('Anuncios');

    parserUser.set<String>('title', anuncio.title);
    parserUser.set<String>('description', anuncio.description);
    parserUser.set<String>('category', anuncio.category);
    parserUser.set<String>('cep', anuncio.cep);
    parserUser.set<String>('preco', anuncio.preco);
    parserUser.set<List<ParseFile>>('imagePath', anuncio.imagePath);

    final response = await parserUser.save();

    if (response.success) {
    } else {
      return Future.error(
        ParseErrors.getDescription(response.error!.code) ?? 'Erro desconhecido',
      );
    }
  }
}

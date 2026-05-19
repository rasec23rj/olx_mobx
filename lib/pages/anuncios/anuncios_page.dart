import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/models/anuncio_model.dart';
import 'package:olx_mobx/pages/anuncios/detalhe_anuncio.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';
import 'package:olx_mobx/pages/anuncios/widget/top_bar.dart';
import 'package:olx_mobx/core/utils/extensions.dart';

class AnunciosPage extends StatefulWidget {
  const AnunciosPage({super.key});

  @override
  State<AnunciosPage> createState() => _AnunciosPageState();
}

class _AnunciosPageState extends State<AnunciosPage> {
  AnuncioStore anuncioStore = GetIt.I<AnuncioStore>();

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    anuncioStore.loadAnuncios();
  }

  void navegatorPageDetalhe(AnuncioModel anuncios) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return DetalheAnuncio(anuncios: anuncios, anuncioStore: anuncioStore);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopBarWidget(),
        const SizedBox(height: 20),
        Observer(
          builder: (_) {
            if (anuncioStore.loading && anuncioStore.listAnuncios.isNotEmpty) {
              return Align(
                alignment: Alignment.center,
                child: Text(
                  'Anuncio não encontrado!',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              );
            }

            return anuncioStore.showProgress
                ? Center(child: CircularProgressIndicator(color: Colors.white))
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ListView.builder(
                        itemCount: anuncioStore.incrementCount,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final anuncios = anuncioStore.listAnuncios;
                          if (index < anuncioStore.listAnuncios.length) {
                            return GestureDetector(
                              onTap: () {
                                anuncioStore.getUser(anuncios[index].user!);
                                navegatorPageDetalhe(anuncios[index]);
                              },

                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                clipBehavior: Clip.antiAlias,
                                elevation: 8,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    SizedBox(
                                      height: 120,
                                      width: 140,
                                      child: Image.network(
                                        anuncios[index].imagePath![0].url,
                                        cacheHeight: 100,
                                        cacheWidth: 140,
                                        height: 100,
                                        width: 140,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    const SizedBox(width: 20, height: 50),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              anuncios[index].title!,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              anuncios[index].preco!
                                                  .formattedMoney(),
                                              style: TextStyle(
                                                fontSize: 19,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              '${anuncios[index].createdAt!.formattedDate()} - '
                                              '${anuncios[index].city} - '
                                              '${anuncios[index].uf}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13,
                                              ),
                                              maxLines: null,
                                              softWrap: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          anuncioStore.loadNextPage();
                          return SizedBox(
                            height: 10,
                            child: LinearProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/models/anuncio_model.dart';
import 'package:olx_mobx/pages/anuncios/detalhe_anuncio.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';
import 'package:olx_mobx/pages/anuncios/widget/create_anuncio_button.dart';
import 'package:olx_mobx/pages/anuncios/widget/top_bar.dart';
import 'package:olx_mobx/core/utils/extensions.dart';

class AnunciosPage extends StatefulWidget {
  const AnunciosPage({super.key});

  @override
  State<AnunciosPage> createState() => _AnunciosPageState();
}

class _AnunciosPageState extends State<AnunciosPage> {
  AnuncioStore anuncioStore = GetIt.I<AnuncioStore>();
  final ScrollController scrollController = ScrollController();

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
        Expanded(
          child: Stack(
            children: [
              Observer(
                builder: (_) {
                  if (anuncioStore.showProgress) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }

                  if (anuncioStore.loading &&
                      anuncioStore.listAnuncios.isEmpty) {
                    return const Center(
                      child: Text(
                        'Anuncio não encontrado!',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    child: ListView.builder(
                      itemCount: anuncioStore.incrementCount,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        if (index >= anuncioStore.listAnuncios.length) {
                          anuncioStore.loadNextPage();

                          return const Padding(
                            padding: EdgeInsets.all(10),
                            child: LinearProgressIndicator(),
                          );
                        }

                        final anuncio = anuncioStore.listAnuncios[index];

                        return GestureDetector(
                          onTap: () {
                            anuncioStore.getUser(anuncio.user!);

                            navegatorPageDetalhe(anuncio);
                          },

                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),

                            clipBehavior: Clip.antiAlias,

                            child: Row(
                              children: [
                                SizedBox(
                                  height: 120,
                                  width: 140,
                                  child: Image.network(
                                    anuncio.imagePath![0].url,
                                    fit: BoxFit.cover,
                                    cacheHeight: 120,
                                    cacheWidth: 140,
                                  ),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          anuncio.title!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          anuncio.preco!.formattedMoney(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          '${anuncio.createdAt!.formattedDate()} - '
                                          '${anuncio.city}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Positioned(
                bottom: -50,
                left: 0,
                right: 0,
                child: CreateAnuncioButton(scrollController: scrollController),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

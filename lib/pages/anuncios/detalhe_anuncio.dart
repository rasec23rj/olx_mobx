import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:olx_mobx/core/utils/extensions.dart';
import 'package:olx_mobx/models/anuncio_model.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';
import 'package:olx_mobx/pages/anuncios/widget/image_slider.dart';

class DetalheAnuncio extends StatelessWidget {
  final AnuncioModel anuncios;
  final AnuncioStore anuncioStore;
  const DetalheAnuncio({
    super.key,
    required this.anuncios,
    required this.anuncioStore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(anuncios.title!)),
      body: Column(
        children: [
          ImageSlider(images: anuncios.imagePath!),

          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),

            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        anuncios.preco!.formattedMoney(),
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        anuncios.title!,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Publicado em ${anuncios.createdAt!.formattedDate()}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    anuncios.description!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Localização',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RowTitle(anuncios: anuncios.cep!, title: 'Cep'),
                  const SizedBox(height: 10),
                  RowTitle(anuncios: anuncios.city!, title: 'Cidade'),
                  const SizedBox(height: 10),
                  RowTitle(anuncios: anuncios.district!, title: 'Bairro'),
                  const SizedBox(height: 10),
                  RowTitle(anuncios: anuncios.uf!, title: 'Estado'),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black.withOpacity(0.2)),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Observer(
                builder: (_) {
                  return Text(
                    "Anunciante: ${anuncioStore.userName}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: Container(
        height: 50,

        margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
        width: MediaQuery.of(context).size.width * 0.92,
        decoration: BoxDecoration(
          color: Colors.amber[700],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                'Ligar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VerticalDivider(
                color: Colors.white.withOpacity(0.8),
                thickness: 1,
                width: 20,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'Chat',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowTitle extends StatelessWidget {
  final String anuncios;
  final String title;

  const RowTitle({super.key, required this.anuncios, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        SizedBox(
          width: 150,
          child: Text(
            anuncios,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

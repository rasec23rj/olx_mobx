import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';

class AnunciosPage extends StatefulWidget {
  final AnuncioStore anuncioStore;
  const AnunciosPage({super.key, required this.anuncioStore});

  @override
  State<AnunciosPage> createState() => _AnunciosPageState();
}

class _AnunciosPageState extends State<AnunciosPage> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => widget.anuncioStore.loading
          ? Center(child: CircularProgressIndicator(color: Colors.white))
          : ListView.builder(
              itemCount: widget.anuncioStore.listAnuncios.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    widget.anuncioStore.listAnuncios[index].title,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
    );
  }
}

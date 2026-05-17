import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';
import 'package:olx_mobx/pages/anuncios/widget/top_bar.dart';

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
    await anuncioStore.loadAnuncios();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => anuncioStore.loading
          ? Center(child: CircularProgressIndicator(color: Colors.white))
          : Column(
              children: [
                TopBarWidget(),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: anuncioStore.listAnuncios.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          anuncioStore.listAnuncios[index].title!,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

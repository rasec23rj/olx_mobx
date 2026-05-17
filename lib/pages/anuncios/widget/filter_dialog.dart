import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/pages/anuncios/stores/filter_store.dart';
import 'package:olx_mobx/pages/anuncios/widget/filter/localizacao_by_field.dart';
import 'package:olx_mobx/pages/anuncios/widget/filter/order_by_field.dart';
import 'package:olx_mobx/pages/anuncios/widget/filter/pricec_by_field.dart';
import 'package:olx_mobx/pages/anuncios/widget/filter/tipo_anuncio_by_field.dart';

class FilterDialog extends StatelessWidget {
  FilterDialog({super.key});

  FilterStore filterStore = GetIt.I<FilterStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filtro de Busca')),
      body: Dialog(
        backgroundColor: Colors.transparent,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                LocalizacaoByField(filterStore: filterStore),
                OrderByField(filterStore: filterStore),
                PricecByField(filterStore: filterStore),
                TipoAnuncioByField(filterStore: filterStore),
                const SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: filterStore.isFormValidFilter
                              ? Colors.amber[900]
                              : Colors.grey[400],
                          foregroundColor: Colors.white,
                        ),
                        onPressed: filterStore.isFormValidFilter ? () {} : null,
                        child: Text(
                          'Filtar'.toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

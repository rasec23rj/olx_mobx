import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/pages/anuncios/stores/filter_store.dart';
import 'package:olx_mobx/pages/anuncios/widget/filter/section_title_filter.dart';

class TipoAnuncioByField extends StatelessWidget {
  final FilterStore filterStore;
  const TipoAnuncioByField({super.key, required this.filterStore});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleFilter(title: 'Tipo de anunciante'),

        Observer(
          builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              tipoAnuncioOption(
                title: 'Particular',
                tipo: TipoAnuncioBy.PARTICULAR,
              ),

              tipoAnuncioOption(
                title: 'Profissional',
                tipo: TipoAnuncioBy.PROFISSIONAL,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tipoAnuncioOption({
    required String title,
    required TipoAnuncioBy tipo,
  }) {
    return GestureDetector(
      onTap: () {
        filterStore.setTipoAnuncioBy(tipo);
      },
      child: Container(
        height: 50,
        width: 120,

        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: filterStore.tipoAnuncioBy == tipo
              ? Colors.deepPurple
              : Colors.grey,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

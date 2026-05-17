import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/models/city_model.dart';
import 'package:olx_mobx/models/uf_model.dart';
import 'package:olx_mobx/pages/anuncios/stores/filter_store.dart';
import 'package:olx_mobx/pages/anuncios/widget/filter/section_title_filter.dart';

class LocalizacaoByField extends StatelessWidget {
  final FilterStore filterStore;
  const LocalizacaoByField({super.key, required this.filterStore});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleFilter(title: 'Localização por'),

        Observer(
          builder: (_) {
            return DropdownButtonFormField<UfModel>(
              initialValue: filterStore.initialValueUf.name!.isNotEmpty
                  ? filterStore.initialValueUf
                  : null,
              decoration: InputDecoration(
                labelText: 'Selecione um estado',
                border: UnderlineInputBorder(),
              ),

              items: filterStore.ufList.map((item) {
                return DropdownMenuItem<UfModel>(
                  value: item,
                  child: Text(item.name),
                );
              }).toList(),
              onChanged: (value) {
                filterStore.selectedUF = value!.id!;
                filterStore.initialValueUf = value;
                filterStore.selectedcityList(ufModel: value);
              },
            );
          },
        ),
        const SizedBox(height: 20),
        Observer(
          builder: (_) {
            return DropdownButtonFormField<CityModel>(
              initialValue: filterStore.initialValueCity.name!.isNotEmpty
                  ? filterStore.initialValueCity
                  : null,
              decoration: InputDecoration(labelText: 'Selecione uma cidade'),

              items: filterStore.cityList.map((item) {
                return DropdownMenuItem<CityModel>(
                  enabled: filterStore.selectedUF != 0 ? true : false,
                  value: filterStore.selectedUF != 0 ? item : null,
                  child: Wrap(
                    children: [
                      Text(
                        item!.name,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        maxLines: null,
                        textScaler: TextScaler.linear(1),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                // filterStore.selectedUF = value!.id;
                filterStore.initialValueCity = value!;
              },
            );
          },
        ),
      ],
    );
  }
}

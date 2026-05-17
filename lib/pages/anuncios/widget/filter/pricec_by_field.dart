import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/pages/anuncios/stores/filter_store.dart';
import 'package:olx_mobx/pages/anuncios/widget/filter/section_title_filter.dart';

class PricecByField extends StatelessWidget {
  final FilterStore filterStore;
  const PricecByField({super.key, required this.filterStore});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleFilter(title: 'Preço'),
        Observer(
          builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                precoFilterWidget(
                  title: 'Min',
                  onChanged: filterStore.setMinPrice,
                  initialValue: filterStore.minPrice,
                ),
                const SizedBox(width: 10),
                precoFilterWidget(
                  title: 'Max',
                  onChanged: filterStore.setMaxPrice,
                  initialValue: filterStore.maxPrice,
                ),
              ],
            );
          },
        ),
        Observer(
          builder: (_) {
            return filterStore.priceError != null
                ? Text(
                    '${filterStore.priceError}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : Text('');
          },
        ),
      ],
    );
  }

  Widget precoFilterWidget({
    required String title,
    required void Function(int) onChanged,
    required int initialValue,
  }) {
    return Container(
      width: 120,
      height: 50,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
        shape: BoxShape.rectangle,
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter(moeda: false),
        ],
        decoration: InputDecoration(
          prefixText: 'R\$ ',
          border: InputBorder.none,
          label: Text(title),
        ),
        onChanged: (text) {
          if (text.isNotEmpty) {
            onChanged(int.tryParse(text.replaceAll('.', ''))!);
          }
        },
        initialValue: initialValue.toString(),
      ),
    );
  }
}

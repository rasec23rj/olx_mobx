import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/pages/anuncios/stores/filter_store.dart';

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
                orderByField(),
                pricecByField(),
                tipoAnuncioByField(),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text('Filtar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget orderByField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitleFilter(title: 'Ordernar por'),
        Observer(
          builder: (_) => Row(
            children: [
              orderOption(title: 'Data', order: OrdeBy.DATE),
              const SizedBox(width: 50),
              orderOption(title: 'Preço', order: OrdeBy.PRICE),
            ],
          ),
        ),
      ],
    );
  }

  Widget pricecByField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitleFilter(title: 'Preço'),
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

  Widget tipoAnuncioByField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitleFilter(title: 'Tipo de anunciante'),

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

  Widget orderOption({required String title, required OrdeBy order}) {
    return GestureDetector(
      onTap: () {
        filterStore.setOrder(order);
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: filterStore.order == order ? Colors.deepPurple : Colors.grey,
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

  Widget sectionTitleFilter({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
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

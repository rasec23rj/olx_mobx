import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/pages/anuncios/stores/filter_store.dart';

class FilterDialog extends StatelessWidget {
  FilterDialog({super.key});

  FilterStore filterStore = FilterStore();

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
              mainAxisSize: MainAxisSize.min,
              children: [orderByField()],
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
        const SizedBox(height: 10),
        Observer(
          builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              orderOption(title: 'Data', order: OrdeBy.DATE),
              orderOption(title: 'Preço', order: OrdeBy.PRICE),
            ],
          ),
        ),
      ],
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
}

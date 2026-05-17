import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/pages/anuncios/stores/filter_store.dart';
import 'package:olx_mobx/pages/anuncios/widget/filter/section_title_filter.dart';

class OrderByField extends StatelessWidget {
  final FilterStore filterStore;
  const OrderByField({super.key, required this.filterStore});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleFilter(title: 'Ordernar por'),
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
}

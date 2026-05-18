import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';
import 'package:olx_mobx/pages/anuncios/widget/category_widget.dart';
import 'package:olx_mobx/pages/anuncios/widget/filter_dialog.dart';

class TopBarWidget extends StatelessWidget {
  TopBarWidget({super.key});
  AnuncioStore anuncioStore = GetIt.I<AnuncioStore>();
  @override
  Widget build(BuildContext context) {
    Future<dynamic> openSearchCategoria() async {
      await showDialog(context: context, builder: (_) => categoryDialog());
    }

    Future<dynamic> openSearchFiltro() async {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => FilterDialog()));
    }

    return Row(
      children: [
        Observer(
          builder: (_) {
            return barButton(
              title: (anuncioStore.category.title != null)
                  ? anuncioStore.category.title
                  : 'Categorias',
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[400]!)),
              ),
              onTap: () {
                openSearchCategoria();
              },
            );
          },
        ),
        Observer(
          builder: (_) {
            return barButton(
              title: 'Filtros',
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[400]!),
                  left: BorderSide(color: Colors.grey[400]!),
                ),
              ),
              onTap: () => openSearchFiltro(),
            );
          },
        ),
      ],
    );
  }
}

Widget barButton({
  required String? title,
  Decoration? decoration,
  void Function()? onTap,
}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: decoration,
        height: 40,
        alignment: Alignment.center,
        child: Text(
          title!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

Widget categoryDialog() {
  return Dialog(
    backgroundColor: Colors.white,
    child: Container(
      padding: EdgeInsets.all(20),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: CategoryWidget(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/models/category_model.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';
import 'package:olx_mobx/pages/anuncios/stores/category_store.dart';

class CategoryWidget extends StatelessWidget {
  final String? errorText;
  CategoryWidget({super.key, this.errorText});

  CategoryStore categoryStore = GetIt.I<CategoryStore>();
  AnuncioStore anuncioStore = GetIt.I<AnuncioStore>();
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CategoryModel>(
      initialValue: categoryStore.categorySelected.title != null
          ? categoryStore.categorySelected
          : null,
      decoration: InputDecoration(
        labelText: 'Selecione uma opção',
        border: InputBorder.none,
        errorText: errorText,
        errorStyle: TextStyle(
          color: errorText != null ? Colors.black : Colors.red,
        ),
      ),

      items: categoryStore.categoryList.map((item) {
        return DropdownMenuItem<CategoryModel>(
          value: item,
          child: Text(item.title!),
        );
      }).toList(),
      onChanged: (value) {
        anuncioStore.setCategory(value!);
        categoryStore.setCategorySelected(value);
      },
    );
  }
}

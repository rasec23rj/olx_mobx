import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/pages/anuncios/category_widget.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';
import 'package:olx_mobx/widgets/custom_text_filed.dart';
import 'package:olx_mobx/widgets/image_field.dart';

class CriarAnuncios extends StatefulWidget {
  const CriarAnuncios({super.key});

  @override
  _CriarAnunciosState createState() => _CriarAnunciosState();
}

class _CriarAnunciosState extends State<CriarAnuncios> {
  AnuncioStore anuncioStore = GetIt.I<AnuncioStore>();
  final String selected = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (_, constrains) {
          return Container(
            width: constrains.maxWidth < 600 ? 375 : 375,
            padding: const EdgeInsets.all(20),
            child: Card(
              // padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ImageField(),
                    const SizedBox(height: 20),
                    Observer(
                      builder: (_) {
                        return CustomTextFiled(
                          label: 'Titulo *',
                          borderRadius: 0,
                          onChanged: anuncioStore.setTitle,
                          errorText: anuncioStore.titleError,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextFiled(
                          label: 'Descrição *',
                          maxLines: null,
                          onChanged: anuncioStore.setDescription,
                          errorText: anuncioStore.descriptionError,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return CategoryWidget(
                          errorText: anuncioStore.categoryError,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextFiled(
                          label: 'CEP *',
                          hintText: '26000-000',
                          keyBoardType: TextInputType.number,
                          onChanged: anuncioStore.setCep,
                          errorText: anuncioStore.cepError,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextFiled(
                          label: 'Preço *',
                          onChanged: anuncioStore.setPreco,
                          errorText: anuncioStore.precoError,
                          keyBoardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            RealInputFormatter(moeda: true),
                          ],
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return Row(
                          children: [
                            Checkbox(value: true, onChanged: (bool? value) {}),
                            Text('Acultar o meu telefone neste anúncio'),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Observer(
                      builder: (_) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(),
                              ),
                            ),
                            onPressed: anuncioStore.anuncioPress,
                            child: anuncioStore.loading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text('Enviar'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

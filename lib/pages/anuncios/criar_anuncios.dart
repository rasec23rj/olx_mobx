import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_mobx/pages/anuncios/category_widget.dart';
import 'package:olx_mobx/pages/anuncios/cep_widget.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';
import 'package:olx_mobx/pages/anuncios/stores/cep_store.dart';
import 'package:olx_mobx/widgets/custom_text_filed.dart';
import 'package:olx_mobx/widgets/image_field.dart';
import 'package:olx_mobx/widgets/store/page_store.dart';

class CriarAnuncios extends StatefulWidget {
  const CriarAnuncios({super.key});

  @override
  _CriarAnunciosState createState() => _CriarAnunciosState();
}

class _CriarAnunciosState extends State<CriarAnuncios> {
  AnuncioStore anuncioStore = GetIt.I<AnuncioStore>();
  CepStore cepStore = CepStore();
  PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    anuncioStore.images = ObservableList();
    return SafeArea(
      child: LayoutBuilder(
        builder: (_, constrains) {
          return Container(
            width: constrains.maxWidth < 600 ? 375 : 375,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CategoryWidget(
                            errorText: anuncioStore.categoryError,
                          ),
                        );
                      },
                    ),
                    CepWidget(anuncioStore: anuncioStore),
                    const SizedBox(height: 20),
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
                            Checkbox(
                              value: anuncioStore.hidePhone,
                              onChanged: (value) {
                                anuncioStore.setHidePhone(value!);
                              },
                            ),
                            Expanded(
                              child: Text(
                                'Ocultar o meu telefone neste anúncio',
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    Observer(
                      builder: (_) {
                        return SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: anuncioStore.anuncioPress,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: anuncioStore.isFormValid
                                  ? Colors.orange[400]
                                  : Colors.grey,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(),
                            ),
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

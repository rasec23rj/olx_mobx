import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_mobx/pages/anuncios/widget/category_widget.dart';
import 'package:olx_mobx/pages/anuncios/widget/cep_widget.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';

import 'package:olx_mobx/widgets/custom_text_filed.dart';
import 'package:olx_mobx/widgets/error_box.dart';
import 'package:olx_mobx/widgets/image_field.dart';
import 'package:olx_mobx/widgets/store/page_store.dart';

class CriarAnuncios extends StatefulWidget {
  const CriarAnuncios({super.key});

  @override
  _CriarAnunciosState createState() => _CriarAnunciosState();
}

class _CriarAnunciosState extends State<CriarAnuncios> {
  AnuncioStore anuncioStore = GetIt.I<AnuncioStore>();
  PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();
    when((_) => anuncioStore.saved.preco! > 0, () {
      pageStore.setPage(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    anuncioStore.images = ObservableList();
    return SafeArea(
      child: LayoutBuilder(
        builder: (_, constrains) {
          return Container(
            width: constrains.maxWidth < 600 ? 375 : 375,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Card(
              clipBehavior: Clip.antiAlias,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
              child: SingleChildScrollView(
                child: Observer(
                  builder: (_) {
                    if (anuncioStore.loading) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              'Salvando anúncio',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.deepPurple,
                              ),
                            ),
                            const SizedBox(height: 16),
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Column(
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
                                  errorText: anuncioStore.categoryError!,
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
                                onChanged: (value) =>
                                    anuncioStore.setPreco(int.tryParse(value)!),
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
                          Observer(
                            builder: (_) {
                              return ErrorBox(message: anuncioStore.error);
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
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text('Enviar'),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

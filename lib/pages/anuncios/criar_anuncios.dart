import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/pages/anuncios/anuncio_store.dart';
import 'package:olx_mobx/widgets/custom_text_filed.dart';
import 'package:olx_mobx/widgets/image_field.dart';

class CriarAnuncios extends StatefulWidget {
  const CriarAnuncios({super.key});

  @override
  _CriarAnunciosState createState() => _CriarAnunciosState();
}

class _CriarAnunciosState extends State<CriarAnuncios> {
  AnuncioStore anuncioStore = GetIt.I<AnuncioStore>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            // padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ImageField(),
                  const SizedBox(height: 20),
                  CustomTextFiled(label: 'Titulo *', borderRadius: 0),
                  CustomTextFiled(label: 'Descrição *', maxLines: null),
                  CustomTextFiled(label: 'Categoria *'),
                  CustomTextFiled(
                    label: 'CEP *',
                    hintText: '26000-000',
                    keyBoardType: TextInputType.number,
                  ),
                  CustomTextFiled(
                    label: 'Preço *',

                    keyBoardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      RealInputFormatter(moeda: true),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (bool? value) {}),
                      Text('Acultar o meu telefone neste anúncio'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Enviar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

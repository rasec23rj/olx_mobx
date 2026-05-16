import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';
import 'package:olx_mobx/pages/anuncios/stores/cep_store.dart';
import 'package:olx_mobx/widgets/custom_text_filed.dart';

class CepWidget extends StatelessWidget {
  CepWidget({super.key, required this.anuncioStore})
    : cepStore = anuncioStore.cepStore;

  final AnuncioStore anuncioStore;
  final CepStore cepStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFiled(
              label: 'CEP *',
              hintText: '26000-000',
              keyBoardType: TextInputType.number,
              onChanged: cepStore.setCep,
              errorText: cepStore.cepError,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            cepStore.loading
                ? LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.deepPurpleAccent),
                  )
                : SizedBox(),
            if (cepStore.error.isNotEmpty)
              Container(
                color: Colors.red.withOpacity(0.1),
                height: 50,
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    cepStore.error!,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

            cepStore.isAddress
                ? Container(
                    color: Colors.deepPurpleAccent,
                    padding: EdgeInsets.all(8),
                    child: Wrap(
                      children: [
                        Text(
                          '''${cepStore.address!.logradouro} ${cepStore.address!.bairro} ${cepStore.address!.uf!.initials}''',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox.square(),
          ],
        );
      },
    );
  }
}

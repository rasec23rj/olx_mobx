import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/pages/anuncios/anuncio_store.dart';

class ImageSourceModal extends StatefulWidget {
  const ImageSourceModal({super.key});

  @override
  State<ImageSourceModal> createState() => _ImageSourceModalState();
}

class _ImageSourceModalState extends State<ImageSourceModal> {
  AnuncioStore anuncioStore = GetIt.I<AnuncioStore>();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      builder: (context) => SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Observer(
                builder: (_) {
                  return !Platform.isLinux ||
                          Platform.isWindows ||
                          Platform.isMacOS
                      ? TextButton.icon(
                          onPressed: () => anuncioStore.pickImage(context),
                          label: Text('Camera'),
                          icon: Icon(Icons.camera_alt, size: 30),
                        )
                      : SizedBox();
                },
              ),
              Observer(
                builder: (_) {
                  return TextButton.icon(
                    onPressed: () => anuncioStore.gelleryImage(context),
                    label: Text('Galeria'),
                    icon: Icon(Icons.browse_gallery, size: 30),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      onClosing: () {},
    );
  }
}

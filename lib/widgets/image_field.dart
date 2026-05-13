import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:olx_mobx/pages/anuncios/anuncio_store.dart';
import 'package:olx_mobx/widgets/image_source_modal.dart';

class ImageField extends StatelessWidget {
  ImageField({super.key});
  AnuncioStore anuncioStore = GetIt.I<AnuncioStore>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),

      height: 120,
      child: Observer(
        builder: (_) => ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),

          itemBuilder: (_, index) {
            if (anuncioStore.images.length == index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(8, 8, index == 4 ? 8 : 0, 8),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ImageSourceModal();
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: 44,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt, color: Colors.white, size: 40),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.fromLTRB(8, 8, index == 4 ? 8 : 0, 8),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ImageSourceModal();
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: 44,
                    backgroundImage: FileImage(anuncioStore.images[index]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        index != -1
                            ? SizedBox()
                            : Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 40,
                              ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
          scrollDirection: Axis.horizontal,
          itemCount: anuncioStore.images.length < 5
              ? anuncioStore.images.length + 1
              : 5,
        ),
      ),
    );
  }
}

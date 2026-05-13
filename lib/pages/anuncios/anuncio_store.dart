import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'anuncio_store.g.dart';

class AnuncioStore = _AnuncioStoreBase with _$AnuncioStore;

abstract class _AnuncioStoreBase with Store {
  @observable
  File? imageFile;

  @observable
  CroppedFile? croppedFile;

  @action
  Future<void> pickImage(BuildContext context) async {
    try {
      // ANDROID / IOS
      if (Platform.isAndroid || Platform.isIOS) {
        final picker = ImagePicker();

        final XFile? image = await picker.pickImage(source: ImageSource.camera);

        if (image != null) {
          imageFile = File(image.path);
          _imageSlected(image.path);
        }
      }
      // LINUX / WINDOWS / MACOS
      else if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
        final result = await FilePicker.pickFiles(type: FileType.any);

        if (result != null && result.files.single.path != null) {
          imageFile = File(result.files.single.path!);
          images.add(imageFile);
        }
      }
      Navigator.of(context).pop();
    } catch (e) {
      debugPrint('Erro ao selecionar imagem: $e');
    }
  }

  @action
  Future<void> gelleryImage(BuildContext context) async {
    try {
      // ANDROID / IOS
      if (Platform.isAndroid || Platform.isIOS) {
        final picker = ImagePicker();

        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
        );

        if (image != null) {
          imageFile = File(image.path);
          _imageSlected(image.path);
        }
      }
      // LINUX / WINDOWS / MACOS
      else if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
        final result = await FilePicker.pickFiles(type: FileType.any);

        if (result != null && result.files.single.path != null) {
          imageFile = File(result.files.single.path!);
          images.add(imageFile);
        }
      }
      Navigator.of(context).pop();
    } catch (e) {
      debugPrint('Erro ao selecionar imagem: $e');
    }
  }

  Future<void> _imageSlected(String path) async {
    croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Editar Imagem',
          toolbarWidgetColor: Colors.white,
          hideBottomControls: false,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          title: 'Editar Imagem',
          doneButtonTitle: 'Concluir',
          cancelButtonTitle: 'Cancelar',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
          ],
        ),
      ],
    );
    if (croppedFile != null) onImageSelected(croppedFile);
  }

  @action
  void onImageSelected(croppedFile) {
    images.add(croppedFile);
  }

  ObservableList images = ObservableList();
}

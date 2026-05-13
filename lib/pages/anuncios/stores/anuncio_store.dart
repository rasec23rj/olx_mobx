import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/anuncio_model.dart';
import 'package:olx_mobx/repositories/anuncio_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
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

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 6;
  String get titleError {
    if (titleValid) {
      return '';
    } else if (title.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Title muito curto';
    }
  }

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description.length >= 6;
  String get descriptionError {
    if (descriptionValid) {
      return '';
    } else if (description.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Descrição muito curto';
    }
  }

  @observable
  String category = '';

  @action
  void setCategory(String value) => category = value;

  @computed
  bool get categoryValid => category.isNotEmpty;
  String get categoryError {
    if (categoryValid) {
      return '';
    } else if (category.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Category muito curto';
    }
  }

  @observable
  String cep = '';

  @action
  void setCep(String value) => cep = value;

  @computed
  bool get cepValid => cep.length == 8;
  String get cepError {
    if (cepValid) {
      return '';
    } else if (cep.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'cep muito curto';
    }
  }

  @observable
  String preco = '';

  @action
  void setPreco(String value) => preco = value;

  @computed
  bool get precoValid => preco.isNotEmpty;
  String get precoError {
    if (precoValid) {
      return '';
    } else if (preco.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'preco muito curto';
    }
  }

  @observable
  bool loading = false;

  @observable
  String? error;

  @computed
  VoidCallback? get anuncioPress =>
      (isFormValid && !loading) ? _createAnuncio : null;

  @computed
  bool get isFormValid =>
      titleValid && descriptionValid && categoryValid && cepValid && precoValid;

  @action
  Future<void> _createAnuncio() async {
    loading = true;
    List<ParseFile> arquivos = [];
    for (File image in images) {
      ParseFile parseFile = ParseFile(image);

      await parseFile.save();

      arquivos.add(parseFile);
    }

    final anuncio = AnuncioModel(
      title: title,
      description: description,
      category: category,
      cep: cep,
      preco: preco.replaceAll('R\$', '').trim(),
      imagePath: arquivos,
    );
    try {
      await AnuncioRepository().createAnuncio(anuncio);
    } catch (e) {
      error = e.toString();
    }
    loading = false;
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_mobx/core/session/session_store_user.dart';
import 'package:olx_mobx/pages/anuncios/anuncios_page.dart';
import 'package:olx_mobx/pages/anuncios/criar_anuncios.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';
import 'package:olx_mobx/pages/anuncios/stores/filter_store.dart';
import 'package:olx_mobx/pages/sign_in/sign_in.dart';
import 'package:olx_mobx/widgets/custom_drawer.dart';
import 'package:olx_mobx/widgets/store/page_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageStore pageStore = GetIt.I<PageStore>();
  AnuncioStore anuncioStore = GetIt.I<AnuncioStore>();
  SessionStoreUser sessionStoreUser = GetIt.I<SessionStoreUser>();
  FilterStore filterStore = GetIt.I<FilterStore>();
  final pageEC = PageController();

  @override
  void initState() {
    super.initState();

    reaction((_) => pageStore.page, (page) => pageEC.jumpToPage(page));
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await sessionStoreUser.getCurrentUser();
    reaction((_) => pageStore.page, (page) => pageEC.jumpToPage(page));
    if (sessionStoreUser.user.name!.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignIn()));
      });
    }
  }

  void mudarTitulo() {
    reaction((_) => pageStore.page, (page) => pageEC.jumpToPage(page));
  }

  Future<dynamic> openSearch(BuildContext context) async {
    final search = await showDialog(
      context: context,
      builder: (_) => searchDialog(context),
    );
    if (search != null) {
      anuncioStore.setSearch(search);
    }
  }

  Future<dynamic> deleteSearch(BuildContext context) async {
    filterStore.resetLoading();
    anuncioStore.setSearch('');
  }

  final searchEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Scaffold(
          appBar: AppBar(
            title: Observer(
              builder: (_) {
                return anuncioStore.search.isEmpty
                    ? textAppBar(pageStore.page)
                    : Text(anuncioStore.search);
              },
            ),
            actions: [
              Observer(
                builder: (_) {
                  return pageStore.page == 0
                      ? IconButton(
                          onPressed: () =>
                              (anuncioStore.search == "" &&
                                  anuncioStore.category.title != null)
                              ? openSearch(context)
                              : deleteSearch(context),
                          icon: Icon(
                            anuncioStore.search.isEmpty
                                ? Icons.search
                                : Icons.delete,
                            color: anuncioStore.search.isEmpty
                                ? Colors.white
                                : Colors.red,
                          ),
                        )
                      : SizedBox();
                },
              ),
            ],
          ),
          body: Center(
            child: SizedBox(
              width: constraints.maxWidth < 600 ? 375 : 600,
              child: PageView(
                controller: pageEC,
                onPageChanged: (value) => mudarTitulo,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Observer(
                    builder: (_) {
                      return AnunciosPage();
                    },
                  ),
                  CriarAnuncios(),
                  Container(color: Colors.brown),
                  Container(color: Colors.grey),
                  Container(color: Colors.yellow),
                ],
              ),
            ),
          ),
          drawer: customDrawer(context),
        ),
      ),
    );
  }

  Widget searchDialog(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: searchEC,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                border: InputBorder.none,
                prefixIcon: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchEC.clear();
                  },
                  icon: Icon(Icons.close),
                ),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                Navigator.of(context).pop(value);
              },
              autofocus: true,
            ),
          ),
        ),
      ],
    );
  }
}

Widget textAppBar(int page) {
  switch (page) {
    case 0:
      return Text('Anúncios');
    case 1:
      return Text('Criar Anúncios');
    case 2:
      return Text('Chat');
    case 3:
      return Text('Favorito');

    default:
      return Text('Minha Conta');
  }
}

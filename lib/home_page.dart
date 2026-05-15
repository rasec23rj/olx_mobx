import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_mobx/core/session/session_store_user.dart';
import 'package:olx_mobx/pages/anuncios/anuncios_page.dart';
import 'package:olx_mobx/pages/anuncios/criar_anuncios.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';
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
  final pageEC = PageController();
  AnuncioStore anuncioStore = GetIt.I<AnuncioStore>();
  SessionStoreUser sessionStoreUser = GetIt.I<SessionStoreUser>();
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
    if (sessionStoreUser.user.name.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignIn()));
      });
    }
  }

  void mudarTitulo() {
    reaction((_) => pageStore.page, (page) => pageEC.jumpToPage(page));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Scaffold(
          appBar: AppBar(
            title: Observer(
              builder: (_) {
                return textAppBar(pageStore.page);
              },
            ),
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
                      return AnunciosPage(anuncioStore: anuncioStore);
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

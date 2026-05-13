import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_mobx/pages/anuncios/anincios_page.dart';
import 'package:olx_mobx/pages/anuncios/criar_anuncios.dart';
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

  @override
  void initState() {
    super.initState();
    reaction((_) => pageStore.page, (page) => pageEC.jumpToPage(page));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reaction((_) => pageStore.page, (page) => pageEC.jumpToPage(page));
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
                  AninciosPage(),
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
      return Observer(
        builder: (_) {
          return Text('Anúncios');
        },
      );
    case 1:
      return Observer(
        builder: (_) {
          return Text('Criar Anúncios');
        },
      );
    case 2:
      return Observer(
        builder: (_) {
          return Text('Chat');
        },
      );
    case 3:
      return Observer(
        builder: (_) {
          return Text('Favorito');
        },
      );

    default:
      return Observer(
        builder: (_) {
          return Text('Minha Conta');
        },
      );
  }
}

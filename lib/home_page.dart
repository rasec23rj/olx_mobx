import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: PageView(
          controller: pageEC,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(color: Colors.red),
            Container(color: Colors.green),
            Container(color: Colors.brown),
            Container(color: Colors.grey),
            Container(color: Colors.yellow),
          ],
        ),
        drawer: customDrawer(context),
      ),
    );
  }
}

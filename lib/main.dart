import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/core/database/database.dart';
import 'package:olx_mobx/core/session/session_store_user.dart';
import 'package:olx_mobx/core/utils/my_custom_scroll_behavior.dart';
import 'package:olx_mobx/home_page.dart';
import 'package:olx_mobx/pages/anuncios/stores/anuncio_store.dart';
import 'package:olx_mobx/pages/anuncios/stores/category_store.dart';
import 'package:olx_mobx/pages/anuncios/stores/cep_store.dart';
import 'package:olx_mobx/widgets/store/page_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database().initializeParse();
  setupLocators();

  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(SessionStoreUser());
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(AnuncioStore());
  GetIt.I.registerSingleton(CategoryStore());
  GetIt.I.registerSingleton(CepStore());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,

          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ButtonStyle(
        //     backgroundColor: WidgetStateProperty.all(
        //       const Color.fromARGB(255, 90, 1, 253),
        //     ),
        //     foregroundColor: WidgetStateProperty.all(Colors.white),
        //   ),
        // ),
      ),

      home: const HomePage(),
    );
  }
}

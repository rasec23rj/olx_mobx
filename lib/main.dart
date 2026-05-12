import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/core/database/database.dart';
import 'package:olx_mobx/core/session/session_store_user.dart';
import 'package:olx_mobx/home_page.dart';
import 'package:olx_mobx/widgets/store/page_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database().initializeParse();
  setupLocators();
  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(SessionStoreUser());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
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
      ),

      home: const HomePage(),
    );
  }
}

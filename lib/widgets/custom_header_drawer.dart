import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/core/session/session_store_user.dart';
import 'package:olx_mobx/pages/sign_in/sign_in.dart';
import 'package:olx_mobx/widgets/store/page_store.dart';

class CustomHeaderDrawer extends StatelessWidget {
  CustomHeaderDrawer({super.key});

  final SessionStoreUser sessionStoreUser = GetIt.I<SessionStoreUser>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        sessionStoreUser.isLoggedIn
            ? GetIt.I<PageStore>().setPage(4)
            : Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => SignIn()));
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        height: MediaQuery.of(context).size.height * 0.22,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, color: Colors.white, size: 100),
            Expanded(
              child: Column(
                children: [
                  Text(
                    sessionStoreUser.isLoggedIn
                        ? sessionStoreUser.user.name!.toUpperCase()
                        : 'Acesse sua conta agora!',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    sessionStoreUser.isLoggedIn
                        ? sessionStoreUser.user.email!
                        : 'Clique aqui!',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

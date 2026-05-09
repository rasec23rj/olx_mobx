import 'package:flutter/material.dart';
import 'package:olx_mobx/pages/sign_in/sign_in.dart';

class CustomHeaderDrawer extends StatelessWidget {
  const CustomHeaderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignIn()));
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
                    'Acesse sua conta agora!',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text('Clique aqui!', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

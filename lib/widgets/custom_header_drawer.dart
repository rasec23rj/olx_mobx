import 'package:flutter/material.dart';

class CustomHeaderDrawer extends StatelessWidget {
  const CustomHeaderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

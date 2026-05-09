import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/widgets/store/page_store.dart';

class PageSection extends StatelessWidget {
  PageSection({super.key});
  PageStore pageStore = GetIt.I<PageStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            pageTitle(
              label: 'Anúncios',
              icon: Icons.list,
              onTap: () {
                pageStore.setPage(0);
              },
              hightlighted: pageStore.page == 0,
            ),

            pageTitle(
              label: 'Inserir Anúncios',
              icon: Icons.edit,
              onTap: () {
                pageStore.setPage(1);
              },
              hightlighted: pageStore.page == 1,
            ),

            pageTitle(
              label: 'Chat',
              icon: Icons.chat,
              onTap: () {
                pageStore.setPage(2);
              },
              hightlighted: pageStore.page == 2,
            ),

            pageTitle(
              label: 'Favorito',
              icon: Icons.favorite,
              onTap: () {
                pageStore.setPage(3);
              },
              hightlighted: pageStore.page == 3,
            ),

            pageTitle(
              label: 'Minha conta',
              icon: Icons.person,
              onTap: () {
                pageStore.setPage(4);
              },
              hightlighted: pageStore.page == 4,
            ),
            Divider(),
          ],
        );
      },
    );
  }
}

Widget pageTitle({
  required String label,
  required IconData icon,
  required void Function()? onTap,
  required bool hightlighted,
}) {
  return ListTile(
    title: Text(
      label,
      style: TextStyle(
        color: hightlighted ? Colors.purple : Colors.black,
        fontWeight: hightlighted ? FontWeight.bold : FontWeight.normal,
      ),
    ),
    leading: Icon(icon, color: hightlighted ? Colors.purple : Colors.black),
    onTap: onTap,
  );
}

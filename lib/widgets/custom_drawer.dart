import 'package:flutter/material.dart';
import 'package:olx_mobx/widgets/custom_header_drawer.dart';
import 'package:olx_mobx/widgets/page_section.dart';

Widget customDrawer(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.6,
    child: Drawer(
      child: ListView(children: [CustomHeaderDrawer(), PageSection()]),
    ),
  );
}

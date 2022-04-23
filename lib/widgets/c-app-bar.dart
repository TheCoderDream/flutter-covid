import 'package:covid/config/palette.dart';
import 'package:flutter/material.dart';

class CAppBar extends StatelessWidget with PreferredSizeWidget {
  const CAppBar({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        iconSize: 28.0,
        onPressed: () {},
      ),
      actions: <Widget> [
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
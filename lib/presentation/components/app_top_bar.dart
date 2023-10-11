import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    this.title = ''
  });

  final String title;

  double get _toolbarHeight => 86;

  @override
  Size get preferredSize => Size.fromHeight(_toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        maxLines: 2,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarHeight: _toolbarHeight
    );
  }

}
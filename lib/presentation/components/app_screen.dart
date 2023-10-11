import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    required this.child,
    super.key,
    this.backgroundColor,
    this.appBar,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.bottomNavigationBar
  });

  final Widget child;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar,
      body: SafeArea(
        top: safeAreaTop,
        bottom: safeAreaBottom,
        child: child,
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar
    );
  }

}

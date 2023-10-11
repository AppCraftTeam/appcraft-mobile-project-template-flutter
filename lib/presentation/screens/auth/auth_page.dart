import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../widgets/primary_app_bar.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(label: 'Auth'),
      body: const Center(
        child: Text('AUTH'),
      ),
    );
  }
}

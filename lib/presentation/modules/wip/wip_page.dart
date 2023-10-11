import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'bloc/wip_bloc.dart';
import 'wip_screen.dart';

@RoutePage(name: 'WipRoute')
class WipPage extends StatelessWidget {
  const WipPage({ super.key });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => WipBloc(),
    child: const WipScreen()
  );
}

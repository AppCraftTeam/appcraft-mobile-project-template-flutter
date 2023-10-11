import 'package:flutter/material.dart';

import '../../../app/theme/app_theme.dart';
import '../../../resources/localization/app_localization.dart';
import '../../components/app_screen.dart';
import '../../components/app_top_bar.dart';
import 'bloc/wip_bloc.dart';

typedef _Bloc = WipBloc;
typedef _State = WipState;
typedef _BlocBuilder = BlocBuilder<_Bloc, _State>;

class WipScreen extends StatefulWidget {
  const WipScreen({ super.key });

  @override
  State<WipScreen> createState() => _WipScreenState();
}

class _WipScreenState extends State<WipScreen> {

  _Bloc get _bloc => context.read();

  @override
  void initState() {
    _bloc.add(const WipEventInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography=  context.typography;

    return AppScreen(
      appBar: AppTopBar(title: context.localization.wipTitle),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localization.wipInfoTitle,
              style: typography.wipTitle?.copyWith(color: colors.wipTitle)
            ),
            const SizedBox(height: 4),
            _BlocBuilder(builder: (context, state) {
              return Text(
                _bloc.state.version,
                style: typography.wipInfoTitle?.copyWith(color: colors.wipTitle)
              );
            },)
          ],
        ),
      )
    );
  }
}
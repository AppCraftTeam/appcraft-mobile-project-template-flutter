import 'package:flutter/material.dart';
import './bloc/{{snakeCase}}_bloc.dart';

typedef _Bloc = {{pascalCase}}Bloc;
typedef _State = {{pascalCase}}State;
typedef _BlocBuilder = BlocBuilder<_Bloc, _State>;

class {{pascalCase}}Screen extends StatefulWidget {
  const {{pascalCase}}Screen({ super.key });

  @override
  State<{{pascalCase}}Screen> createState() => _{{pascalCase}}ScreenState();
}

class _{{pascalCase}}ScreenState extends State<{{pascalCase}}Screen> {

  _Bloc get _bloc => context.read();

  @override
  Widget build(BuildContext context) {
    return _BlocBuilder(
      builder: (context, state) {
        return const SizedBox();
      },
    );
  }

}
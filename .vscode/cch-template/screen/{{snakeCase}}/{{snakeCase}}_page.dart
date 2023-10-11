import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import './bloc/{{snakeCase}}_bloc.dart';
import './{{snakeCase}}_screen.dart';

@RoutePage(name: '{{pascalCase}}Route')
class {{pascalCase}}Page extends StatelessWidget {
  const {{pascalCase}}Page({ super.key });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => {{pascalCase}}Bloc(),
    child: const {{pascalCase}}Screen()
  );
}
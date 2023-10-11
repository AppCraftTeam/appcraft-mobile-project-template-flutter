import 'package:flutter_bloc/flutter_bloc.dart';
import './{{snakeCase}}_event.dart';
import './{{snakeCase}}_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export '{{snakeCase}}_event.dart';
export '{{snakeCase}}_state.dart';

class {{pascalCase}}Bloc extends Bloc<{{pascalCase}}Event, {{pascalCase}}State> {
  {{pascalCase}}Bloc() : super(const {{pascalCase}}State());
}
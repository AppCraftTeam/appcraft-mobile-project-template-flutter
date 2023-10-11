import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../app/app_configuration.dart';
import '../../../../app/injection/injection.dart';
import 'wip_event.dart';
import 'wip_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'wip_event.dart';
export 'wip_state.dart';

class WipBloc extends Bloc<WipEvent, WipState> {

  WipBloc() : super(const WipState()) {
    on<WipEventInitial>(_onInitial);
  }

  Future<void> _onInitial(WipEventInitial event, Emitter<WipState> emit) async {
    final info = await PackageInfo.fromPlatform();
    var version = '${info.version}.${info.buildNumber}';

    final appVersionTag = getIt<AppConfiguration>().appVersionTag;
    if (appVersionTag.isNotEmpty) version += '.$appVersionTag';

    emit(
      state.copyWith(version: version)
    );
  }

}

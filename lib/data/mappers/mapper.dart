import 'package:injectable/injectable.dart';

import 'response_mappers/auth.dart';
import 'response_mappers/common.dart';

@lazySingleton
class EntityMapper {
  EntityMapper._();

  @factoryMethod
  factory EntityMapper.create() {
    final base = EntityMapper._();
    registerAuthResponseMappers(base);
    registerCommonResponseMappers(base);
    return base;
  }

  // ignore: strict_raw_type
  final _mappers = <Type, Map<Type, _Mapper>>{};

  Dst? call<Src, Dst>(Src? entity) {
    final mapper = _mappers[Src]?[Dst];
    assert(mapper != null, 'Missing $Src => $Dst type mapper');

    return mapper!(entity, this);
  }

  List<Dst> mapList<Src, Dst>(List<Src>? entities) {
    final mapper = _mappers[Src]?[Dst];
    assert(mapper != null, 'Missing $Src => $Dst type mapper');

    return entities?.map((e) => mapper!(e, this)).whereType<Dst>().toList() ??
        <Dst>[];
  }

  void register<Src, Dst>(_Mapper<Src?, Dst?> mapper) {
    final srcMappers = _mappers.putIfAbsent(Src, () => {});
    assert(srcMappers.containsKey(Dst) == false,
        'Mapper $Src => $Dst have been registered already');

    srcMappers[Dst] = (e, m) => mapper(e, m);
  }
}

typedef _Mapper<Src, Dst> = Dst Function(Src entity, EntityMapper mapper);

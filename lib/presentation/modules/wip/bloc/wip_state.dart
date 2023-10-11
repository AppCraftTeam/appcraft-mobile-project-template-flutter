import 'package:equatable/equatable.dart';

final class WipState extends Equatable {
  const WipState({
    this.version = ''
  });

  final String version;

  WipState copyWith({
    String? version
  }) {
    return WipState(
      version: version ?? this.version
    );
  }

  @override
  List<Object?> get props => [version];
}
import 'package:equatable/equatable.dart';

abstract class WipEvent extends Equatable {
  const WipEvent();

  @override
  List<Object?> get props => [];
}

final class WipEventInitial extends WipEvent {
  const WipEventInitial();
}
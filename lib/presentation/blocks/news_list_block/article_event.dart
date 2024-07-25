import 'package:equatable/equatable.dart';

abstract class ArticalEvent extends Equatable {
  const ArticalEvent();

  @override
  List<Object> get props => [];
}

class FetchArticalEvent extends ArticalEvent {}

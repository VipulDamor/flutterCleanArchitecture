import 'package:equatable/equatable.dart';

import '../../../data/models/news_list/news_list.dart';

abstract class ArticalStates extends Equatable {
  const ArticalStates();

  @override
  List<Object> get props => [];
}

class Loading extends ArticalStates {}

class Success extends ArticalStates {
  final News news;

  const Success({required this.news});

  @override
  List<Object> get props => [news];
}

class Error extends ArticalStates {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}

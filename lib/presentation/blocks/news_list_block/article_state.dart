import 'package:equatable/equatable.dart';

import '../../../data/models/news_list/news_list.dart';

abstract class ArticalStates extends Equatable {}

class Loading extends ArticalStates {
  @override
  List<Object?> get props => [];
}

class Success extends ArticalStates {
  News news;
  Success({required this.news});

  @override
  List<Object?> get props => [news];
}

class Error extends ArticalStates {
  String message;
  Error({required this.message});

  @override
  List<Object?> get props => [message];
}

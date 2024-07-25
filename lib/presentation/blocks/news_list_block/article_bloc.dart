import 'package:bloc/bloc.dart';

import '../../../data/repository/news_repository.dart';
import 'article_event.dart';
import 'article_state.dart';

class ArticalBloc extends Bloc<ArticalEvent, ArticalStates> {
  NewsRepository newsRepository;

  ArticalBloc(super.initialState, {required this.newsRepository}) {
    on<FetchArticalEvent>(_onFetchArticalEvent);
  }

  ArticalStates get states => Loading();

  void _onFetchArticalEvent(
      FetchArticalEvent event, Emitter<ArticalStates> emit) async {
    emit(Loading());
    try {
      final news = await newsRepository.getNewsList();
      emit(Success(news: news));
    } catch (error) {
      emit(Error(message: error.toString()));
    }
  }
}

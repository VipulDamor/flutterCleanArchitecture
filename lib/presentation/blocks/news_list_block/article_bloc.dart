import 'package:bloc/bloc.dart';
import 'package:testflutterclean/presentation/blocks/news_list_block/article_event.dart';
import 'package:testflutterclean/presentation/blocks/news_list_block/article_state.dart';

import '../../../data/models/news_list/news_list.dart';
import '../../../data/repository/news_repository.dart';

class ArticalBlock extends Bloc<ArticalEvents, ArticalStates> {
  NewsRepository newsRepository;
  ArticalBlock(super.initialState, {required this.newsRepository});

  ArticalStates get states => Loading();

  @override
  Stream<ArticalStates> mapEventToState(ArticalStates event) async* {
    if (event is Success) {
      yield Loading();
      try {
        News articles = await newsRepository.getNewsList();
        yield Success(news: articles);
      } catch (e) {
        yield Error(message: e.toString());
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testflutterclean/presentation/screens/news_detail/news_details.dart';
import 'package:testflutterclean/presentation/screens/registration/register_form.dart';

import '../../../data/models/news_list/news_list.dart';
import '../../blocks/news_list_block/article_bloc.dart';
import '../../blocks/news_list_block/article_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticalBloc, ArticalStates>(
        builder: (context, state) {
          if (state is Loading) {
            return buildLoading();
          } else if (state is Success) {
            return buildArticleList(state.news.articles!.toList());
          } else if (state is Error) {
            return buildErrorUi(state.message);
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Registration()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget buildLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildErrorUi(String message) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: const TextStyle(color: Colors.red),
      ),
    ),
  );
}

Widget buildArticleList(List<Articles> articles) {
  return ListView.builder(
    itemCount: articles.length,
    itemBuilder: (ctx, pos) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: ListTile(
            leading: ClipRect(
              child: Hero(
                tag: articles[pos].urlToImage.toString(),
                child: Image.network(
                  articles[pos].urlToImage.toString(),
                  fit: BoxFit.cover,
                  height: 70.0,
                  width: 70.0,
                ),
              ),
            ),
            title: Text(articles[pos].title.toString()),
            subtitle: Text(articles[pos].publishedAt.toString()),
          ),
          onTap: () {
            navigateToArticleDetailPage(ctx, articles[pos]);
          },
        ),
      );
    },
  );
}

void navigateToArticleDetailPage(context, Articles articl) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => NewsDetails(artical: articl)),
  );
}

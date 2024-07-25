import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/themes/app_theme.dart';
import 'data/repository/news_repository.dart';
import 'presentation/blocks/news_list_block/article_bloc.dart';
import 'presentation/blocks/news_list_block/article_event.dart';
import 'presentation/blocks/news_list_block/article_state.dart';
import 'presentation/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return BlocProvider<ArticalBloc>(
            create: (context) => ArticalBloc(
              Loading(),
              newsRepository: NewsRepositoryImpl(),
            )..add(FetchArticalEvent()),
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              home: const SplashScreen(),
            ),
          );
        },
      );
}

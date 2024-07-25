import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:testflutterclean/core/themes/app_theme.dart';
import 'package:testflutterclean/data/repository/news_repository.dart';
import 'package:testflutterclean/presentation/blocks/news_list_block/article_bloc.dart';
import 'package:testflutterclean/presentation/blocks/news_list_block/article_state.dart';

import 'presentation/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

//api key = 4b16966571914b8ba8fe93ee149891b3
class MyApp extends StatelessWidget {
  //final _appRouter = Approute();

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            home: MultiBlocProvider(
              providers: [
                BlocProvider<ArticalBlock>(
                  create: (context) => ArticalBlock(Loading(),
                      newsRepository: NewsRepositoryImpl()),
                )
              ],
              child: const SplashScreen(),
            ),
          );
        },
      );
}

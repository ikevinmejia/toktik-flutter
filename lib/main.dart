import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrasctructure/datasources/local_video__datasource_impl.dart';
import 'package:toktik/infrasctructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostReposity = VideoPostsRepositoryImpl(
      videosDatasource: LocalVideoDatasource()
    );



    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverProvider(videosRepository: videoPostReposity)..loadNextPage())
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen()
      ),
    );
  }
}
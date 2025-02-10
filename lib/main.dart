import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_new/cubit/trending_wallpaper_cubit/home_cubit.dart';
import 'package:wallpaper_app_new/data/remote/api_helper.dart';
import 'package:wallpaper_app_new/data/repository/wallpaper_repository.dart';
import 'package:wallpaper_app_new/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(create: (context){
    return HomeCubit(wallPaperRepository: WallPaperRepository(apiHelper: ApiHelper())
    );
    },child: HomePage()));
  }
}


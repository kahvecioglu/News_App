import 'package:flutter/material.dart';
import 'package:samer/blocs/news_bloc.dart';
import 'package:samer/pages/home_page.dart';

void main() async {
  NewsBloc newsBloc = NewsBloc();
  newsBloc.NewsData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

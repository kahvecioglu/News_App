import 'package:flutter/material.dart';
import 'package:samer/blocs/news_bloc.dart';
import 'package:samer/cards/news_card.dart';
import 'package:samer/models/news_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsBloc newsBloc = NewsBloc();

  void initState() {
    super.initState();

    newsBloc.NewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Text(
            "Haberler",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.green[400],
        body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: newsBloc.newscontroller,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final news = snapshot.data!;

              return ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  final _new = news[index];
                  final tittle = _new['title'] ?? 'Bilgi Yok';
                  final image = _new['imageUrl'] ?? 'Bilgi Yok';
                  final decsription = _new['snippet'] ?? 'Bilgi Yok';
                  final date = _new['date'] ?? 'Bilgi Yok';
                  final link = _new['link'] ?? 'Bilgi Yok';

                  return NewsCard(
                    title: tittle,
                    description: decsription,
                    imageUrl: image,
                    date: date,
                  );
                },
              );
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ));
  }
}

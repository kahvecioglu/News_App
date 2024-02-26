import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final String? tittle;
  final String? imageUrl;
  final String? description;
  const NewsDetails({super.key, this.description, this.imageUrl, this.tittle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Color.fromARGB(255, 169, 252, 172),
          child: Column(
            children: [
              Image.network(
                imageUrl ??
                    "https://cdn.pixabay.com/photo/2017/09/16/19/21/salad-2756467_1280.jpg",
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  tittle ?? " Bilgi Yok",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(description ?? "Bilgi Yok",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:samer/pages/news_details.dart';

class NewsCard extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final String? description;
  final String? date;

  NewsCard({Key? key, this.title, this.imageUrl, this.description, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 7, 30, 7),
      child: OpenContainer(
        closedColor: Color.fromARGB(255, 43, 99, 45),
        closedBuilder: (context, action) {
          return Card(
            color: Color.fromARGB(255, 169, 252, 172),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 140,
                  child: Image.network(
                    fit: BoxFit.cover,
                    imageUrl ??
                        "https://cdn.pixabay.com/photo/2017/09/16/19/21/salad-2756467_1280.jpg",
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title ?? "Bilgi Yok",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        description ?? "Bilgi Yok",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          date ?? "Bilgi Yok",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        openBuilder: (context, action) => NewsDetails(
          description: description,
          imageUrl: imageUrl,
          tittle: title,
        ),
      ),
    );
  }
}

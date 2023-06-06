import 'package:flutter/material.dart';

import '../models/news_response.dart';

class ArticalItem extends StatelessWidget {
  const ArticalItem({Key? key, required this.articles}) : super(key: key);

  final Articles articles;
  final double articalRadius = 15;
  final String playerPath =
      "https://mediaaws.almasryalyoum.com/news/large/2020/02/29/1032245_0.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(articalRadius),
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(articalRadius),
              topRight: Radius.circular(articalRadius),
            ),
            child: Image.network(
              articles.urlToImage,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.network(playerPath);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Title : ${articles.title}"),
          ),
        ],
      ),
    );
  }
}

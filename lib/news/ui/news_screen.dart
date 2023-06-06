import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti/news/cubits/news_cubit.dart';
import 'package:hti/news/models/news_response.dart';
import 'package:hti/news/ui/artical_item.dart';
import 'package:hti/news/ui/search_news_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late NewsCubit newsCubit;

  @override
  void initState() {
    super.initState();
    newsCubit = context.read<NewsCubit>();
    newsCubit.getNews(category: "sports");
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        if (state is GetNewsFailureState) {
          print('News Error=>${state.errorMessage}');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("News"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: newsCubit,
                            child: const SearchNewsScreen(),
                          ),
                        ));
                  },
                  icon: const Icon(Icons.search)),
            ],
          ),
          body: newsCubit.articles.isEmpty
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: newsCubit.articles.length,
                    itemBuilder: (context, index) {
                      Articles articles = newsCubit.articles[index];
                      return ArticalItem(articles: articles,);
                    },
                  ),
                ),
        );
      },
    );
  }


}

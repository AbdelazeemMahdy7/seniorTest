import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti/news/cubits/news_cubit.dart';

import '../models/news_response.dart';
import 'artical_item.dart';

class SearchNewsScreen extends StatefulWidget {
  const SearchNewsScreen({Key? key}) : super(key: key);

  @override
  State<SearchNewsScreen> createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {
  late NewsCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = context.read<NewsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {
                    cubit.searchNews(searhKey: value);
                  },
                  decoration: const InputDecoration(
                    labelText: "Search",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<NewsCubit, NewsStates>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: cubit.searchArticles.length,
                        itemBuilder: (context, index) {
                          Articles articles = cubit.searchArticles[index];
                          return ArticalItem(articles: articles,);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

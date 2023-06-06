import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti/news/models/news_response.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  List<Articles> articles =[];
  List<Articles> searchArticles =[];

  NewsCubit() : super(NewsInitialState());

  void getNews(
      {
        required String category,
      }) async {
    try {
      var response = await Dio()
          .get('https://newsapi.org/v2/top-headlines',
          queryParameters: {
            "country": "eg",
            "category": category,
            "apiKey": "56f57b7cf63c48a3a8df7891bf64c4bd",
          });
      NewsResponse newsResponse=NewsResponse.fromJson(response.data);
      articles = newsResponse.articles;
      emit(GetNewsSuccessState());
    } catch (e) {
      emit(GetNewsFailureState(e.toString()));
    }
  }
  void searchNews(
      {
        required String searhKey,
      }) async {
    try {
      var response = await Dio()
          .get('https://newsapi.org/v2/everything?q=$searhKey&from=2022-12-05&sortBy'
          '=publishedAt&apiKey=56f57b7cf63c48a3a8df7891bf64c4bd',);

      NewsResponse newsResponse=NewsResponse.fromJson(response.data);
      searchArticles = newsResponse.articles;
      emit(GetNewsSuccessState());
    } catch (e) {
      emit(GetNewsFailureState(e.toString()));
    }
  }

}

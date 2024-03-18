import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/database/shared_preferences.dart';
import 'package:news_buzz/models/news_response.dart';
import 'package:news_buzz/ui/home_screen/manager/home_screen_state.dart';
import 'package:news_buzz/utils/app_dio.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());
  int currentIndex = 0;
  List<Articles> articles = [];
  List<String> titles = [
    'Business',
    'Sport',
    'Health',
    'Science',
    'Technology',
  ];
  List<String> categories = [
    'business',
    'sports',
    'health',
    'science',
    'technology',
  ];

  void getNews(String category) async {
    final response = await AppDio.get(
      endPoint: "",
      queryParameters: {
        'country':PreferenceUtils.getString(PrefKeys.country),
        'category':category,
        'apiKey':'9857b03f7d124be7ab2b1412eddf1920',
      },
    );
    final news = NewsResponse.fromJson(response.data);
    articles = news.articles;
    emit(GetNews());
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/ui/news_details/manager/news_details_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsCubit extends Cubit<NewsDetailsState> {
  NewsDetailsCubit() : super(NewsDetailsInitial());
  final webController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);
}

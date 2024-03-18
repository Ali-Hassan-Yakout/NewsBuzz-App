import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/ui/select_language_screen/manager/select_language_screen_state.dart';

class SelectLanguageScreenCubit extends Cubit<SelectLanguageScreenState> {
  SelectLanguageScreenCubit() : super(SelectLanguageScreenInitial());
  List<String> languageCode = [
    'en',
    'ar',
  ];
  List<String> languageName = [
    'English',
    'Arabic',
  ];
}

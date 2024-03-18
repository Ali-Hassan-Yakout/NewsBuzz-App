import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/ui/select_theme_screen/manager/select_theme_screen_state.dart';

class SelectThemeScreenCubit extends Cubit<SelectThemeScreenState> {
  SelectThemeScreenCubit() : super(SelectThemeScreenInitial());
  List<String> themeName = [
    'Light',
    'Dark',
  ];
}

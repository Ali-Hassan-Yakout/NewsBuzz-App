import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/ui/settings_screen/manager/settings_screen_state.dart';

class SettingsScreenCubit extends Cubit<SettingsScreenState> {
  SettingsScreenCubit() : super(SettingsScreenInitial());

  onSettingsChanged(){
    emit(SettingsChanged());
  }
}

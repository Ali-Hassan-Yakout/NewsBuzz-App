import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/ui/select_country_screen/manager/select_country_screen_state.dart';

class SelectCountryScreenCubit extends Cubit<SelectCountryScreenState> {
  SelectCountryScreenCubit() : super(SelectCountryScreenInitial());
  List<String> countriesCode = [
    'ae',
    'sa',
    'us',
    'ch',
    'ar',
  ];
  List<String> countriesName = [
    'United Arab Emirates',
    'Saudi Arabia',
    'United States',
    'Switzerland',
    'Argentina',
  ];
}

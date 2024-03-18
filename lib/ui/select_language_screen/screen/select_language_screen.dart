import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/database/shared_preferences.dart';
import 'package:news_buzz/ui/select_language_screen/manager/select_language_screen_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  final cubit = SelectLanguageScreenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            tr('Select Language'),
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: cubit.languageCode.length,
          itemBuilder: (context, index) {
            return languageItem(index);
          },
        ),
      ),
    );
  }

  Widget languageItem(int index) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () async {
          await context.setLocale(Locale(cubit.languageCode[index]));
          await PreferenceUtils.setString(
            PrefKeys.language,
            cubit.languageCode[index],
          );
          navToSetting();
        },
        child: Row(
          children: [
            Text(
              tr(cubit.languageName[index]),
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Text(
              cubit.languageCode[index],
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void navToSetting(){
    Navigator.pop(context);
  }
}

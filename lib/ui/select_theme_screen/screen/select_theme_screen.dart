import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/database/shared_preferences.dart';
import 'package:news_buzz/ui/select_theme_screen/manager/select_theme_screen_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectTheme extends StatefulWidget {
  const SelectTheme({super.key});

  @override
  State<SelectTheme> createState() => _SelectThemeState();
}

class _SelectThemeState extends State<SelectTheme> {
  final cubit = SelectThemeScreenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            tr('Select Theme'),
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: cubit.themeName.length,
          itemBuilder: (context, index) {
            return themeItem(index);
          },
        ),
      ),
    );
  }

  Widget themeItem(int index) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          PreferenceUtils.setString(PrefKeys.theme, cubit.themeName[index]);
          cubit.themeName[index] == "Light"
              ? AdaptiveTheme.of(context).setLight()
              : AdaptiveTheme.of(context).setDark();
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Text(
              tr(cubit.themeName[index]),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

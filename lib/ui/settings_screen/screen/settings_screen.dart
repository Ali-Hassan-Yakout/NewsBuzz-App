import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/database/shared_preferences.dart';
import 'package:news_buzz/ui/select_country_screen/screen/select_country_screen.dart';
import 'package:news_buzz/ui/select_language_screen/screen/select_language_screen.dart';
import 'package:news_buzz/ui/select_theme_screen/screen/select_theme_screen.dart';
import 'package:news_buzz/ui/settings_screen/manager/settings_screen_cubit.dart';
import 'package:news_buzz/ui/settings_screen/manager/settings_screen_state.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final cubit = SettingsScreenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<SettingsScreenCubit, SettingsScreenState>(
        buildWhen: (previous, current) => current is SettingsChanged,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Text(
                tr('Settings'),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                settingItem(
                  icon: Icons.place,
                  settingName: tr('Country'),
                  value: PreferenceUtils.getString(PrefKeys.country),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectCountry(),
                      ),
                    ).then((value) => cubit.onSettingsChanged());
                  },
                ),
                settingItem(
                  icon: Icons.color_lens,
                  settingName: tr('Theme'),
                  value: tr(PreferenceUtils.getString(PrefKeys.theme)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectTheme(),
                      ),
                    ).then((value) => cubit.onSettingsChanged());
                  },
                ),
                settingItem(
                  icon: Icons.language,
                  settingName: tr('Language'),
                  value: PreferenceUtils.getString(PrefKeys.language),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectLanguage(),
                      ),
                    ).then((value) => cubit.onSettingsChanged());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget settingItem({
    required IconData icon,
    required String settingName,
    required String value,
    required final VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          Text(
            settingName,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}

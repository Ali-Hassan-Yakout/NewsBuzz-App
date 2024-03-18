import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/database/shared_preferences.dart';
import 'package:news_buzz/ui/select_country_screen/manager/select_country_screen_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  final cubit = SelectCountryScreenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            tr('Select Country'),
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: cubit.countriesCode.length,
          itemBuilder: (context, index) {
            return countryItem(index);
          },
        ),
      ),
    );
  }

  Widget countryItem(int index) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          PreferenceUtils.setString(
              PrefKeys.country, cubit.countriesCode[index]);
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Text(
              tr(cubit.countriesName[index]),
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Text(
              cubit.countriesCode[index],
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
}

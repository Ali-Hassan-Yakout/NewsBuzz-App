import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/ui/home_screen/manager/home_screen_cubit.dart';
import 'package:news_buzz/ui/home_screen/manager/home_screen_state.dart';
import 'package:news_buzz/ui/news_details/screen/news_details.dart';
import 'package:news_buzz/ui/settings_screen/screen/settings_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = HomeScreenCubit();

  @override
  void initState() {
    super.initState();
    cubit.getNews(cubit.categories[cubit.currentIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        buildWhen: (previous, current) => current is GetNews,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                tr(cubit.titles[cubit.currentIndex]),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    ).then((value) =>
                        cubit.getNews(cubit.categories[cubit.currentIndex]));
                  },
                  icon: const Icon(
                    Icons.settings,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                cubit.currentIndex = value;
                cubit.getNews(cubit.categories[cubit.currentIndex]);
              },
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.business),
                  label: tr('Business'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.sports),
                  label: tr('Sport'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.health_and_safety),
                  label: tr('Health'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.science),
                  label: tr('Science'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.biotech),
                  label: tr('Technology'),
                ),
              ],
            ),
            body: newsItemBuilder(),
          );
        },
      ),
    );
  }

  Widget newsItemBuilder() {
    return ListView.builder(
      itemCount: cubit.articles.length,
      itemBuilder: (context, index) {
        return cubit.articles[index].title == '[Removed]'
            ? const SizedBox()
            : Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: cubit.articles[index].urlToImage == ''
                          ? const SizedBox()
                          : Image.network(
                              cubit.articles[index].urlToImage,
                              fit: BoxFit.contain,
                            ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      cubit.articles[index].author,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      cubit.articles[index].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NewsDetails(url: cubit.articles[index].url),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Text(
                          tr("News Details"),
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}

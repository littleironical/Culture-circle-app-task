import 'package:culture_circle_app_task/presentation/main/auth_view/auth_view.dart';
import 'package:culture_circle_app_task/presentation/main/home_view/home_view.dart';
import 'package:culture_circle_app_task/presentation/main/other_views/notifications_view.dart';
import 'package:culture_circle_app_task/presentation/main/other_views/search_view.dart';
import 'package:culture_circle_app_task/presentation/resources/colors_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/icons_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = const [
    HomePage(),
    SearchView(),
    NotificationsView(),
    // ProfileView(), // TODO UNCOMMENT THIS
    AuthView(), // TODO COMMENT THIS
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: pages[_currentIndex],
      // body: const Placeholder(),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  _getBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: StringManager.home,
          icon: Icon(IconManager.home),
        ),
        BottomNavigationBarItem(
          label: StringManager.search,
          icon: Icon(IconManager.search),
        ),
        BottomNavigationBarItem(
          label: StringManager.notification,
          icon: Icon(IconManager.notification),
        ),
        BottomNavigationBarItem(
          label: StringManager.profile,
          icon: Icon(IconManager.profile),
        ),
      ],
    );
  }
}

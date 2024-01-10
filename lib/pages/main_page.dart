import 'package:dio_flutter_navigation_app/pages/card_page.dart';
import 'package:dio_flutter_navigation_app/pages/list_view_h_page.dart';
import 'package:dio_flutter_navigation_app/pages/list_view_page.dart';
import 'package:dio_flutter_navigation_app/pages/wallpapers_page.dart';
import 'package:dio_flutter_navigation_app/shared/widgets/custom_drawer_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _pagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('VASP Virtual - CEOP')),
      drawer: const CustomDrawerWidget(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _pagePosition = value;
                });
              },
              scrollDirection: Axis.horizontal,
              children: const [
                CardPage(),
                WallpapersPage(),
                ListViewPage(),
                ListViewHPage(),
              ],
            ),
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
              onTap: (value) {
                _pageController.jumpToPage(value);
              },
              currentIndex: _pagePosition,
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: 'Wall',
                  icon: Icon(Icons.photo),
                ),
                BottomNavigationBarItem(
                  label: 'Users',
                  icon: Icon(Icons.person),
                ),
                BottomNavigationBarItem(
                  label: 'ListH',
                  icon: Icon(Icons.list),
                ),
              ])
        ],
      ),
    );
  }
}

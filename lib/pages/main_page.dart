import 'package:dio_flutter_navigation_app/pages/page_one_page.dart';
import 'package:dio_flutter_navigation_app/pages/page_three_page.dart';
import 'package:dio_flutter_navigation_app/pages/page_two_page.dart';
import 'package:dio_flutter_navigation_app/pages/registration_data_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _pagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: const Text('Dados Cadastrais')),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationDataPage(
                                text: 'Meus Dados',
                                data: ['Nome', 'Endereço', 'Idade'],
                              )));
                },
              ),
              const Divider(),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: const Text('Termos de uso e privacidade')),
                onTap: () {},
              ),
              const Divider(),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: const Text('Configurações')),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
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
                PageOnePage(),
                PageTwoPage(),
                PageThreePage(),
              ],
            ),
          ),
          BottomNavigationBar(
              onTap: (value) {
                _pageController.jumpToPage(value);
              },
              currentIndex: _pagePosition,
              items: const [
                BottomNavigationBarItem(
                  label: 'Pag1',
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: 'Pag2',
                  icon: Icon(Icons.add),
                ),
                BottomNavigationBarItem(
                  label: 'Pag3',
                  icon: Icon(Icons.person),
                ),
              ])
        ],
      ),
    );
  }
}

import 'package:dio_flutter_navigation_app/pages/registration_data_page.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(255, 0, 162, 255),
                  Color.fromARGB(255, 3, 103, 161),
                ],
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://judenilson.com.br/img/avatar.jpg'),
              child: null,
            ),
            accountName: Text('Judenilson'),
            accountEmail: Text('email@email.com'),
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person),
                    Text('Dados Cadastrais'),
                  ],
                )),
            onTap: () {
              Navigator.pop(
                  context); // remove o menu lateral para não atrapalhar quando voltar p MainPage
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationDataPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.assignment),
                     Text('Termos de uso e privacidade'),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    Text('Configurações'),
                  ],
                )),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

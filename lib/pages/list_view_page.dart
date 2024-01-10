import 'package:dio_flutter_navigation_app/shared/images_path.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(
            ImagesPath.users[0],
          ),
          title: const Text('Usuário 1'),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Olá! Tudo bem?'),
              Text('08:30'),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              debugPrint(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(value: 'opcao1', child: Text('Opção 1')),
                const PopupMenuItem<String>(value: 'opcao2', child: Text('Opção 3')),
                const PopupMenuItem<String>(value: 'opcao2', child: Text('Opção 3')),
              ];
            },
          ),
        ),
        ListTile(
          leading: Image.asset(
            ImagesPath.users[1],
          ),
          title: const Text('Usuário 2'),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Olá! Tudo bem?'),
              Text('09:10'),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              debugPrint(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(value: 'opcao1', child: Text('Opção 1')),
                const PopupMenuItem<String>(value: 'opcao2', child: Text('Opção 3')),
                const PopupMenuItem<String>(value: 'opcao2', child: Text('Opção 3')),
              ];
            },
          ),
        ),         
      ],
    );
  }
}

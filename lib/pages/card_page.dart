import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: Card(
            elevation: 8,
            shadowColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://judenilson.com.br/img/avatar.jpg'),
                        child: null,
                      ),
                      Expanded(
                        child: Text(
                          'Judenilson',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,                            
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
                    's standard dummy text ever since the 1500s, when an unknown '
                    'printer took a galley of type and scrambled it to make a type specimen book. It has survived '
                    'not only five centuries, but also the leap into electronic typesetting, remaining essentially '
                    'unchanged. It was popularised in the 1960s with the release of Letraset sheets containing '
                    'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker '
                    'including versions of Lorem Ipsum.',
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Ler mais...',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

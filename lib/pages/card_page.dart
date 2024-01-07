import 'package:dio_flutter_navigation_app/model/card_detail_model.dart';
import 'package:dio_flutter_navigation_app/pages/card_detail_page.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  var cardDetailModel = CardDetailModel(
      1,
      'Judenilson',
      'https://judenilson.com.br/img/avatar.jpg',
      'Is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
          's standard dummy text ever since the 1500s, when an unknown '
          'printer took a galley of type and scrambled it to make a type specimen book. It has survived '
          'not only five centuries, but also the leap into electronic typesetting, remaining essentially '
          'unchanged. It was popularised in the 1960s with the release of Letraset sheets containing '
          'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker '
          'including versions of Lorem Ipsum.');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CardDetailPage(cardDetailModel: cardDetailModel)));
            },
            child: Card(
              elevation: 8,
              shadowColor: Colors.grey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Hero(
                            tag: cardDetailModel.id,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(cardDetailModel.url),
                              child: null,
                            )),
                        Expanded(
                          child: Text(
                            cardDetailModel.title,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${cardDetailModel.text.substring(0, (cardDetailModel.text.length > 150) ? 150 : cardDetailModel.text.length)}...',
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
        ),
      ],
    );
  }
}

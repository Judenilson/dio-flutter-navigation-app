import 'package:dio_flutter_navigation_app/model/card_detail_model.dart';
import 'package:dio_flutter_navigation_app/pages/card_detail_page.dart';
import 'package:dio_flutter_navigation_app/repositories/card_detail_repository.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetailModel? cardDetailModel;
  CardDetailRepository cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    loadData();
  }

// Criando um novo método, pois initState não aceita carregamento ASYNC
  void loadData() async {
    cardDetailModel = await cardDetailRepository.get();
    setState(() {}); // Não aceita ASYNC tb.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: cardDetailModel == null
              ? const LinearProgressIndicator()
              : InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardDetailPage(
                                cardDetailModel: cardDetailModel!)));
                  },
                  child: Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Hero(
                                  tag: cardDetailModel!.id,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(cardDetailModel!.url),
                                    child: null,
                                  )),
                              Expanded(
                                child: Text(
                                  cardDetailModel!.title,
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
                            '${cardDetailModel!.text.substring(0, (cardDetailModel!.text.length > 150) ? 150 : cardDetailModel!.text.length)}...',
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

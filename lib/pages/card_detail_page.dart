import 'package:dio_flutter_navigation_app/model/card_detail_model.dart';
import 'package:flutter/material.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetailModel cardDetailModel;
  const CardDetailPage({super.key, required this.cardDetailModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Hero(
              tag: cardDetailModel.id,
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(cardDetailModel.url),
                child: null,
              ),
            ),
            Center(
              child: Text(
                cardDetailModel.title,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Text(
                cardDetailModel.text,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

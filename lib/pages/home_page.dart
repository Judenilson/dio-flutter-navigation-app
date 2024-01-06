import 'package:dio_flutter_navigation_app/service/random_number_generate_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _randomNumber = 0;
  int _clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.deepPurple,
                child: const Text(
                  'Ações do Usuário',
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                width: double.infinity,
                color: Colors.grey[400],
                child: Text(
                  'O botão foi clicado $_clickCounter vezes.',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.grey,
              child: Expanded(
                child: Text(
                  'Número gerado foi: $_randomNumber',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _clickCounter++;
            _randomNumber =
                RandomNumberGenerateService.randomNumberGenerate(1000);
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:dio_flutter_navigation_app/repositories/airplane_repository.dart';
import 'package:dio_flutter_navigation_app/repositories/level_repository.dart';
import 'package:dio_flutter_navigation_app/shared/widgets/input_text_label_widget.dart';
import 'package:flutter/material.dart';

class RegistrationDataPage extends StatefulWidget {
  const RegistrationDataPage({super.key});

  @override
  State<RegistrationDataPage> createState() => _RegistrationDataPageState();
}

class _RegistrationDataPageState extends State<RegistrationDataPage> {
  final _nameController = TextEditingController(text: '');
  final _birthDateController = TextEditingController(text: '');
  DateTime? _birthDate;
  var levelRepository = LevelRepository();
  var airplaneRepository = AirplaneRepository();
  var airplanes = [];
  var levels = [];
  var levelSelected = '';
  var airplaneSelected = [];

  @override
  void initState() {
    levels = levelRepository.returnLevels();
    airplanes = airplaneRepository.returnAirplanes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text('Meus Dados'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ListView(
          // O ListView resolve o erro da tela com conteúdo extenso
          children: [
            const InputTextLabelWidget(text: 'Nome'),
            TextField(
              controller: _nameController,
            ),
            const InputTextLabelWidget(text: 'Data de Nascimento'),
            TextField(
              controller: _birthDateController,
              readOnly: true,
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2010, 1, 1),
                  firstDate: DateTime(1920, 1, 1),
                  lastDate: DateTime(2010, 12, 31),
                );
                if (date != null) {
                  _birthDateController.text = date.toString();
                  _birthDate = date;
                }
              },
            ),
            const InputTextLabelWidget(text: 'Nível de Experiência'),
            Column(
              children: levels
                  .map(
                    (level) => RadioListTile(
                      dense: true,
                      title: Text(level),
                      selected: levelSelected == level,
                      value: level,
                      groupValue: levelSelected,
                      onChanged: (value) {
                        debugPrint(value.toString());
                        setState(() {
                          levelSelected = value;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            const InputTextLabelWidget(text: 'Aeronaves Preferidas'),
            Column(
              children: airplanes
                  .map(
                    (airplane) => CheckboxListTile(
                      title: Text(airplane),
                      value: airplaneSelected.contains(airplane),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value!) {
                            airplaneSelected.add(airplane);
                          } else {
                            airplaneSelected.remove(airplane);
                          }
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            TextButton(
              onPressed: () {
                debugPrint(_nameController.text);
                debugPrint(_birthDate.toString());
              },
              child: const Text(
                'Salvar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

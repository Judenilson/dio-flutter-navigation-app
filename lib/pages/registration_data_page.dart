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
  final _levelRepository = LevelRepository();
  final _airplaneRepository = AirplaneRepository();
  var _airplanes = [];
  final _airplaneSelected = [];
  var _levels = [];
  var _levelSelected = '';
  double _milesFlying = 200.0;
  int _expTime = 0;

  @override
  void initState() {
    _levels = _levelRepository.returnLevels();
    _airplanes = _airplaneRepository.returnAirplanes();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItems(int maxQtd) {
    var items = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= maxQtd; i++) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i.toString()),
        ),
      );
    }
    return items;
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
                  initialDatePickerMode: DatePickerMode.year,
                  context: context,
                  initialDate: DateTime(2010, 1, 1),
                  firstDate: DateTime(1920, 1, 1),
                  lastDate: DateTime(2010, 12, 31),
                );
                if (date != null) {
                  _birthDateController.text =
                      '${date.day.toString()}/${date.month.toString()}/${date.year.toString()}';
                  _birthDate = date;
                }
              },
            ),
            const InputTextLabelWidget(text: 'Nível de Experiência'),
            Column(
              children: _levels
                  .map(
                    (level) => RadioListTile(
                      dense: true,
                      title: Text(level),
                      selected: _levelSelected == level,
                      value: level,
                      groupValue: _levelSelected,
                      onChanged: (value) {
                        debugPrint(value.toString());
                        setState(() {
                          _levelSelected = value;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            const InputTextLabelWidget(text: 'Aeronaves Preferidas'),
            Column(
              children: _airplanes
                  .map(
                    (airplane) => CheckboxListTile(
                      title: Text(airplane),
                      value: _airplaneSelected.contains(airplane),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value!) {
                            _airplaneSelected.add(airplane);
                          } else {
                            _airplaneSelected.remove(airplane);
                          }
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            const InputTextLabelWidget(text: 'Tempo de Experiência'),
            DropdownButton(
              value: _expTime,
              isExpanded: true,
              items: returnItems(50),
              onChanged: (value) {
                setState(() {
                  _expTime = int.parse(value.toString());
                });
              },
            ),
            InputTextLabelWidget(
                text:
                    'Milhas geralmente voadas por voo ${_milesFlying.round()}NM'),
            Slider(
              min: 0,
              max: 3000,
              value: _milesFlying,
              onChanged: (value) {
                setState(() {
                  _milesFlying = value.truncateToDouble();
                });
              },
            ),
            TextButton(
              onPressed: () {
                if (_nameController.text.trim().length < 3) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('O nome deve ser preenchido')));
                  return;
                }
                if (_birthDate == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Data de nascimento inválida')));
                  return;
                }
                if (_levelSelected.trim() == '') {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('O nível deve ser selecionado')));
                  return;
                }
                if (_airplaneSelected.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Deve ser selecionado ao menos um avião')));
                  return;
                }
                if (_expTime == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text('Deve ter ao menos um ano de experiência')));
                  return;
                }
                if (_milesFlying == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text('Deve gostar de voar alguma quantidade de milhas')));
                  return;
                }

                setState(() {
                  
                });

                debugPrint(_nameController.text);
                debugPrint(_birthDate.toString());
                debugPrint(_airplaneSelected.toString());
                debugPrint(_expTime.toString());
                debugPrint(_milesFlying.toString());
                debugPrint('Dados salvos com sucesso!');
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

import 'package:dio_flutter_navigation_app/repositories/task_repository.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var _descriptionController = TextEditingController();

  var taksRepository = TaskRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _descriptionController.text ='';
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text('Adicionar Tarefa'),
                  content: TextField(
                    controller: _descriptionController,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar')),
                    TextButton(
                        onPressed: () {
                          debugPrint(_descriptionController.text);
                          Navigator.pop(context);
                        },
                        child: const Text('Salvar'))
                  ],
                );
              });
        },
      ),
      body: Container(),
    );
  }
}

import 'package:dio_flutter_navigation_app/model/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  void addTask(Task task) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.add(task);
  }

  void change(String id, bool done) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.where((task) => task.id() == id).first.setDone(done);
  }

  Future<List<Task>> listTask() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tasks;
  }
}

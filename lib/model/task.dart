import 'package:flutter/material.dart';

class Task {
  final _id = UniqueKey().toString();
  String _description = '';
  bool done = false;

  Task(this._description, this.done);

  get id => _id;
  get description => _description;
  get getDone => done;
  set description(value) => _description = value;
  bool setDone(value) => done = value;
}

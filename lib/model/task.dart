import 'package:flutter/material.dart';

class Task {
  final String _id = UniqueKey().toString();
  String _description = '';
  bool _completed = false;

  Task(this._description, this._completed);

  get id => _id;

  get description => _description;

  set description(value) => _description = value;

  get completed => _completed;

  set completed(value) => _completed = value;
}

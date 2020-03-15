import 'package:flutter/material.dart';

class TodoItem{

final String title;
final bool status;
final TimeOfDay reminder;

TodoItem({@required this.title, @required this.status, @required this.reminder});

}
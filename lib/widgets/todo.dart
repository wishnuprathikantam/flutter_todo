import 'package:flutter/material.dart';
import 'package:fluttter_todo/models/todo_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

class TODO extends StatefulWidget {
  final TodoItem item;
  TODO({@required this.item});

  @override
  _TODOState createState() => _TODOState(
      title: this.item.title,
      status: this.item.status,
      reminder: this.item.reminder);
}

class _TODOState extends State<TODO> {
  String title;
  bool status;
  TimeOfDay reminder;
  _TODOState(
      {@required this.title, @required this.status, @required this.reminder});

  void _setCheckbox(bool value) {
    setState(() {
      status = value;
    });
  }

  void _selectTime() {
    showTimePicker(context: context, initialTime: reminder).then((onValue) {
      reminder = onValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Checkbox(
                    activeColor: Colors.white,
                    checkColor: Colors.indigo,
                    value: status,
                    onChanged: _setCheckbox),
                Text(title,
                    style: GoogleFonts.firaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: status
                            ? TextDecoration.lineThrough
                            : TextDecoration.none)),
              ],
            ),
            Divider(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Share.share(title);
                  },
                  child: Icon(Icons.share),
                ),
                FlatButton(
                  onPressed: _selectTime,
                  child: Icon(Icons.timer),
                )
              ],
            )
          ],
        ),
      ),
      elevation: 0.2,
    );
  }
}

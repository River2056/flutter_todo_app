import 'package:flutter/material.dart';
import 'main.dart';

//ListTile todo objects
class Todo extends StatefulWidget {
  const Todo({this.text, this.id, this.removeCallback});
  final String text;
  final int id;
  final RemoveCallback removeCallback;
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FlatButton(
            onPressed: () {
              // turn check_box status
              setState(() => this.isCompleted = !this.isCompleted);
            },
            child: this.isCompleted
                ? Icon(Icons.check_box, color: Colors.green)
                : Icon(Icons.check_box)),
        title: Text(
          widget.text,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        trailing: FlatButton(
          onPressed: () {
            widget.removeCallback(widget);
          },
          child: Icon(Icons.close, color: Colors.red),
        ),
      ),
    );
  }
}

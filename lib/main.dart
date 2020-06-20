import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'todo.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoPage(),
    );
  }
}

class ToDoPage extends StatefulWidget {
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<Widget> todoList = [];

  final myController = TextEditingController();
  int id = 0;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void addNewTodo() {
    this.id++;
    setState(() {
      todoList.add(
        Todo(
          text: myController.text,
          id: this.id,
          removeCallback: (todo) => setState(() => todoList.remove(todo)),
        ),
      );
      myController.clear();
    });
  }

  void addNewTodoForm(BuildContext context) {
    Alert(
      context: context,
      title: "New Todo",
      content: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.assignment),
              labelText: 'enter new todo...',
            ),
            controller: myController,
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            addNewTodo();
            Navigator.pop(context);
          },
          child: Text(
            "SUBMIT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        )
      ],
      closeFunction: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          'Todo List',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: todoList,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewTodoForm(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

typedef void RemoveCallback(Widget todo);

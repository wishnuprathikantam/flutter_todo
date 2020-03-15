import 'package:flutter/material.dart';
import 'package:fluttter_todo/models/todo_item.dart';
import 'package:fluttter_todo/widgets/todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'FLATSTYLE TODO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final listOfTodoTasks = [
    TodoItem(
        title: "Brainstorm",
        status: true,
        reminder: TimeOfDay(hour: 0, minute: 0)),
    TodoItem(
        title: "Plan Idea",
        status: true,
        reminder: TimeOfDay(hour: 0, minute: 0)),
    TodoItem(
        title: "Create wireframes",
        status: false,
        reminder: TimeOfDay(hour: 0, minute: 0)),
    TodoItem(
        title: "Iterate design changes & finalize",
        status: false,
        reminder: TimeOfDay(hour: 0, minute: 0)),
    TodoItem(
        title: "Create App",
        status: false,
        reminder: TimeOfDay(hour: 0, minute: 0)),
    TodoItem(
        title: "Test Product",
        status: false,
        reminder: TimeOfDay(hour: 0, minute: 0))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
        appBar: AppBar(
          elevation: 0.2,
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
                  listOfTodoTasks.map((item) => TODO(item: item)).toList(),
            ),
          )), // This trailing comma makes auto-formatting nicer for build methods.)
        ));
  }
}

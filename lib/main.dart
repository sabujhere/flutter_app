import 'package:flutter/material.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Todo List',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Todo List'),
        ),
      )
    )
  }
}
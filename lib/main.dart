import 'package:flutter/material.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Todo List',
      home: new TodoList()
    );
  }
}
class TodoList extends StatefulWidget{
  @override
  createState()=> new TodoListState();
}
class TodoListState extends State<TodoList>{
  List<String> _todoItems = [];
  // This will be called each time the + button is pressed
  void _addTodoItem(String task){
    // Putting code inside "setState" tells the app that our state has changed, and
    // it will automatically re-render the list
    setState(() => _todoItems.add(task));
  }

  Widget _buildTodoList(){
    return new ListView.builder(
        itemBuilder: (context, index){
         if(index <_todoItems.length){
           return _buildTodoItem(_todoItems[index]);
         }
        });
  }

  Widget _buildTodoItem(String todoText){
    return new ListTile(
      title: new Text(todoText),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List'),
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _pushAddToTodoScreen,
      tooltip: 'Add Task',
      child: new Icon(Icons.add),),
    );
  }
  
  void _pushAddToTodoScreen(){
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context){
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Add a new Task')
            ),
            body: new TextField(
              autofocus: true,
              onSubmitted: (val){
                _addTodoItem(val);
                Navigator.pop(context);//Close the add todo screen
              },
              decoration: new InputDecoration(
                hintText: 'Enter something todo...',
                contentPadding: const EdgeInsets.all(16.0)
              ),
            ),
          );
        }),
    );
  }
}
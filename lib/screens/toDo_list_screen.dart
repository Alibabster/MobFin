import 'package:CWCFlutter/model/toDo.dart';
import 'package:CWCFlutter/widget/toDo_list.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  final List<ToDo> toDos;
  final Function(ToDo) onDelete;

  UserListScreen(this.toDos, this.onDelete);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  deleteUser(ToDo toDo) {
    setState(() {
      widget.onDelete(toDo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'ToDo List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        child: UserList(widget.toDos, deleteUser),
        padding: EdgeInsets.all(8),
      ),
    );
  }
}

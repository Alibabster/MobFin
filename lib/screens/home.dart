import 'package:CWCFlutter/api/api.dart';
import 'package:CWCFlutter/model/toDo.dart';
import 'package:CWCFlutter/screens/toDo_list_screen.dart';
import 'package:CWCFlutter/widget/button.dart';
import 'package:CWCFlutter/widget/input.dart';
import 'package:CWCFlutter/widget/toDo_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String _title;
  String _description;

  List<ToDo> toDoList = [];

  addUser(ToDo toDo) {
    setState(() {
      toDoList.add(toDo);
    });
  }

  deleteUser(ToDo toDo) {
    setState(() {
      toDoList.removeWhere((_title) => _title.title == _title.description);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "ToDo Application",
          style: TextStyle(color: Colors.white),
        ),
        leading: Center(
          child: Text(
            context.watch<int>().toString(),
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureProvider(
                create: (_) => getCurrentTime(), 
                initialData: "Loading Time...",
                child: Consumer<String>(
                    builder: (_, timeString, __) => Text(
                      timeString,
                      style: TextStyle(fontSize: 18),
                    ),  
                  ),
              ),
              SizedBox(height: 16),
              CheetahInput(
                labelText: 'Title',
                onSaved: (String value) {
                  _title = value;
                },
              ),
              SizedBox(height: 16),
              CheetahInput(
                labelText: 'Description',
                onSaved: (String value) {
                  _description = value;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheetahButton(
                    text: 'Add',
                    onPressed: () {
                      if (!_formKey.currentState.validate()) return;

                      _formKey.currentState.save();

                      addUser(ToDo(_title, _description));
                    },
                  ),
                  SizedBox(width: 8),
                  CheetahButton(
                    text: 'List',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserListScreen(toDoList, deleteUser),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

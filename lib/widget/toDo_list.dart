import 'package:CWCFlutter/model/toDo.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<ToDo> toDos;
  final Function(ToDo) onDelete;

  UserList(this.toDos, this.onDelete);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            direction: Axis.horizontal,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: ${toDos[index].title}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Description: ${toDos[index].description}',
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => onDelete(toDos[index]),
                  ),
                ],
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'Name: ${users[index].name}',
          //           style: TextStyle(fontSize: 18),
          //         ),
          //         Text(
          //           'City: ${users[index].city}',
          //           style: TextStyle(fontSize: 18),
          //         ),
          //       ],
          //     ),
          //     IconButton(
          //       icon: Icon(Icons.delete),
          //       onPressed: () => onDelete(users[index]),
          //     )
          //   ],
          // ),
        ),
      ),
      itemCount: toDos.length,
    );
  }
}

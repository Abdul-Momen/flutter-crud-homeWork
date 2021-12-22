// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:practic_crud_api/model/userlist.dart';

class DetailScreen extends StatelessWidget {

  //get recived data from main page
  final UserList task;
  const DetailScreen({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title!),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(task.title!),
      ),
    );
  }
}

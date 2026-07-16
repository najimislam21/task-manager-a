import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/model/api_response.dart';
import '../data/model/task_model.dart';
import '../data/service/api_caller.dart';
import '../utils/urls.dart';

class TaskCard extends StatefulWidget {
  final TaskModel taskModel;
  final Color CardColor;
  final VoidCallback refreshParent;
  const TaskCard({

    super.key, required this.taskModel, required this.CardColor, required this.refreshParent,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

  Future<void> changeStatus(String Status) async {
    final ApiResponse response = await ApiCaller.getRequest(
      url: TMUrls.updateTaskStatusURL(widget.taskModel.sId.toString(),Status),
    );

    if (response.isSuccess) {
      widget.refreshParent();

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Task Update Success full')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.responseData['data'])),
      );
    }
    Navigator.pop(context);
  }


  void ShowChingeDialog(){
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text('Change Status'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Card(
            color: widget.taskModel.status == 'New' ? Colors.green:null,
            child: ListTile(
              title: Text('New', style: TextStyle(color: Colors.black),),
              onTap: (){
                changeStatus('New');
              },
              trailing: widget.taskModel.status == 'New' ? Icon(Icons.check_circle,color: Colors.white,): null,
            ),
          ),
          Card(
            color: widget.taskModel.status == 'Progress' ? Colors.green:null,
            child: ListTile(
              title: Text('Progress', style: TextStyle(color: Colors.black),),
              onTap: (){
                changeStatus('Progress');
              },
              trailing: widget.taskModel.status == 'Progress' ? Icon(Icons.check_circle,color: Colors.white,): null,
            ),
          ),
          Card(
            color: widget.taskModel.status == 'Completed' ? Colors.green:null,
            child: ListTile(
              title: Text('Completed', style: TextStyle(color: Colors.black),),
              onTap: (){
                changeStatus('Completed');
              },
              trailing: widget.taskModel.status == 'Completed' ? Icon(Icons.check_circle,color: Colors.white,): null,
            ),
          ),
          Card(
            color: widget.taskModel.status == 'Cancelled' ? Colors.green:null,
            child: ListTile(
              title: Text('Cancelled', style: TextStyle(color: Colors.black),),
              onTap: (){
                changeStatus('Cancelled');
              },
              trailing: widget.taskModel.status == 'Cancelled' ? Icon(Icons.check_circle,color: Colors.white,): null,
            ),
          ),

        ],
      ),
    ));
  }

  Future<void> deleteTask() async {
    final ApiResponse response = await ApiCaller.getRequest(
      url: TMUrls.deleteTasURL(widget.taskModel.sId.toString()),
    );

    List<TaskModel> task = [];

    if (response.isSuccess) {
      widget.refreshParent();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Task Delete Success full')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.responseData['data'])),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.taskModel.title.toString(),
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(fontSize: 18),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.taskModel.description.toString()),
          Text('date: ${widget.taskModel.createdDate}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Chip(
                label: Text(widget.taskModel.status.toString()),
                backgroundColor: widget.CardColor,
                labelStyle: TextStyle(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(25),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  ShowChingeDialog();
                },
                icon: Icon(Icons.edit_note, color: Colors.orange),
              ),
              IconButton(
                onPressed: () {
                  deleteTask();
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
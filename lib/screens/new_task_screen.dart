import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_manager_a/data/model/api_response.dart';
import 'package:task_manager_a/data/model/task_model.dart';
import 'package:task_manager_a/data/model/task_status_count_model.dart';
import 'package:task_manager_a/data/service/api_caller.dart';
import 'package:task_manager_a/screens/add_new_task_screen.dart';
import 'package:task_manager_a/utils/urls.dart';
import 'package:task_manager_a/widget/task_card.dart';
import 'package:task_manager_a/widget/task_count_by_status.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTaskCount();
    getAllTask();
  }

  List<TaskStatusCount> taskCount = [];

  Future<void> getAllTaskCount() async {
    final ApiResponse response = await ApiCaller.getRequest(
      url: TMUrls.getTaskCountURL,
    );
    List<TaskStatusCount> taskC = [];

    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        taskC.add(TaskStatusCount.fromJson(jsonData));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(jsonDecode(response.responseData['data']))),
      );
    }

    setState(() {
      taskCount = taskC;
    });
  }

  List<TaskModel> tasks = [];
  Future<void> getAllTask() async {
    final ApiResponse response = await ApiCaller.getRequest(
      url: TMUrls.getTaskByStatusURL('New'),
    );

    List<TaskModel> task = [];

    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        task.add(TaskModel.fromJson(jsonData));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(jsonDecode(response.responseData['data']))),
      );
    }

    setState(() {
      tasks = task;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: taskCount.length,
                itemBuilder: (context, index) {
                  final Tcount = taskCount[index];
                  return TaskCountByStatus(
                    title: Tcount.sId.toString(),
                    count: Tcount.sum!.toInt(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 20);
                },
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return TaskCard(taskModel: task, CardColor: Colors.blue, refreshParent: () async {
                  await getAllTask();
                  await getAllTaskCount();
                },);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewTaskScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



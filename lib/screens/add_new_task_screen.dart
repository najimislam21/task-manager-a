import 'package:flutter/material.dart';
import 'package:task_manager_a/screens/main_nav_screen.dart';

import '../data/model/api_response.dart';
import '../data/service/api_caller.dart';
import '../utils/urls.dart';
import '../widget/screen_bg.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> createTask() async {
    final ApiResponse response = await ApiCaller.postRequest(url: TMUrls.createTaskURL,
      body: {
        "title":titleController.text,
        "description": descriptionController.text,
        "status":"New"
      },
    );
    if(response.isSuccess){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Add New Task '),));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data']),));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    'Add New Task',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12,),

                  FilledButton(onPressed: (){
                    createTask();
                  }, child:Icon(Icons.arrow_circle_right,size: 24)),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

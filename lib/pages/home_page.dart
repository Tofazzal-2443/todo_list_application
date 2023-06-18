import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_application/controller/todo_controller.dart';
import 'package:todo_list_application/models/todo_model.dart';

import '../custom_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Checkbox
  bool isCheck = false;

  // Dialog Box Code
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> showAddList(BuildContext context, {ToDoModel? toDoModel}) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController titleTextController =
              TextEditingController();
          final TextEditingController subTitleTextController =
              TextEditingController();
          if (toDoModel != null) {
            titleTextController.text = toDoModel.todoTitle ?? 'no data found';
            subTitleTextController.text = toDoModel.subTitle ?? 'no data found';
          }
          return StatefulBuilder(builder: (_, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleTextController,
                      decoration: const InputDecoration(
                        hintText: "Title",
                      ),
                    ),
                    TextField(
                      controller: subTitleTextController,
                      decoration: const InputDecoration(
                        hintText: "Sub Title",
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                GetBuilder<TodoController>(builder: (todoController) {
                  return TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                        todoController.addNote(
                          ToDoModel(
                            todoTitle: titleTextController.text,
                            subTitle: subTitleTextController.text,
                          ),
                        );
                      }
                    },
                    child: const Text("Add Note"),
                  );
                }),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(builder: (todoController) {
      return Scaffold(
        //App bar Section
        appBar: AppBar(
          title: Text(
            "All ToDos",
            style: boldStyle(30, Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                child: IconButton(
                  onPressed: () async {
                    //todoController.setUpdateNoteStatus(false);
                    await showAddList(context);
                  },
                  icon: const Icon(
                    Icons.add,
                    //color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
        //body Section
        body: todoController.todoList != null
            ? todoController.todoList!.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: todoController.todoList!.length,
                    itemBuilder: (context, index) {
                      final todo = todoController.todoList![index];
                      return SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            tileColor: Colors.cyan,
                            leading: Checkbox(
                              value: isCheck,
                              onChanged: (value) {
                                setState(() {
                                  isCheck = value!;
                                });
                              },
                            ),
                            title: Text(
                              todo.todoTitle ?? 'no data found',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decorationThickness: 2,
                                decorationColor: Colors.orange,
                                decorationStyle: TextDecorationStyle.solid,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            subtitle: Text(
                              todo.subTitle ?? 'not data found',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //Edit IconButton
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                ),
                                //Delete IconButton
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                : const Center(child: Text('No Data Found'))
            : const Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}

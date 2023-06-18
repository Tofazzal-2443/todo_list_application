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
  @override
  void initState() {
    loadData();
    super.initState();
  }
  loadData() async{
    await Get.find<TodoController>().getAllNote();
  }
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
          if(toDoModel != null) {
            titleTextController.text = toDoModel.todoTitle ?? 'no data found';
            subTitleTextController.text = toDoModel.subTitle ?? 'no data found';
          }
          bool isChecked = false;
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
                    onPressed: () async{

                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                        todoController.isUpdateNote ? todoController.updateNote(toDoModel!.id!,
                            {
                              'id': toDoModel.id,
                              'subTitle': subTitleTextController.text,
                              'todoTitle': titleTextController.text,
                              'isDone': toDoModel.isDone,
                            }) :
                        todoController.addNote(
                            ToDoModel(
                              todoTitle: titleTextController.text,
                              subTitle: subTitleTextController.text,
                            )
                        );
                      }
                      Get.snackbar(
                        "Successfully Add Your Note",
                        "",
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.orange,
                      );
                    },
                    child: todoController.isUpdateNote ? const Text('Update') : const Text("Add Note"),
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
                    todoController.setUpdateNoteStatus(false);
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
        body: todoController.todoList != null ? todoController.todoList!.isNotEmpty ? ListView.builder(
          shrinkWrap: true,
          itemCount: todoController.todoList!.length,
          itemBuilder: (context, index) {
            final todo = todoController.todoList![index];
            return  SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tileColor: Colors.cyan,
                  leading: Checkbox(
                    onChanged: (value) {
                      todoController.updateNote(todo.id!, {
                        'isDone': value,
                      });
                    },
                    value: todo.isDone,
                  ),
                  title: Text(
                    todo.todoTitle ?? 'no data found',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      decorationThickness: 2,
                      decorationColor: Colors.orange,
                      decorationStyle: TextDecorationStyle.solid,
                      decoration: todo.isDone? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Text(
                    todo.subTitle?? 'not data found',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Edit Button
                      IconButton(
                        onPressed: () async{
                          todoController.setUpdateNoteStatus(true);
                          await showAddList(context, toDoModel: todo);
                          Get.snackbar(
                            "Successfully Update Your Note",
                            "",
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.orange,
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),

                      //Delete Button
                      IconButton(
                        onPressed: () {
                          Get.dialog(
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Material(
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),
                                            const Text(
                                              "Are you sure want to delete?",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            const SizedBox(height: 15),

                                            //Buttons
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      minimumSize: const Size(0, 45),
                                                      primary: Colors.amber,
                                                      onPrimary: const Color(0xFFFFFFFF),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'NO',
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    child: const Text(
                                                      'YES',
                                                    ),
                                                    style: ElevatedButton.styleFrom(
                                                      minimumSize: const Size(0, 45),
                                                      primary: Colors.amber,
                                                      onPrimary: const Color(0xFFFFFFFF),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      todoController.deleteNote(todo.id!);
                                                      Navigator.pop(context);
                                                      Get.snackbar(
                                                        "Successfully Delete Your Note",
                                                        "",
                                                        colorText: Colors.white,
                                                        snackPosition: SnackPosition.BOTTOM,
                                                        backgroundColor: Colors.orange,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );


                        },
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
          },
        ) :
        const Center(child: Text('No Data Found')) : const Center(child: CircularProgressIndicator(),),
      );
    });
  }
}

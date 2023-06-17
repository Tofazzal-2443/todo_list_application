class ToDoModel {
  String? id;
  String? subTitle;
  String? todoTitle;
  bool isDone;

  ToDoModel({this.id, this.todoTitle, this.isDone = false, this.subTitle});
}
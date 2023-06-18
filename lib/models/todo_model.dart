class ToDoModel {
  String? id;
  String? subTitle;
  String? todoTitle;
  bool isDone;

  ToDoModel({this.id, this.todoTitle, this.isDone = false, this.subTitle});

  //Send data to Firebase
  Map<String, dynamic>toMap(){
    return <String,dynamic>{
      'id': id,
      'subTitle': subTitle,
      'todoTitle': todoTitle,
      'isDone': isDone,
    };
  }
}


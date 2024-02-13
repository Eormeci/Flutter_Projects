class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,
});

  static List<ToDo> todoList(){
    return[
      ToDo(id:'01',todoText:'Morning Exercise',isDone: false),
      ToDo(id:'02',todoText:'Check Mail',isDone: true),
      ToDo(id:'03',todoText:'Prepare Dinner',isDone: false),
      ToDo(id:'04',todoText:'Watch a movie',isDone: true),
    ];
  }

}
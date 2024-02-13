import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/todo.dart';
import 'package:todo_app/todo_item.dart';
import 'colors.dart';
import 'my_app.dart';

void main() {
  runApp(MyApp());
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo>_foundToDo = [];

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15), // Konumu ayarlıyor
            //Arama kısmının altı
            child: Center(
              child:Column(
                children:[
                  searchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin:EdgeInsets.only(top:50,bottom: 20),
                          child: Text(
                              'All To Dos',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500)
                          ),
                        ),
                        for (ToDo todoo in _foundToDo.reversed)//En üste eklesin
                        ToDoItem(
                          todo:todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        )
                      ],
                    ),
                  )

                ]
              )
            ),
          ),
          Align(  //Add New Todo
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(margin:EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20
              ),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration:BoxDecoration(
                  color:Colors.white,
                  boxShadow:const [BoxShadow(
                    color:Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  )],
                borderRadius:BorderRadius.circular(20),
                ),
                child:TextField(
                  controller:_todoController,
                 decoration: InputDecoration(
                   hintText: 'Add a new To Do item',
                   border: InputBorder.none,
                 ),
                )
              ),
              ),
              Container(
                margin:EdgeInsets.only(bottom:20,right:20),
              child:ElevatedButton(
                child:Text('+',style:TextStyle(fontSize:40)),
                onPressed:(){
                  _addToDoItem(_todoController.text);
                },
                style:ElevatedButton.styleFrom(
                  primary: tdBlueColor,
                  minimumSize: Size(60,60),
                  elevation: 10,
                ),
                )
              )
            ],),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo){
    setState(() {
      todosList.add(ToDo(id:DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _todoController.clear();
  }

  void _runfilter(String enteredKeyword){
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results=todosList;
    }
    else{
      results = todosList.where((item)=>
          item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox(){
    return Container(   //Buna widht+height vermedin, kendiliğinden oldu
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15), //İcon+search'ün paddingi
      decoration:BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child:TextField(
        onChanged: (value)=> _runfilter(value),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon( //Icon buraya
                Icons.search,
                color: tdBlackColor,
                size: 20
            ),
            prefixIconConstraints: BoxConstraints(
                maxHeight: 20 //Search butonu sınırlandırılıyor
                ,maxWidth: 25
            ),
            border:InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(
                color:tdGreyColor
            ),
          )
      ),
    );
  }

  AppBar _buildAppBar() { //AppBar üstteki oluyor. avatar + menu ikonu
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlackColor,
            size: 50,
          ),
          Container(  //Avatar.jpeg
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('images/avatar.jpeg'),
            ),
          ),
        ],//Children
      ),//Title:row
    );
  }
}

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_1/models/todo.dart';
import 'package:flutter_basic_1/providers/todo_default.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late List<Todo> todos;
  TodoDefault todoDefault = TodoDefault();
  bool isLoading = true;
/*
  Future initDb() async {
    await todoSqlite.initDb().then((value) async {
      todos = await todoSqlite.getTodos();
  */
  @override
  void initState() {
    super.initState();
    {
      Timer(const Duration(seconds: 2), () {
        todos = todoDefault.getTodos();
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  /*
    Timer(const Duration(seconds: 2), () {
      initDb().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    });
  }
}
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('할 일 목록 앱'),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book),
                  Text('뉴스'),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('+', style: TextStyle(fontSize: 25)),
        onPressed: () {
          /*
        showDialog(
            context: context,
            builder: (BuildContext context) {
              String title = '';
              String description = '';
              return AlertDialog(
                title: const Text('할 일 추가하기'),
                content: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (value) {
                          title = value;
                        },
                        decoration: const InputDecoration(labelText: '제목'),
                      ),
                      TextField(
                        onChanged: (value) {
                          description = value;
                        },
                        decoration: const InputDecoration(labelText: '설명'),
                      )
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      child: const Text('추가'),
                      onPressed: () async {
                        await todoSqlite.addTodo(
                          Todo(title: title, description: description),
                        );
                        List<Todo> newTodos = await todoSqlite.getTodos();
                        setState(() {
                          print("[UI] ADD");
                          todos = newTodos;
                        });
                        Navigator.of(context).pop();
                      }),
                  TextButton(
                      child: const Text('취소'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              );
            });*/
        },
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].title),
                  onTap: () {
                    /*
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text('할 일'),
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Text('제목:${todos[index].title}'),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Text('설명:${todos[index].description}'),
                            ),
                          ],
                        );
                      });*/
                  },
                  trailing: SizedBox(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            child: const Icon(Icons.edit),
                            onTap: () {
                              /*
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  String title = todos[index].title;
                                  String description = todos[index].description;
                                  return AlertDialog(
                                    title: const Text('할 일 수정하기'),
                                    content: SizedBox(
                                      height: 200,
                                      child: Column(
                                        children: [
                                          TextField(
                                            onChanged: (value) {
                                              title = value;
                                            },
                                            decoration: InputDecoration(
                                              hintText: todos[index].title,
                                            ),
                                          ),
                                          TextField(
                                            onChanged: (value) {
                                              description = value;
                                            },
                                            decoration: InputDecoration(
                                              hintText:
                                                  todos[index].description,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          child: const Text('수정'),
                                          onPressed: () async {
                                           await todoSqlite.deleteTodo(
                                            todos[index].id??0);
                                            List<Todo> newTodos=
                                            await todoSqlite.getTodos();
                                            setState((){
                                              todos=newTodos;
                                            });
                                            Navigator.of(context).pop();
                                          }), 
                                      ]                 
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: InkWell(
                          child: const Icon(Icons.delete),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('할 일 삭제하기'),
                                    content: const SizedBox(
                                      child: Text('삭제하시겠습니까?'),
                                    ),
                                    actions: [
                                      TextButton(
                                          child: const Text('삭제'),
                                          onPressed: () async {
                                            setState(() {
                                              TodoSqlite.deleteTodo(
                                                  todos[index].id ?? 0);
                                            });
                                            Navigator.of(context).pop();
                                          }),
                                      TextButton(
                                          child: const Text('취소'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }),
                                    ],
                                  );
                                });
                          },
                        ),
                      ),;
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
  );
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('ListScreen')),
    );
  }
}


        
    



          return ListTile(
            title:Text(todos[index].title),
            onTap:() {
           


            trailing: Container(
              width:80,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
            */
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            child: const Icon(Icons.delete),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
    );
  }
}

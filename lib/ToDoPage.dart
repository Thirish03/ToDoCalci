import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  TextEditingController textController = TextEditingController();
  List<String> toDo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "TODO",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15.0, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: "Enter your word",
                        prefixIcon: Icon(Icons.message),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                MaterialButton(
                  color: Colors.pinkAccent,
                  splashColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    setState(() {
                      toDo.add(textController.text);
                      textController.clear();
                    });
                  },
                  child: Text(
                    "Add +",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Flexible(
                child: ListView.builder(
              itemCount: toDo.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                        child: Text(
                      toDo[index],
                      style: TextStyle(fontSize: 25.0),
                    )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            toDo.removeAt(index);
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_calci/CalciPage.dart';
import 'package:todo_calci/ToDoPage.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "WELCOME TO TODOCALCI",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.pinkAccent,
            Colors.blue,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.white,
              splashColor: Colors.pinkAccent,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ToDoPage()));
              },
              child: Text(
                "TODO",
                style: TextStyle(color: Colors.pinkAccent),
              ),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              splashColor: Colors.blue,
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CalciPage()));
              },
              child: Text(
                "CALCI",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ));
  }
}

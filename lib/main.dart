import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
          backgroundColor: Colors.lightBlue,

        ),

        body: const MyList(),

        floatingActionButton: FloatingActionButton.extended(
          onPressed:
          () {

          }, label: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return const Column(

      children: [
      ],
    );
  }
}



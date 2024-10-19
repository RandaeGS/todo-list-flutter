import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Todo List",
      home: MyList(),
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
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todo List"),
        backgroundColor: Colors.lightBlue,
      ),


      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => {
            showTextDialog(context)
          },
          label: const Icon(Icons.add)
      ),
    );
  }
}

Future<void> showTextDialog(BuildContext context) async{
  return showDialog(context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter new task"),
          content: const TextField(
            autofocus: true,

            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero))),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Colors.grey,
              onPressed: () {

              },
              child: const Text("Cancel"),
            ),
            MaterialButton(
              color: Colors.lightBlue,
              onPressed: () {

              },
              child: const Text("Ok"),
            )
          ],
        );
      }
  );
}

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
  List<String> taskList = [];

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
            showTextDialog(context, taskList)
          },
          label: const Icon(Icons.add)
      ),
    );
  }
}

Future<void> showTextDialog(BuildContext context, taskList) async{
  TextEditingController textController = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter new task"),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))

          ),
          content: TextField(
            controller: textController,
            autofocus: true,
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
            onChanged: (value) {

            },
          ),
          actions: <Widget>[

            MaterialButton(
              color: Colors.grey,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),

            MaterialButton(
              color: Colors.lightBlue,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              onPressed: () {
                taskList.add(textController.text);
              },
              child: const Text("Ok"),
            )
          ],
        );
      }
  );
}

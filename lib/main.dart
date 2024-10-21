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

      body: MyTaskListView(taskList: taskList),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async => {
            await showTextDialog(context, taskList),
            setState(() {}),
          },
          label: const Icon(Icons.add)
      ),
    );
  }
}

class MyTaskListView extends StatelessWidget {
  final List<String> taskList;

  const MyTaskListView({super.key, required this.taskList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index){
        return Card(
            child: Dismissible(
              key: Key(taskList[index]),
              child: ListTile(
                title: Text(taskList[index]),
                trailing: const Icon(Icons.check_box_outline_blank),
              ),
            )

        );
        },
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
                Navigator.of(context).pop();
              },
              child: const Text("Ok"),
            )
          ],
        );
      }
  );
}

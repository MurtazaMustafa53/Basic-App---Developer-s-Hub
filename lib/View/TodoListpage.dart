import 'package:basicapp/Controller/TodolistController.dart';
import 'package:basicapp/Model/Custombutton.dart';
import 'package:basicapp/Model/Customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Todolistpage extends StatefulWidget {
  const Todolistpage({super.key});

  @override
  State<Todolistpage> createState() => _TodolistpageState();
}

class _TodolistpageState extends State<Todolistpage> {
  final Todolistcontroller _todolistcontroller = Todolistcontroller();
  final TextEditingController _inputController = TextEditingController();

  List<String> _tasks = [];

  void loadlistvalue() async {
    List<String> _savedtasks = await _todolistcontroller.loadTasks();
    setState(() {
      _tasks = _savedtasks;
    });
  }

  void addtask() {
    String text = _inputController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _tasks.add(text);
      });
      _todolistcontroller.saveTasks(_tasks);
      _inputController.clear();
    }
  }

  void deletetasks(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _todolistcontroller.saveTasks(_tasks);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TO-DO LISTS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Customtextformfeild(
                    controller: _inputController,
                    hint: "Enter a new Task.....",
                    label: "",
                  ),
                ),
                SizedBox(width: 10),
                Custombutton(
                  onTap: () {
                    addtask();
                  },
                  title: "Add",
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: _tasks.isEmpty
                  ? Center(child: Text("No tasks Added Yet"))
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(_tasks[index]),
                            trailing: IconButton(
                              onPressed: () => deletetasks(index),
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

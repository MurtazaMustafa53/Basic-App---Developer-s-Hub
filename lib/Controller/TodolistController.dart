import 'package:shared_preferences/shared_preferences.dart';

class Todolistcontroller {

  final String _storagekey = "List_value";

  Future<List<String>> loadTasks()async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    List<String> loadedtasks = prefs.getStringList(_storagekey)??[];
    print("The Tasks Has been Succesfully added : \n $loadedtasks");
    return loadedtasks;
  }

  Future<void> saveTasks(List<String> Value)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_storagekey,Value);
    print("Saved Successfully \n $Value");
  }
  
}
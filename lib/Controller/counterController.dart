import 'package:shared_preferences/shared_preferences.dart';

class Countercontroller {
  final String _storagekey = 'counter_value';

  Future<int> loadCounterValue( )async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int loadedValue= prefs.getInt(_storagekey)??0;
    print("Counter Loaded counter = $loadedValue");
    return loadedValue;
  }

  Future<void> saveCounterValue(int counter_value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt(_storagekey, counter_value);
    print("Saved counter = $counter_value");

  }
}
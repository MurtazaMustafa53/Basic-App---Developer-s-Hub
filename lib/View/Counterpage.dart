import 'package:basicapp/Controller/counterController.dart';
import 'package:basicapp/Model/Custombutton.dart';
import 'package:flutter/material.dart';

class Counterpage extends StatefulWidget {
  const Counterpage({super.key});

  @override
  State<Counterpage> createState() => _CounterpageState();
}

class _CounterpageState extends State<Counterpage> {
  int _counter = 0;
  final Countercontroller _countercontroller = Countercontroller();

  void _loadSavedCounterValue ()async{
    int savedCounterValue = await _countercontroller.loadCounterValue();
    setState(() {
      _counter = savedCounterValue;
    });
  }

  @override void initState() {
    // TODO: implement initState
    super.initState();
    _loadSavedCounterValue();
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$_counter",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              "Counter Value ",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custombutton(
                  onTap: () {
                    setState(() {
                      _counter = 0;
                      _countercontroller.saveCounterValue(_counter);
                      
                    });
                  },
                  title: "Reset",
                  size: 20,
                ),
                SizedBox(width: 5),
                Custombutton(
                  onTap: () {
                    setState(() {
                      _counter++;
                      _countercontroller.saveCounterValue(_counter);
                    });
                  },
                  title: "+",
                ),
                SizedBox(width: 5),
                Custombutton(
                  onTap: () {
                    setState(() {
                      _counter--;
                      _countercontroller.saveCounterValue(_counter);
                    });
                  },
                  title: "-",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:basicapp/Model/Custombutton.dart';
import 'package:flutter/material.dart';

class Counterpage extends StatefulWidget {
  const Counterpage({super.key});

  @override
  State<Counterpage> createState() => _CounterpageState();
}

class _CounterpageState extends State<Counterpage> {
  int _counter = 0;
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
          children: [
            Column(
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
                        });
                      },
                      title: "+",
                    ),
                    SizedBox(width: 5),
                    Custombutton(
                      onTap: () {
                        setState(() {
                          _counter--;
                        });
                      },
                      title: "-",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

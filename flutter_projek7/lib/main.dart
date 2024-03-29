import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({super.key});
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Dynamic Apps"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                counter.toString(),
                style: TextStyle(
                  fontSize: 20+ double.parse(counter.toString()),
                  color: Colors.deepPurple
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      
                        setState(() {
                           counter++;
                        });
                      
                      print(counter);
                    },
                    child: Icon(Icons.add),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(counter !=1){
                        setState(() {
                           counter--;
                        });
                      }
                      print(counter);
                    },
                    child: Icon(Icons.remove),
                  )
                ],
              )
            ],
          )),
    );
  }
}

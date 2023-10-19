import 'package:flutter/material.dart';

void main() {
  runApp(MyUtsTest());
}

var nobp = "";
var nama = "";
var MTK = 0;
var Algo = 0;
var Java = 0;
var rata = 0.0; 

class MyUtsTest extends StatefulWidget {
  @override
  State<MyUtsTest> createState() => _MyUtsTestState();
}

class _MyUtsTestState extends State<MyUtsTest> {
  final TextEditingController nobpController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController MTKController = TextEditingController();
  final TextEditingController AlgoController = TextEditingController();
  final TextEditingController JavaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Tugas PraUTS"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            // alignment: Alignment.centerLeft,
            children: [
              Text('nomor bp'),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: "No Bp",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    nobp = value;
                    // Calculate the `rata` variable.
                    rata = (MTK + Algo + Java) / 3.0;
                  });
                  print(nobp);
                },
                controller: nobpController,
              ),
              Text('nama', ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: "Nama",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    nama = value;
                    // Calculate the `rata` variable.
                    rata = (MTK + Algo + Java) / 3.0;
                  });
                  print(nama);
                },
                controller: namaController,
              ),
              Text('nilai matematika', ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: "MTK",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    MTK = int.parse(value);
                    // Calculate the `rata` variable.
                    rata = (MTK + Algo + Java) / 3.0;
                  });
                  print(MTK);
                },
                controller: MTKController,
              ),
              Text('nilai algoritma', ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: "Algoritma",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    Algo = int.parse(value);
                    // Calculate the `rata` variable.
                    rata = (MTK + Algo + Java) / 3.0;
                  });
                  print(Algo);
                },
                controller: AlgoController,
              ),
              Text('java', ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: "Java",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(
                    () {
                      Java = int.parse(value);
                      // Calculate the `rata` variable.
                      rata = (MTK + Algo + Java) / 3.0;
                    },
                  );
                  print(Java);
                },
                controller: JavaController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHasil(),
                              ),
                            );
                          },
                          child: Text("Ok"));
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        nobpController.clear();
                        namaController.clear();
                        MTKController.clear();
                        AlgoController.clear();
                        JavaController.clear();
                        nobp = "";
                        nama = "";
                        MTK = 0;
                        Algo = 0;
                        Java = 0;
                        rata = 0.0;
                      });
                    },
                    child: Text("Reset"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHasil extends StatelessWidget {
  const MyHasil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hasil"),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding:EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hasil"),
              SizedBox(
                height: 20,
              ),
              Text("No BP: $nobp"),
              SizedBox(
                height: 20,
              ),
              Text("Nama: $nama"),
              SizedBox(
                height: 20,
              ),
              Text("NIlai Matematika: $MTK"),
              SizedBox(
                height: 20,
              ),
              Text("Nilai Algoritma: $Algo"),
              SizedBox(
                height: 20,
              ),
              Text("Nilai Java: $Java"),
              SizedBox(
                height: 20,
              ),
              Text("Rata: $rata"),
            ],
          ),
        ),
      ),
    );
  }
}
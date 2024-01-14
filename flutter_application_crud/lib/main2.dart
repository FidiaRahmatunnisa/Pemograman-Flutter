import 'package:flutter/material.dart';
import 'package:flutter_application_crud/mahasiswa.dart';
import 'package:flutter_application_crud/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  
  get posts => null;
  
  get index => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD List'),
      ),
      body: FutureBuilder<List<Mahasiswa>?>(
  future: _apiService.getMahasiswa(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      List<Mahasiswa> posts = snapshot.data ?? []; // Gunakan list kosong jika data null
      return ListView.builder(
        // itemCount: posts.length,
        // itemBuilder: (context, index) {
        //   return ListTile(
        //     title: Text(posts[index].nama),
        //     subtitle: Text(posts[index].email),
        //   );
        // },

  itemCount: posts.length,
  itemBuilder: (context, index) {
    Mahasiswa mahasiswa = posts[index];
    return ListTile(
      title: Text(mahasiswa.nama),
      subtitle: Text(mahasiswa.email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              // Panggil fungsi deleteMahasiswa dari ApiService
              await _apiService.deleteMahasiswa(mahasiswa.id);

              // Refresh UI setelah operasi delete
              setState(() {
                posts.removeAt(index);
              });
            },
          ),
        ],
      ),
    );
  },
      );
    }
  },
),

      floatingActionButton: FloatingActionButton(

        onPressed: () async {
          try {
            var mahasiswa;
            await _apiService.deleteMahasiswa(mahasiswa.id);
            // Refresh UI after delete operation
            setState(() {
              posts.removeAt(index);
            });
          } catch (error) {
            print("Error deleting mahasiswa: $error");
          }
        },

        // onPressed: () async {
        //   // Example: Creating a new post
        //   Mahasiswa newPost = Mahasiswa(id: 0, nama: 'Dodi', email: 'dedi@gmail.com', tgllahir: '1979-01-01');
        //   // ignore: unused_local_variable
        //   Object? createdPost = await _apiService.createMahasiswa(newPost);
        //   setState(() {});
        // },
        child: Icon(Icons.add),
      ),      
    );  
  }
}

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
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tgllahirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Mahasiswa'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: InputDecoration(labelText: 'Nama'),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _tgllahirController,
                    decoration: InputDecoration(labelText: 'Tgl Lahir'),
                  ),

                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () async {
                      Mahasiswa newPost = Mahasiswa(
                        id: 0,
                        nama: _namaController.text,
                        email: _emailController.text,
                        tgllahir: _tgllahirController.text,
                      );

                      Object? createdPost =
                          await _apiService.createMahasiswa(newPost);
                      print('Created Post: $createdPost');

                      _namaController.clear();
                      _emailController.clear();
                      _tgllahirController.clear();

                      setState(() {});   // refresh view
                    },
                    child: Text('Create Post'),
                  ),
                ],
              ),
            ),
          ),


          Expanded(
            child: FutureBuilder<List<Mahasiswa>?>(
              future: _apiService.getMahasiswa(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == null) {
                  return Text('Data not available');
                } else {

                  List<Mahasiswa> posts = snapshot.data!;
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(posts[index].nama),
                        subtitle: Text(posts[index].email),

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _showUpdateForm(posts[index]);
                              },
                            ),

                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                // Panggil fungsi deleteMahasiswa dari ApiService
                                await _apiService
                                    .deleteMahasiswa(posts[index].id);

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
          ),
        ],
      ),
    );
  }


  void _showUpdateForm(Mahasiswa mahasiswa) {
  // Menetapkan data mahasiswa ke dalam controller
  _namaController.text = mahasiswa.nama;
  _emailController.text = mahasiswa.email;
  _tgllahirController.text = mahasiswa.tgllahir;

  // Menampilkan formulir update menggunakan dialog atau menavigasi ke halaman baru
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Update Mahasiswa'),
        content: Column(
          children: [
            // Formulir update data
            TextFormField(
                    controller: _namaController,
                    decoration: InputDecoration(labelText: 'Nama'),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _tgllahirController,
                    decoration: InputDecoration(labelText: 'Tgl Lahir'),
                  ),

            // Tombol Simpan
            ElevatedButton(
              onPressed: () async {
                // Memperbarui data mahasiswa menggunakan _apiService.updateMahasiswa
                Mahasiswa updatedMahasiswa = Mahasiswa(
                  id: mahasiswa.id,
                  nama: _namaController.text,
                  email: _emailController.text,
                  tgllahir: _tgllahirController.text,
                );

                await _apiService.updateMahasiswa(updatedMahasiswa);

                // Refresh UI setelah pembaruan
                setState(() {});

                // Tutup dialog setelah pembaruan selesai
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),

          ],
        ),
      );
    },
  );
}



}

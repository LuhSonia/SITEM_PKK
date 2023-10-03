import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MyAdd extends StatefulWidget {
  @override
  _MyAddState createState() => _MyAddState();
}

class _MyAddState extends State<MyAdd> {
  TextEditingController _judulController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Tanggal',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(2000, 1, 1),
                  maxTime: DateTime(2101, 12, 31),
                  onConfirm: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                  currentTime: selectedDate,
                );
              },
              child: Text(
                'Pilih Tanggal',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Judul',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              controller: _judulController,
              decoration: InputDecoration(
                hintText: 'Masukkan judul catatan',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Catatan',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              controller: _catatanController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Masukkan isi catatan',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String judul = _judulController.text;
                String catatan = _catatanController.text;
                print('Judul: $judul');
                print('Catatan: $catatan');
                print('Tanggal: $selectedDate');

                // Lakukan sesuatu dengan judul, catatan, dan selectedDate (tanggal yang dipilih),
                // misalnya menyimpannya di tempat penyimpanan atau mengirim ke server.

                // Buka halaman baru untuk menampilkan hasil inputan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      judul: judul,
                      catatan: catatan,
                      tanggal: selectedDate,
                    ),
                  ),
                );
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _judulController.dispose();
    _catatanController.dispose();
    super.dispose();
  }
}

class ResultPage extends StatelessWidget {
  final String judul;
  final String catatan;
  final DateTime tanggal;

  ResultPage({
    required this.judul,
    required this.catatan,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Judul:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              judul,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Catatan:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              catatan,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Tanggal:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              tanggal.toString(), // Menampilkan tanggal yang dipilih
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Iuran_Models.dart';

// ignore: must_be_immutable
class InputIuranPage extends StatefulWidget {
  DateTime selectedDate;
  final String kegiatan;
  final TextEditingController tanggalController;
  ImageProvider? buktiPembayaran;

  InputIuranPage({
    required this.selectedDate,
    required this.kegiatan,
    required this.tanggalController,
    this.buktiPembayaran,
    required TextEditingController kegiatanController,
  });

  @override
  _InputIuranPageState createState() => _InputIuranPageState();
}

class _InputIuranPageState extends State<InputIuranPage> {
  late TextEditingController namaController;
  late TextEditingController jabatanController;
  late TextEditingController kegiatanController;
  ImageProvider? _tempBuktiPembayaran; // Tambahkan variabel sementara di sini

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController();
    jabatanController = TextEditingController();
    kegiatanController = TextEditingController(text: widget.kegiatan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Iuran"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: "Nama",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: jabatanController,
                decoration: InputDecoration(
                  labelText: "Jabatan",
                  prefixIcon: Icon(Icons.work),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: kegiatanController,
                decoration: InputDecoration(
                  labelText: "Kegiatan",
                  prefixIcon: Icon(Icons.event),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: widget.tanggalController,
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: widget.selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != widget.selectedDate) {
                    setState(() {
                      widget.selectedDate = pickedDate;
                      widget.tanggalController.text =
                          pickedDate.toLocal().toString().split(' ')[0];
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: "Tanggal Pembayaran",
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),
              SizedBox(height: 16.0),
              // Input Foto Pembayaran
              GestureDetector(
                  onTap: () async {
                    final imagePicker = ImagePicker();
                    final XFile? pickedImage = await imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );

                    if (pickedImage != null) {
                      setState(() {
                        _tempBuktiPembayaran =
                            FileImage(File(pickedImage.path));
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.buktiPembayaran != null
                            ? Image(image: widget.buktiPembayaran!)
                            : Icon(Icons.camera_alt, size: 40.0),
                        Text("Unggah Bukti Pembayaran"),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String nama = namaController.text;
          String jabatan = jabatanController.text;

          Navigator.pop(
            context,
            Iuran(
              nama: nama,
              jabatan: jabatan,
              kegiatan: kegiatanController.text,
              tanggal: widget.selectedDate,
              buktiPembayaran:
                  _tempBuktiPembayaran, // Menggunakan gambar sementara
            ),
          );
        },
        child: Icon(Icons.save),
      ),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    jabatanController.dispose();
    kegiatanController.dispose();
    super.dispose();
  }
}

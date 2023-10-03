import 'package:flutter/material.dart';
import 'inputiuran.dart';
import 'Iuran_Models.dart';

class IuranPage extends StatefulWidget {
  @override
  _IuranPageState createState() => _IuranPageState();
}

class _IuranPageState extends State<IuranPage> {
  TextEditingController kegiatanController = TextEditingController();
  TextEditingController tanggalController =
      TextEditingController(); // Tambahkan controller untuk tanggal

  List<Iuran> iuranAnggota = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iuran Anggota PKK Desa Kubutambahan"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: iuranAnggota.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(iuranAnggota[index].nama),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(iuranAnggota[index].jabatan),
                      SizedBox(height: 4.0),
                      Text("Kegiatan: ${iuranAnggota[index].kegiatan}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                          "Tanggal: ${iuranAnggota[index].tanggal.toLocal().toString().split(' ')[0]}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  leading: iuranAnggota[index].buktiPembayaran !=
                          null // Tampilkan gambar bukti pembayaran jika ada
                      ? Image(image: iuranAnggota[index].buktiPembayaran!)
                      : null,
                  // ... (lanjutkan dengan tombol Edit dan Hapus)
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputIuranPage(
                      selectedDate: DateTime.now(),
                      kegiatanController: kegiatanController,
                      tanggalController: tanggalController,
                      kegiatan: '',
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {
                    iuranAnggota.add(result);
                  });
                }
              },
              child: Text("Tambah Iuran Pembayaran"),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Susunan Keanggotaan PKK',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: AnggotaList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnggotaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Susunan Keanggotaan PKK'),
      ),
      body: ListView(
        children: [
          _buildSection(
              'Penghayatan dan Pengamalan Pancasila dan Gotong Royong', [
            _buildAnggota('POKJA I', 'KETUA', 'CARMELINDA CARVALHO'),
            _buildAnggota('POKJA I', 'WAKIL', 'LUH PUTU WARINI'),
            _buildAnggota('POKJA I', 'SEKRETARIS', 'MADE SUSARI DEWI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'NI LUH KARONI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'LUH SRI NADI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'PUTU BUDARI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'MADE SUASTINI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'KADEK SINTAWATI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'LUH SUKERINI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'LUH DARMIYANTI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'NYOMAN WILIANI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'LUH SUKARMIADI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'KADEK ARYANTINI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'KOMANG DARINI'),
          ]),
          _buildSection(
              'Pendidikan, Keterampilan, dan Pengembangan Kehidupan Berkoperasi',
              [
                _buildAnggota('POKJA II', 'KETUA', 'I KETUT MEGAWATI'),
                _buildAnggota('POKJA II', 'WAKIL', 'KADEK SUPARTI'),
                _buildAnggota('POKJA II', 'SEKRETARIS', 'NI MADE JERO'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'PUTU ENI ARWATI'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'NI MADE WARTINI'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'NI KOMANG SUKERTI'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'DESAK SULASTRI'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'PUTU KAWI'),
                _buildAnggota(
                    'POKJA II', 'ANGGOTA', 'KETUT ESTI SETIA PURNAMA DEWI'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'MADE DWITTARI PANDE'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'NI KOMANG BUDIKERTIASIH'),
                _buildAnggota(
                    'POKJA II', 'ANGGOTA', 'NI LUH PUTU ERNA PURNAMA WARDANI'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'LUH MINI'),
              ]),
          _buildSection(
              'Pangan, Sandang, Perumahan, dan Tata Laksana Rumah Tangga', [
            _buildAnggota('POKJA III', 'KETUA', 'NI LUH DURIANI PANDE'),
            _buildAnggota('POKJA III', 'WAKIL', 'LUH SWINADI'),
            _buildAnggota('POKJA III', 'SEKRETARIS', 'KOMANG DESY ARIANI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'MADE BUDIAYU'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KADEK PURNAMI'),
            _buildAnggota(
                'POKJA III', 'ANGGOTA', 'NI KADEK ELFIRA MEIROSA PERASI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KETUT KARTIKA'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KETUT EVIN HANDAYANI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KOMANG ARIANI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KETUT SUANDAYANI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'JRO NYOMAN SUDARBI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KADEK DEWI INDRAYANI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KETUT SETIA WATI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'GUSTI AYU DEWI PUJAYANI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KOMANG SITI SURYANI'),
          ]),
          _buildSection(
              'Kesehatan, Kelestarian Lingkungan Hidup, dan Perencanaan Kesehatan',
              [
                _buildAnggota('POKJA IV', 'KETUA', 'LUH ALIT MAHENDRA WATI'),
                _buildAnggota('POKJA IV', 'WAKIL', 'KADEK SUARTINI'),
                _buildAnggota('POKJA IV', 'SEKRETARIS', 'KOMANG INTAN SURYANI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KADEK DESY ARISANDI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'LUH ANITA'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'LUH BUDIARTINI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KOMANG SUARDENI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KOMANG ASRINI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'GUSTI AYU KETUT ARMENI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'NYOMAN SARIANI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'WAYAN KARINI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'NI KADEK RASMINI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KOMANG ARDIANI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'LUH JULIANTINI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KADEK DESI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'LUH SETIANI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KETUT SUANDA YANI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KADEK SUARMINI'),
              ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> anggotaList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: anggotaList,
        ),
      ],
    );
  }

  Widget _buildAnggota(String pokja, String jabatan, String nama) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          jabatan,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(nama),
        trailing: Text(pokja),
      ),
    );
  }
}

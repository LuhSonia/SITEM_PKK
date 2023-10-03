import 'package:flutter/cupertino.dart';

class Iuran {
  final String nama;
  final String jabatan;
  final String kegiatan;
  final DateTime tanggal;
  final ImageProvider? buktiPembayaran; // Tambahkan gambar bukti pembayaran

  Iuran({
    required this.nama,
    required this.jabatan,
    required this.kegiatan,
    required this.tanggal,
    this.buktiPembayaran, // Tambahkan gambar bukti pembayaran
  });
}


  // Iuran.fromMap(Map<String, dynamic> map)
  //     : nama = map['nama'].toString(),
  //       jabatan = map['jabatan'].toString(),
  //       tanggal = map['DateTime'],
  //       kegiatan = map['kegiatan'],
  //       fotoPath = map['fotoPath'].toString();

  // Map<String, Object?> toMap() {
  //   return {
  //     'nama': nama,
  //     'jabatan': jabatan,
  //     'fotoPath': fotoPath,
  //   };
  // }


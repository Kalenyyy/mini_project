import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/detail_picture_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller untuk mengambil parameter id dan data gambar
    final DetailPictureController controller = Get.put(DetailPictureController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Picture Detail (ID: ${controller.id})'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Membuat sudut gambar membulat
                child: Image.network(
                  controller.imageUrl,
                  width: double.infinity, // Lebar gambar mengikuti layar
                  height: 300, // Tinggi gambar
                  fit: BoxFit.cover, // Mengatur agar gambar memenuhi ukuran yang diberikan
                ),
              ),
            ),
            const SizedBox(height: 16.0), // Jarak antara gambar dan author
            // Nama Author
            Text(
              'Created by: ${controller.author}', // Menampilkan nama author yang benar
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0), // Jarak antara author dan teks lainnya
            // Informasi tambahan atau keterangan (jika ada)
            Text(
              'Picture ID: ${controller.id}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

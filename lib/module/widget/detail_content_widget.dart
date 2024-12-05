import '../../core.dart';

class DetailPictureWidget extends StatelessWidget {
  final String imageUrl;
  final String author;
  final String id;

  const DetailPictureWidget({
    super.key,
    required this.imageUrl,
    required this.author,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gambar
        Center(
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(8.0), // Membuat sudut gambar membulat
            child: Image.network(
              imageUrl,
              width: double.infinity, // Lebar gambar mengikuti layar
              height: 300, // Tinggi gambar
              fit: BoxFit
                  .cover, // Mengatur agar gambar memenuhi ukuran yang diberikan
            ),
          ),
        ),
        const SizedBox(height: 16.0), // Jarak antara gambar dan author
        // Nama Author
        Text(
          'Created by: $author', // Menampilkan nama author
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0), // Jarak antara author dan teks lainnya
        // Informasi tambahan atau keterangan (jika ada)
      ],
    );
  }
}

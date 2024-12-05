import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../route/app_pages.dart';
import '../controller/list_picture_controller.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ListPictureController controller = Get.put(ListPictureController());
    controller.fetchPictures();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos Page'),
      ),
      body: Obx(() {
        if (controller.pictures.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.pictures.length,
          itemBuilder: (context, index) {
            var picture = controller.pictures[index];
            return Card(
              margin: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  // Navigasi ke halaman detail dengan parameter id
                  Get.toNamed(Routes.DETAIL, parameters: {
                    'id': picture['id'],
                    });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      picture['download_url'],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Created by: ${picture['author']}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

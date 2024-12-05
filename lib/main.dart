import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'route/app_pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Routing Example',
      initialRoute: Routes.PHOTOS, // Route awal
      getPages: AppPages.routes, // Daftar routing
    );
  }
}

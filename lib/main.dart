import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDWr5bCvEt9n0wEnY8GSGU2yo5isrqnjEg",
      appId: "1:306780705678:android:523f0a88ec053374e90adf",
      messagingSenderId: "306780705678",
      projectId: "app-mini-d1274",
      storageBucket: "app-mini-d1274.appspot.com",
    ),
  );

  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
    ),
  );
}

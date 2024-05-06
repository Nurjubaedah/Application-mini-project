import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_application_2_cli/app/routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), (() {
      Get.offAllNamed(Routes.LOGIN);
    }));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bgsplash.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0,
                200), // Atur jarak antara gambar dan teks menggunakan padding
            child: Center(
              child: Image.asset(
                'assets/images/bunga-ungu.png',
                width: 229.51,
                height: 149.8,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                0, 200, 0, 90), // Atur padding horizontal untuk teks
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  text: "HELLO FELLAS.\n",
                  children: [
                    TextSpan(
                      text:
                          "Temukan segala jenis bunga\n dari berbagai belahan dunia",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

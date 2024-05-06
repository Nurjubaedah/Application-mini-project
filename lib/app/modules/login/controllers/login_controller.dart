import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2_cli/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<User?> get streamAuthStatus =>
      FirebaseAuth.instance.authStateChanges();

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login(String username, String password) async {
    try {
      if (username.isEmpty || password.isEmpty) {
        Get.snackbar(
          'Error',
          'Username or password cannot be empty',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
        return;
      }

      // Authenticate user using Firebase Authentication
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      // Get user data from Firestore
      DocumentSnapshot userDoc = await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      // Check if user exists in Firestore
      if (userDoc.exists) {
        // Navigate to home screen after successful login
        Get.offAllNamed(Routes.HOME);
      } else {
        // If user data not found in Firestore, show error message
        Get.snackbar(
          'Error',
          'User data not found',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuth exceptions
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found for that email',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong password provided for that user',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to sign in: ${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
      }
    } catch (e) {
      // Handle other exceptions
      Get.snackbar(
        'Error',
        'An unexpected error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    }
  }
}

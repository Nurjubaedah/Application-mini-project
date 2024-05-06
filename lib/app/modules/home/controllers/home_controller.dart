import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final picker = ImagePicker();
  final image = Rx<XFile?>(null);

  var userName = ''.obs;
  var phoneNumber = ''.obs;
  var address = ''.obs;
  var profilePhotoUrl = ''.obs;

  HomeController() {
    initializeFirebase();
  }

  // Inisialisasi Firebase
  Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      print('Firebase Initialized');
    } catch (e) {
      print('Error initializing Firebase: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        DocumentSnapshot userSnapshot =
            await _firestore.collection('users').doc(user.uid).get();

        if (userSnapshot.exists) {
          Map<String, dynamic>? userData =
              userSnapshot.data() as Map<String, dynamic>?;

          if (userData != null) {
            userName.value = userData['name'] ?? '';
            phoneNumber.value = userData['phoneNumber'] ?? '';
            address.value = userData['address'] ?? '';

            String? photoUrl = userData['photoUrl'];
            if (photoUrl != null && photoUrl.isNotEmpty) {
              profilePhotoUrl.value = photoUrl;
            }
          }
        }
      }
    } catch (e) {
      print('Error getting user data: $e');
    }
  }

  Future<String> uploadFile(File image) async {
    try {
      final storageReference =
          FirebaseStorage.instance.ref().child('foto/${image.path}');
      await storageReference.putFile(image);
      String photoURL = await storageReference.getDownloadURL();
      return photoURL;
    } catch (e) {
      print('Error uploading photo: $e');
      throw e;
    }
  }

  Future<void> getImage(bool gallery) async {
    try {
      final pickedFile = await picker.pickImage(
        source: gallery ? ImageSource.gallery : ImageSource.camera,
      );
      if (pickedFile != null) {
        image.value = pickedFile;
        String photoURL = await uploadFile(File(pickedFile.path));

        // Simpan URL foto ke Firestore
        User? user = _auth.currentUser;
        if (user != null) {
          await _firestore
              .collection('users')
              .doc(user.uid)
              .update({'photoUrl': photoURL});
          profilePhotoUrl.value = photoURL;
        }

        Get.snackbar(
          'Success',
          'Photo uploaded successfully',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
      }
    } catch (e) {
      print('Error uploading photo: $e');
      Get.snackbar(
        'Error',
        'Failed to upload photo. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    }
  }
}

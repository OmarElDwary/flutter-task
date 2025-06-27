import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileController {
  final gender = ''.obs;
  final imageFile = Rxn<File>();
  final saving = false.obs;

  final userId =
      FirebaseAuth.instance.currentUser?.uid ?? 'i4Py6Zq5TBZoBbIa33Ms';

  void initUser(String value) {
    gender.value = value;
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('local_profile_image', picked.path);
      imageFile.value = File(picked.path);
    }
  }

  Future<void> saveProfile({
    required String name,
    required String email,
    required String phone,
    required String dateOfBirth,
  }) async {
    try {
      saving.value = true;

      String? imgUrl;

      if (imageFile.value != null) {
        final ref = FirebaseStorage.instance.ref('profiles/$userId.jpg');
        await ref.putFile(imageFile.value!);
        imgUrl = await ref.getDownloadURL();
      }

      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'name': name,
        'email': email,
        'phone': phone,
        'dateOfBirth': dateOfBirth,
        'gender': gender.value,
        'localImage': imageFile.value?.path,
        if (imgUrl != null) 'profileImage': imgUrl,
      });

      print('Profile updated successfully.');
    } catch (e) {
      print('Error while saving profile: $e');
    } finally {
      saving.value = false;
    }
    Get.back();
  }
}

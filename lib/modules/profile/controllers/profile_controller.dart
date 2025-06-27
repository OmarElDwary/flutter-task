import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_getx_task/data/models/user_model.dart';
import 'package:flutter_getx_task/data/services/user_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var user = Rxn<UserModel>();
  final _userService = UserService();
  final isLoading = true.obs;
  final localImagePath = ''.obs;

  Future<void> loadLocalProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('local_profile_image');
    if (path != null) {
      localImagePath.value = path;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserData();
    loadLocalProfileImage();
  }

  Future<void> getUserData() async {
    try {
      isLoading.value = true;
      final currentUser = FirebaseAuth.instance.currentUser;
      final docId = currentUser?.uid ?? 'i4Py6Zq5TBZoBbIa33Ms';
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(docId).get();

      final fetchedUser = await _userService.getUser(docId);

      if (fetchedUser != null) {
        user.value = fetchedUser;
      } else {
        print('No user found you are viewing test user');
      }

      if (doc.exists) {
        user.value = UserModel.fromMap(doc.data()!, doc.id);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void updateName(String newName) {
    user.update((val) {
      if (val != null) {
        val.name = newName;
      }
    });
  }
}

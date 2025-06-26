import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_getx_task/data/models/user_model.dart';

class UserService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserModel?> getUser(String uid) async {
    final doc = await _firebaseFirestore.collection('users').doc(uid).get();

    if (!doc.exists) return null;
    return UserModel.fromMap(doc.data()!, doc.id);
  }
}

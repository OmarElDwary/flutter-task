import 'package:flutter_getx_task/data/models/user_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var user = Rxn<UserModel>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUser();
  }

  void loadUser() {
    user.value = UserModel(
        id: "1",
        name: "Omar",
        email: "omareldwary@gmail.com",
        profileImage:
            "https://images.pexels.com/photos/32638976/pexels-photo-32638976/free-photo-of-horse-rider-in-dramatic-golden-sunset-in-turkiye.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2");
  }

  void updateName(String newName) {
    user.update((val) {
      if (val != null) {
        val.name = newName;
      }
    });
  }
}

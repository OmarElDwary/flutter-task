import 'package:flutter_getx_task/modules/profile/bindings/profile_binding.dart';
import 'package:flutter_getx_task/modules/profile/views/profile/profile_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: "/profile", page: () => ProfileView(), binding: ProfileBinding())
  ];
}

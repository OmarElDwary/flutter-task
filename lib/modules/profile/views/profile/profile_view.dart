import 'package:flutter/material.dart';
import 'package:flutter_getx_task/core/constants/app_colors.dart';
import 'package:flutter_getx_task/core/constants/app_dimensions.dart';
import 'package:flutter_getx_task/core/widgets/labeled_text.dart';
import 'package:flutter_getx_task/modules/profile/controllers/produle_controller.dart';
import 'package:flutter_getx_task/modules/profile/views/profile/profile_widgets/profile_action.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: Obx(() {
        final user = controller.user.value;
        if (user == null) {
          return Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Padding(
            padding: AppDimensions.defaultPadding,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.profileImage),
                  radius: AppDimensions.imagesRadius,
                ),
                Text(user.name),
                LabeledText(label: "ID", value: user.id),
                Container(
                  padding: AppDimensions.defaultPadding,
                  decoration: BoxDecoration(
                      color: AppColors.kTerracottaColor,
                      borderRadius:
                          BorderRadius.circular(AppDimensions.defaultRadius)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileAction(
                          icon: Icons.person_2_outlined,
                          label: "Profile",
                          onTap: () => Get.to(() => ProfileView())),
                      ProfileAction(
                          icon: Icons.library_books_outlined,
                          label: "Wish list",
                          onTap: () => Get.to(() => ProfileView())),
                      ProfileAction(
                          icon: Icons.shopping_bag_outlined,
                          label: "Profile",
                          onTap: () => Get.to(() => ProfileView())),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

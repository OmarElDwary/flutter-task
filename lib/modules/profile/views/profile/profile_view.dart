import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_task/core/constants/app_colors.dart';
import 'package:flutter_getx_task/core/constants/app_dimensions.dart';
import 'package:flutter_getx_task/core/constants/app_text_styles.dart';
import 'package:flutter_getx_task/core/widgets/labeled_text.dart';
import 'package:flutter_getx_task/core/widgets/menu_btn.dart';
import 'package:flutter_getx_task/modules/edit-profile/views/edit-profile/edit_profile_view.dart';
import 'package:flutter_getx_task/modules/orders/views/orders_view.dart';
import 'package:flutter_getx_task/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_getx_task/modules/profile/views/profile/profile_widgets/profile_action.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: Text(
          "My Profile",
          style: AppTextStyles.title.copyWith(color: AppColors.kSalmonColor),
        ),
        actions: [
          IconButton(
              onPressed: () => Get.to(EditProfileView(
                    user: controller.user.value!,
                  )),
              icon: Icon(Icons.edit))
        ],
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
                Obx(() {
                  final path = controller.localImagePath.value;
                  final fallbackImage =
                      controller.user.value?.profileImage ?? '';

                  return CircleAvatar(
                    radius: 60,
                    backgroundImage: path.isNotEmpty
                        ? FileImage(File(path))
                        : NetworkImage(fallbackImage) as ImageProvider,
                  );
                }),
                Text(
                  user.name,
                  style: AppTextStyles.title,
                ),
                LabeledText(label: "ID: ", value: user.id),
                Container(
                  padding: AppDimensions.defaultPadding,
                  decoration: BoxDecoration(
                      color: AppColors.kSalmonColor,
                      borderRadius:
                          BorderRadius.circular(AppDimensions.defaultRadius)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileAction(
                          icon: Icons.person_2_outlined,
                          label: "Profile",
                          onTap: () => Get.to(() => ProfileView())),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                        child: VerticalDivider(
                            width: 20,
                            thickness: 1,
                            color: AppColors.kPrimaryColor),
                      ),
                      ProfileAction(
                          icon: Icons.library_books_outlined,
                          label: "Wish list",
                          onTap: () => Get.to(() => ProfileView())),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                        child: VerticalDivider(
                            width: 20,
                            thickness: 1,
                            color: AppColors.kPrimaryColor),
                      ),
                      ProfileAction(
                          icon: Icons.shopping_bag_outlined,
                          label: "Orders",
                          onTap: () => Get.to(() => OrdersView())),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MenuBtn(
                        icon: Icons.key,
                        onTap: () => Get.to(() => ProfileView()),
                        title: "Privacy Policy"),
                    MenuBtn(
                        icon: Icons.credit_card_rounded,
                        onTap: () => Get.to(() => ProfileView()),
                        title: "Payment Methods"),
                    MenuBtn(
                        icon: Icons.notifications_outlined,
                        onTap: () => Get.to(() => ProfileView()),
                        title: "Notification"),
                    MenuBtn(
                        icon: Icons.settings_outlined,
                        onTap: () => Get.to(() => ProfileView()),
                        title: "Settings"),
                    MenuBtn(
                        icon: Icons.support_agent_sharp,
                        onTap: () => Get.to(() => ProfileView()),
                        title: "Help"),
                    MenuBtn(
                        icon: Icons.door_back_door_outlined,
                        onTap: () => Get.to(() => ProfileView()),
                        title: "Help"),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

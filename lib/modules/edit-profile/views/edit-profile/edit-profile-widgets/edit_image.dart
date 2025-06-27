import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_getx_task/core/constants/app_colors.dart';
import 'package:flutter_getx_task/core/constants/app_dimensions.dart';
import 'package:flutter_getx_task/data/models/user_model.dart';
import 'package:flutter_getx_task/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileImageEdit extends StatelessWidget {
  const ProfileImageEdit({
    super.key,
    required this.user,
    required this.onTap,
    this.imageFile,
  });

  final UserModel user;
  final VoidCallback onTap;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    final localImagePath = profileController.localImagePath.value;

    Widget imgWidget;
    if (imageFile != null) {
      imgWidget = CircleAvatar(
        radius: AppDimensions.imagesRadius,
        backgroundImage: FileImage(imageFile!),
      );
    } else if (localImagePath.isNotEmpty) {
      imgWidget = CircleAvatar(
        radius: AppDimensions.imagesRadius,
        backgroundImage: FileImage(File(localImagePath)),
      );
    } else if (user.profileImage.isNotEmpty) {
      imgWidget = CircleAvatar(
        radius: AppDimensions.imagesRadius,
        backgroundImage: NetworkImage(user.profileImage),
      );
    } else {
      imgWidget = CircleAvatar(
        radius: AppDimensions.imagesRadius,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person, size: 40),
      );
    }
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          imgWidget,
          Positioned(
            top: 95,
            right: -10,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kSalmonColor,
                ),
                padding: AppDimensions.contentPadding,
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 18,
                  color: AppColors.kBlackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

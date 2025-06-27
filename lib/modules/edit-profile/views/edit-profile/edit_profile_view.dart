import 'package:flutter/material.dart';
import 'package:flutter_getx_task/core/constants/app_colors.dart';
import 'package:flutter_getx_task/core/constants/app_dimensions.dart';
import 'package:flutter_getx_task/core/constants/app_text_styles.dart';
import 'package:flutter_getx_task/core/widgets/custom_form_field.dart';
import 'package:flutter_getx_task/core/widgets/labeled_text.dart';
import 'package:flutter_getx_task/data/models/user_model.dart';
import 'package:flutter_getx_task/modules/edit-profile/controllers/edit_profile_controller.dart';
import 'package:flutter_getx_task/modules/edit-profile/views/edit-profile/edit-profile-widgets/edit_image.dart';
import 'package:flutter_getx_task/modules/edit-profile/views/edit-profile/edit-profile-widgets/gender_selector.dart';
import 'package:flutter_getx_task/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  final UserModel user;
  EditProfileView({super.key, required this.user});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    controller.initUser(user.gender);
    if (nameController.text.isEmpty) {
      nameController.text = user.name;
      emailController.text = user.email;
      phoneController.text = user.phone;
      dateOfBirthController.text = user.dateOfBirth;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          title: Text(
            "My Profile",
            style: AppTextStyles.title.copyWith(color: AppColors.kSalmonColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => ProfileImageEdit(
                    user: user,
                    onTap: controller.pickImage,
                    imageFile: controller.imageFile.value,
                  )),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.08
                        : MediaQuery.of(context).size.height * 0.15,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: AppColors.kBeigeColor),
                child: Column(
                  children: [
                    Text(
                      user.name,
                      style: AppTextStyles.title,
                    ),
                    LabeledText(label: "ID: ", value: user.id),
                  ],
                ),
              ),
              SizedBox(height: 10),
              CustomFormField(
                label: "Full Name",
                controller: nameController,
                hintText: user.name,
              ),
              CustomFormField(
                label: "Email",
                controller: emailController,
                hintText: user.email,
              ),
              CustomFormField(
                label: "Mobile Number",
                controller: phoneController,
                hintText: user.phone,
              ),
              CustomFormField(
                label: "Date of birth",
                controller: dateOfBirthController,
                hintText: user.dateOfBirth,
              ),
              Padding(
                padding: AppDimensions.contentPadding,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Gender", style: AppTextStyles.label)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => GenderSelector(
                        isSelected: controller.gender.value == "Male",
                        label: "Male",
                        onTap: () => controller.gender.value = "Male",
                      )),
                  Obx(() => GenderSelector(
                        isSelected: controller.gender.value == "Female",
                        label: "Female",
                        onTap: () => controller.gender.value = "Female",
                      )),
                ],
              ),
              Padding(
                padding: AppDimensions.contentPadding,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kSalmonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.defaultRadius))),
                    onPressed: () async {
                      await controller.saveProfile(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        phone: phoneController.text.trim(),
                        dateOfBirth: dateOfBirthController.text.trim(),
                      );
                      await Get.find<ProfileController>().getUserData();
                      await Get.find<ProfileController>()
                          .loadLocalProfileImage();
                      Get.back();
                    },
                    child: Obx(() => controller.saving.value
                        ? CircularProgressIndicator(
                            color: AppColors.kPrimaryColor)
                        : Text(
                            "Update Profile",
                            style: AppTextStyles.label
                                .copyWith(color: AppColors.kPrimaryColor),
                          ))),
              )
            ],
          ),
        ));
  }
}

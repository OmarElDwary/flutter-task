import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getx_task/core/constants/app_colors.dart';
import 'package:flutter_getx_task/core/constants/app_dimensions.dart';
import 'package:flutter_getx_task/core/constants/app_text_styles.dart';

class MenuBtn extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const MenuBtn(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: AppDimensions.contentPadding,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: AppColors.kSalmonColor, shape: BoxShape.circle),
              child: Center(
                child: Icon(icon, size: 20, color: AppColors.kBlackColor),
              ),
            ),
            SizedBox(width: 10),
            Expanded(child: Text(title, style: AppTextStyles.value))
          ],
        ),
      ),
    );
  }
}

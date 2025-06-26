import 'package:flutter/widgets.dart';
import 'package:flutter_getx_task/core/constants/app_colors.dart';
import 'package:flutter_getx_task/core/constants/app_text_styles.dart';

class ProfileAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const ProfileAction(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30, color: AppColors.kDarkOrangeColor),
          SizedBox(height: 5),
          Text(
            label,
            style:
                AppTextStyles.value.copyWith(color: AppColors.kDarkOrangeColor),
          )
        ],
      ),
    );
  }
}

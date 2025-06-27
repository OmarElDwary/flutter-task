import 'package:flutter/material.dart';
import 'package:flutter_getx_task/core/constants/app_colors.dart';
import 'package:flutter_getx_task/core/constants/app_dimensions.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({
    super.key,
    required this.isSelected,
    required this.label,
    required this.onTap,
  });

  final VoidCallback onTap;
  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: MediaQuery.of(context).size.width * 0.45,
        padding: AppDimensions.defaultPadding,
        decoration: BoxDecoration(
          color: AppColors.kBeigeColor,
          borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: AppColors.kSalmonColor,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: AppColors.kDarkOrangeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

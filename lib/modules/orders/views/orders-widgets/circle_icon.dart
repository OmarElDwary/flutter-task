import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    required this.icon,
    required this.onTap,
    required this.bgColor,
    required this.color,
    this.borderColor,
    this.borderWidth,
  });
  final IconData icon;
  final VoidCallback onTap;
  final Color bgColor;
  final Color color;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            border: borderColor != null
                ? Border.all(color: borderColor!, width: borderWidth!)
                : null),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}

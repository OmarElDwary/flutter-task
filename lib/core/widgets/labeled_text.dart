import 'package:flutter/widgets.dart';
import 'package:flutter_getx_task/core/constants/app_text_styles.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String value;
  const LabeledText({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: "$label", style: AppTextStyles.label),
      TextSpan(text: "$value", style: AppTextStyles.value)
    ]));
  }
}

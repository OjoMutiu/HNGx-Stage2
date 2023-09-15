import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class ContactTag extends StatelessWidget {
  const ContactTag({
    super.key,
    required this.contact,
    required this.icon,
  });

  final String contact;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,
            size: AppDimensions.height10 * 1.6, color: AppColors.mainColor),
        SizedBox(width: AppDimensions.width10 / 2),
        Text(
          contact,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.secondaryTextColor),
        ),
      ],
    );
  }
}

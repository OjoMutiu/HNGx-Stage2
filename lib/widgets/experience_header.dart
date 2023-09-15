import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ExperienceHeader extends StatelessWidget {
  const ExperienceHeader({
    super.key,
    required this.title,
    required this.indication,
    this.color,
  });
  final String title, indication;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: color ?? AppColors.secondaryTextColor),
        ),
        Text(indication,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.secondaryTextColor)),
      ],
    );
  }
}

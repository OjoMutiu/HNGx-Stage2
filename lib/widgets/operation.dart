import 'package:flutter/material.dart';
import 'package:resume/model/operation.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class ExperienceOperation extends StatelessWidget {
  const ExperienceOperation({
    super.key,
    required this.operation,
  });

  final String operation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppDimensions.height1 * 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: AppDimensions.width10),
          Padding(
            padding: EdgeInsets.only(top: AppDimensions.height1 * 6),
            child: Container(
              height: AppDimensions.height10 * 0.7,
              width: AppDimensions.width10 * 0.7,
              decoration: BoxDecoration(
                color: AppColors.mainColor2.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: AppDimensions.width10),
          Expanded(
            child: Text(
              operation,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.secondaryTextColor),
            ),
          ),
        ],
      ),
    );
  }
}

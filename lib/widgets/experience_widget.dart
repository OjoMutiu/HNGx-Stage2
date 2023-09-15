import 'package:flutter/material.dart';
import 'package:resume/model/operation.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import 'experience_header.dart';
import 'operation.dart';

class Experience extends StatelessWidget {
  const Experience({
    super.key,
    required this.roleTitle,
    required this.roleIndication,
    required this.company,
    required this.location,
    required this.companyDesc,
    required this.operation,
  });

  final String roleTitle, roleIndication, company, location, companyDesc;
  final List<String> operation;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExperienceHeader(title: roleTitle, indication: roleIndication),
        SizedBox(height: AppDimensions.height10 * 0.7),
        ExperienceHeader(
            title: company, color: AppColors.mainColor2, indication: location),
        SizedBox(height: AppDimensions.height10 * 1.2),
        Text(companyDesc,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.secondaryTextColor)),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: operation.length,
            itemBuilder: (context, index) {
              return ExperienceOperation(operation: operation[index]);
            }),
        SizedBox(height: AppDimensions.height20),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';

class ExperienceEdit extends StatefulWidget {
  const ExperienceEdit({super.key});

  @override
  State<ExperienceEdit> createState() => _ExperienceEditState();
}

class _ExperienceEditState extends State<ExperienceEdit> {
  late TextEditingController experienceRoleController,
      experienceStartDate,
      experienceEndDate,
      experienceCompany,
      experienceLocation,
      experienceCompanyDescription,
      experienceOperation;

  @override
  void initState() {
    super.initState();
    experienceRoleController = TextEditingController();
    experienceStartDate = TextEditingController();
    experienceEndDate = TextEditingController();
    experienceCompany = TextEditingController();
    experienceLocation = TextEditingController();
    experienceCompanyDescription = TextEditingController();
    experienceOperation = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    experienceRoleController.dispose();
    experienceStartDate.dispose();
    experienceEndDate.dispose();
    experienceCompany.dispose();
    experienceLocation.dispose();
    experienceCompanyDescription.dispose();
    experienceOperation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Add Experience'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.width20,
              vertical: AppDimensions.height20),
          width: double.maxFinite,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              child: Column(
                children: [
                  TextField(
                    autofocus: true,
                    controller: experienceRoleController,
                    decoration: InputDecoration(
                      hintText: 'experienceModel',
                    ),
                    onChanged: (value) {
                      setState(() {
                        // profile.setName(value);
                      });
                    },
                  ),
                  SizedBox(height: AppDimensions.height20),
                  TextField(
                    autofocus: true,
                    // controller: roleController,
                    decoration: InputDecoration(
                      hintText: '', //profile.getRole(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        // profile.setRole(value);
                      });
                    },
                  ),
                  SizedBox(height: AppDimensions.height20),
                  TextField(
                    autofocus: true,
                    // controller: phoneNumberController,
                    decoration: InputDecoration(
                      hintText: '', //profile.getPhoneNumber(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        // profile.setPhoneNumber(value);
                      });
                    },
                  ),
                  SizedBox(height: AppDimensions.height20),
                  TextField(
                    autofocus: true,
                    // controller: emailController,
                    decoration: InputDecoration(
                      hintText: '', //profile.getEmail(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        // profile.setEmail(value);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

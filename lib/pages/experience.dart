import 'package:flutter/material.dart';
import 'package:resume/model/experience.dart';

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
    ExperienceModel experience = ExperienceModel(
        role: 'Role',
        company: 'Company',
        startDate: 'StartDate',
        endDate: 'EndDate',
        location: 'Location',
        companyDescription: 'Company Description',
        operation: []);

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
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      hintText: experience.getRole(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        experience.setRole(value);
                      });
                    },
                  ),
                  SizedBox(height: AppDimensions.height20),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(),
                        hintText: experience.getCompany()),
                    onChanged: (value) {
                      setState(() {
                        experience.setCompany(value);
                      });
                    },
                  ),
                  SizedBox(height: AppDimensions.height20),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      hintText: experience.getCompanyDescription(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        experience.setCompanyDescription(value);
                      });
                    },
                  ),
                  SizedBox(height: AppDimensions.height20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                            hintText: experience.getStartDate(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              experience.setStartDate(value);
                            });
                          },
                        ),
                      ),
                      SizedBox(width: AppDimensions.width10 * 2),
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          controller: experienceRoleController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                            hintText: experience.getEndDate(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              experience.setEndDate(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimensions.height20),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      hintText: 'Activity',
                    ),
                    onChanged: (value) {
                      setState(() {
                        experience.addOperationItem(value);
                      });
                    },
                  ),
                  SizedBox(height: AppDimensions.height20),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      hintText: 'Activity',
                    ),
                    onChanged: (value) {
                      setState(() {
                        experience.addOperationItem(value);
                      });
                    },
                  ),
                  SizedBox(height: AppDimensions.height20 * 2),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: () {
                          // experienceModel.add(experience);
                          // Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            textStyle: TextStyle(
                                fontSize: AppDimensions.height20 * 0.8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimensions.width10,
                              vertical: AppDimensions.height10 * 1.5),
                          child: Text('Add Experience'),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

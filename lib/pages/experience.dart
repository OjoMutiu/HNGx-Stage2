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
      experienceOperation1,
      experienceOperation2;

  @override
  void initState() {
    super.initState();
    experienceRoleController = TextEditingController();
    experienceStartDate = TextEditingController();
    experienceEndDate = TextEditingController();
    experienceCompany = TextEditingController();
    experienceLocation = TextEditingController();
    experienceCompanyDescription = TextEditingController();
    experienceOperation1 = TextEditingController();
    experienceOperation2 = TextEditingController();
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
    experienceOperation1.dispose();
    experienceOperation2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ExperienceModel experience;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Add Experience'),
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
                      hintText: 'Role',
                    ),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: AppDimensions.height20),
                  TextField(
                    autofocus: true,
                    controller: experienceCompany,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(),
                      hintText: "Company",
                    ),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: AppDimensions.height20),
                  TextField(
                    autofocus: true,
                    controller: experienceCompanyDescription,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      hintText: "Company Description",
                    ),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: AppDimensions.height20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          controller: experienceStartDate,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                            hintText: "Start Date",
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(width: AppDimensions.width10 * 2),
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          controller: experienceEndDate,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                            hintText: "End Date",
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimensions.height20),
                  TextField(
                    autofocus: true,
                    controller: experienceOperation1,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      hintText: 'Activity',
                    ),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: AppDimensions.height20),
                  TextField(
                    autofocus: true,
                    controller: experienceOperation2,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      hintText: 'Activity',
                    ),
                    onChanged: (value) {
                      setState(() {
                        operations.add(value);
                        // experience.addOperationItem(value);
                      });
                    },
                  ),
                  SizedBox(height: AppDimensions.height20 * 2),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: () {
                          //print(experience.getRole());
                          experienceModel.add(experience = ExperienceModel(
                            role: experienceRoleController.text,
                            company: experienceCompany.text,
                            startDate: experienceStartDate.text,
                            endDate: experienceEndDate.text,
                            location: 'location',
                            companyDescription:
                                experienceCompanyDescription.text,
                            operation: operations,
                          ));
                          print(experience.getRole());
                          Navigator.of(context).pop(experience);
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

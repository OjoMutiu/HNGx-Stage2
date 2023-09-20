import 'package:flutter/material.dart';
import 'package:resume/model/experience.dart';
import 'package:resume/pages/experience.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../model/profile.dart';

class MainEditPage extends StatefulWidget {
  const MainEditPage({super.key});

  @override
  State<MainEditPage> createState() => _MainEditPageState();
}

class _MainEditPageState extends State<MainEditPage> {
  bool isExpanded = true;
  bool isAboutExpanded = true;
  bool isExperienceExpanded = true;
  late TextEditingController nameController,
      roleController,
      phoneNumberController,
      emailController,
      summaryController;

  final String userName = '', role = '';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    roleController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    summaryController = TextEditingController();
    //Todo: immediate update of experience model acrros all pages
    setState(() {
      experienceModel;
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    roleController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    summaryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Edit'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: AppDimensions.height10),
            //Profile Edit
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.width10 * 1.6,
                  vertical: AppDimensions.height10),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.white70,
                    offset: Offset(0, 2),
                    blurRadius: 1,
                    spreadRadius: 1)
              ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Profile',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: AppDimensions.height20 * 1.2,
                                  color: AppColors.mainColor2)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          icon: isExpanded
                              ? Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          showDialog<String>(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(AppDimensions
                                                              .getProportionalScreenHeight(
                                                                  4))),
                                                  title: SizedBox(
                                                      width: double.maxFinite,
                                                      child: Text('Profile')),
                                                  content: SizedBox(
                                                    width: double.maxFinite,
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: Column(
                                                        children: [
                                                          TextField(
                                                            autofocus: true,
                                                            controller:
                                                                nameController,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText: profile
                                                                  .getName(),
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                profile.setName(
                                                                    value);
                                                              });
                                                            },
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  AppDimensions
                                                                      .height20),
                                                          TextField(
                                                            autofocus: true,
                                                            controller:
                                                                roleController,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText: profile
                                                                  .getRole(),
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                profile.setRole(
                                                                    value);
                                                              });
                                                            },
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  AppDimensions
                                                                      .height20),
                                                          TextField(
                                                            autofocus: true,
                                                            controller:
                                                                phoneNumberController,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText: profile
                                                                  .getPhoneNumber(),
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                profile
                                                                    .setPhoneNumber(
                                                                        value);
                                                              });
                                                            },
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  AppDimensions
                                                                      .height20),
                                                          TextField(
                                                            autofocus: true,
                                                            controller:
                                                                emailController,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText: profile
                                                                  .getEmail(),
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                profile
                                                                    .setEmail(
                                                                        value);
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                            AppStrings.cancel)),
                                                    TextButton(
                                                        onPressed: () {
                                                          //get the text in the textField via the pop() method
                                                          Navigator.of(context)
                                                              .pop();

                                                          nameController
                                                              .clear();
                                                          roleController
                                                              .clear();
                                                          phoneNumberController
                                                              .clear();
                                                          emailController
                                                              .clear();
                                                        },
                                                        child: Text(
                                                          AppStrings.save,
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .mainColor),
                                                        )),
                                                  ],
                                                );
                                              });
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: AppColors.mainColor,
                                        )),
                                    const Icon(Icons.keyboard_arrow_up),
                                  ],
                                )
                              : const Icon(Icons.keyboard_arrow_down)),
                    ],
                  ),
                  if (isExpanded)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Profile Image
                        CircleAvatar(
                          radius: AppDimensions.height100 * 0.32,
                          child: CircleAvatar(
                            radius: AppDimensions.height100 * 0.3,
                            backgroundImage:
                                AssetImage(AppStrings.profileImage),
                          ),
                        ),
                        //Contact info
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: AppDimensions.width10 * 1.5,
                                top: AppDimensions.height10 * 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(profile.getName(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: AppColors.primaryTextColor,
                                            fontSize:
                                                AppDimensions.height20 * 1.1)),
                                Text(
                                  profile.getRole(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: AppColors.primaryTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.height10),
            //About Edit
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.width10 * 1.6,
                  vertical: AppDimensions.height10),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.white70,
                    offset: Offset(0, 2),
                    blurRadius: 1,
                    spreadRadius: 1)
              ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('About',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: AppDimensions.height20 * 1.2,
                                  color: AppColors.mainColor2)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isAboutExpanded = !isAboutExpanded;
                            });
                          },
                          icon: isAboutExpanded
                              ? Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          showDialog<String>(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(AppDimensions
                                                              .getProportionalScreenHeight(
                                                                  4))),
                                                  title: SizedBox(
                                                      width: double.maxFinite,
                                                      child: Text('About')),
                                                  content: SizedBox(
                                                    width: double.maxFinite,
                                                    child: TextField(
                                                      autofocus: true,
                                                      controller:
                                                          nameController,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: profile
                                                            .getSummary(),
                                                      ),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          profile.setSummary(
                                                              value);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                            AppStrings.cancel)),
                                                    TextButton(
                                                        onPressed: () {
                                                          //get the text in the textField via the pop() method
                                                          Navigator.of(context)
                                                              .pop();

                                                          summaryController
                                                              .clear();
                                                        },
                                                        child: Text(
                                                          AppStrings.save,
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .mainColor),
                                                        )),
                                                  ],
                                                );
                                              });
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: AppColors.mainColor,
                                        )),
                                    const Icon(Icons.keyboard_arrow_up),
                                    SizedBox(width: AppDimensions.width10),
                                  ],
                                )
                              : const Icon(Icons.keyboard_arrow_down)),
                    ],
                  ),
                  if (isAboutExpanded)
                    Container(
                      child: Column(
                        children: [
                          Text(
                            profile.getSummary(),
                            textAlign: TextAlign.justify,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.secondaryTextColor),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.height10),
            //Experience Edit
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.width10 * 1.6,
                  vertical: AppDimensions.height10),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.white70,
                    offset: Offset(0, 2),
                    blurRadius: 1,
                    spreadRadius: 1)
              ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Experience',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: AppDimensions.height20 * 1.2,
                                  color: AppColors.mainColor2)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isExperienceExpanded = !isExperienceExpanded;
                            });
                          },
                          icon: isExperienceExpanded
                              ? Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const ExperienceEdit();
                                          }));
                                        },
                                        icon: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                width: AppDimensions.height1 *
                                                    0.135,
                                                color: Colors.blueGrey),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.mainColor,
                                          ),
                                        )),
                                    Icon(Icons.keyboard_arrow_up),
                                  ],
                                )
                              : Icon(Icons.keyboard_arrow_down)),
                    ],
                  ),
                  if (isExperienceExpanded)
                    Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: experienceModel.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: AppDimensions.height10 * 0.8),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppDimensions.width10,
                                      vertical: AppDimensions.height10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.lightBlue
                                              .withOpacity(0.35),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10 * 0.6)),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            experienceModel[index].getRole(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: AppColors
                                                        .secondaryTextColor),
                                          ),
                                          Text(
                                              '${experienceModel[index].getStartDate()} - ${experienceModel[index].getEndDate()}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color: AppColors
                                                          .secondaryTextColor)),
                                        ],
                                      ),
                                      SizedBox(
                                          height: AppDimensions.height10 * 0.8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            experienceModel[index].getCompany(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: AppColors.mainColor),
                                          ),
                                          Text(
                                              experienceModel[index]
                                                  .getLocation(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color: AppColors
                                                          .secondaryTextColor)),
                                        ],
                                      ),
                                      SizedBox(
                                          height: AppDimensions.height10 * 2),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: AppDimensions.height30,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .circular(AppDimensions
                                                                      .getProportionalScreenHeight(
                                                                          4))),
                                                          title: SizedBox(
                                                              width: double
                                                                  .maxFinite,
                                                              child: Text(
                                                                  'Experience')),
                                                          content:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                TextField(
                                                                  autofocus:
                                                                      true,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(),
                                                                    hintText: experienceModel[
                                                                            index]
                                                                        .getRole(),
                                                                  ),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      experienceModel[
                                                                              index]
                                                                          .setRole(
                                                                              value);
                                                                    });
                                                                  },
                                                                ),
                                                                SizedBox(
                                                                    height: AppDimensions
                                                                        .height20),
                                                                TextField(
                                                                  autofocus:
                                                                      true,
                                                                  decoration: InputDecoration(
                                                                      focusedBorder:
                                                                          const OutlineInputBorder(),
                                                                      enabledBorder:
                                                                          const OutlineInputBorder(),
                                                                      hintText:
                                                                          experienceModel[index]
                                                                              .getCompany()),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      experienceModel[
                                                                              index]
                                                                          .setCompany(
                                                                              value);
                                                                    });
                                                                  },
                                                                ),
                                                                SizedBox(
                                                                    height: AppDimensions
                                                                        .height20),
                                                                TextField(
                                                                  autofocus:
                                                                      true,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(),
                                                                    hintText: experienceModel[
                                                                            index]
                                                                        .getCompanyDescription(),
                                                                  ),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      experienceModel[
                                                                              index]
                                                                          .setCompanyDescription(
                                                                              value);
                                                                    });
                                                                  },
                                                                ),
                                                                SizedBox(
                                                                    height: AppDimensions
                                                                        .height20),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          TextField(
                                                                        autofocus:
                                                                            true,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          focusedBorder:
                                                                              OutlineInputBorder(),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(),
                                                                          hintText:
                                                                              experienceModel[index].getStartDate(),
                                                                        ),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            experienceModel[index].setStartDate(value);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: AppDimensions.width10 *
                                                                            2),
                                                                    Expanded(
                                                                      child:
                                                                          TextField(
                                                                        autofocus:
                                                                            true,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          focusedBorder:
                                                                              OutlineInputBorder(),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(),
                                                                          hintText:
                                                                              experienceModel[index].getEndDate(),
                                                                        ),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            experienceModel[index].setEndDate(value);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: AppDimensions
                                                                        .height20),
                                                                TextField(
                                                                  autofocus:
                                                                      true,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(),
                                                                    hintText:
                                                                        'Activity',
                                                                  ),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      experienceModel[
                                                                              index]
                                                                          .addOperationItem(
                                                                              value);
                                                                    });
                                                                  },
                                                                ),
                                                                SizedBox(
                                                                    height: AppDimensions
                                                                        .height20),
                                                                TextField(
                                                                  autofocus:
                                                                      true,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(),
                                                                    hintText:
                                                                        'Activity',
                                                                  ),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      experienceModel[
                                                                              index]
                                                                          .addOperationItem(
                                                                              value);
                                                                    });
                                                                  },
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        AppDimensions.height20 *
                                                                            2),
                                                              ],
                                                            ),
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                    AppStrings
                                                                        .cancel)),
                                                            TextButton(
                                                                onPressed: () {
                                                                  //get the text in the textField via the pop() method
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();

                                                                  summaryController
                                                                      .clear();
                                                                },
                                                                child: Text(
                                                                  AppStrings
                                                                      .save,
                                                                  style: const TextStyle(
                                                                      color: AppColors
                                                                          .mainColor),
                                                                )),
                                                          ],
                                                        );
                                                      });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  textStyle: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10 *
                                                          1.4),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppDimensions
                                                                    .height1 *
                                                                3),
                                                  ),
                                                ),
                                                child: Text('Edit')),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: AppDimensions.height10),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

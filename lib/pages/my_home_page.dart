import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume/constants/app_colors.dart';
import 'package:resume/constants/app_dimensions.dart';
import 'package:resume/model/experience.dart';
import 'package:resume/model/profile.dart';
import 'package:resume/pages/main_edit_page.dart';

import '../constants/app_strings.dart';
import '../widgets/contact_tag.dart';
import '../widgets/experience_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    AppDimensions().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0.15,
        shadowColor: Colors.blueGrey,
        title: Text(
          AppStrings.appTitle,
        ),
        actions: [
          PopupMenuButton(onSelected: (value) {
            handleSelected(value);
          }, itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.edit),
                      const Icon(Icons.edit),
                    ]),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.logout),
                      const Icon(Icons.exit_to_app),
                    ]),
              ),
            ];
          })
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.width10 * 0.6,
              vertical: AppDimensions.height20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: AppDimensions.width10, top: AppDimensions.height10),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 / 2),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Profile Image
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                contentPadding: const EdgeInsets.all(0),
                                content: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height6),
                                  child: Image.asset(AppStrings.profileImage),
                                ),
                              );
                            });
                      },
                      child: CircleAvatar(
                        radius: AppDimensions.height100 * 0.62,
                        child: CircleAvatar(
                          radius: AppDimensions.height100 * 0.6,
                          backgroundImage: AssetImage(AppStrings.profileImage),
                        ),
                      ),
                    ),
                    //Contact info
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: AppDimensions.width10 * 1.5,
                            top: AppDimensions.height10 * 1.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(profile.getName(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: AppColors.primaryTextColor,
                                        letterSpacing: 3.5,
                                        wordSpacing: 10,
                                        fontSize:
                                            AppDimensions.height20 * 1.3)),
                            Text(
                              profile.getRole(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.primaryTextColor),
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                ContactTag(
                                    contact: profile.getPhoneNumber(),
                                    icon: Icons.phone),
                                ContactTag(
                                    contact: profile.getEmail(),
                                    icon: Icons.mail_outline_outlined),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //About
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.width10 * 1.6,
                    vertical: AppDimensions.height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDimensions.height10 * 1.8),
                    Text(
                      'About',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontSize: AppDimensions.height20 * 1.2,
                              color: AppColors.mainColor2),
                    ),
                    Divider(
                      thickness: AppDimensions.height1 * 0.3,
                    ),
                    SizedBox(height: AppDimensions.height6),
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
              //Experience
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.width10 * 1.6,
                    vertical: AppDimensions.height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDimensions.height10 * 1.8),
                    Text(
                      'Experience',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontSize: AppDimensions.height20 * 1.2,
                              color: AppColors.mainColor2),
                    ),
                    Divider(
                      thickness: AppDimensions.height1 * 0.3,
                    ),
                    SizedBox(height: AppDimensions.height6),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: experienceModel.length,
                        itemBuilder: (context, index) {
                          return Experience(
                            roleTitle: experienceModel[index].getRole(),
                            roleIndication:
                                '${experienceModel[index].getStartDate()} - ${experienceModel[index].getEndDate()}',
                            company: experienceModel[index].getCompany(),
                            location: experienceModel[index].getLocation(),
                            companyDesc:
                                experienceModel[index].getCompanyDescription(),
                            operation: experienceModel[index].getOperations(),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  handleSelected(int item) {
    switch (item) {
      case 1:
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const MainEditPage();
          }));
        });
        break;
      case 2:
        SystemNavigator.pop();
        break;
    }
  }
}

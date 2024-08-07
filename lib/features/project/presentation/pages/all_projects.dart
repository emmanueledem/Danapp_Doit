import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:danapp_doit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AllProjects extends StatefulWidget {
  const AllProjects({super.key});

  @override
  State<AllProjects> createState() => _AllProjectsState();
}

class _AllProjectsState extends State<AllProjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey4,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.grey, width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: SvgPicture.asset(AppAssets.backIcon),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.createProject);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: AppColors.blue,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 19,
                        ),
                        child: TextRegular(
                          'Create Project',
                          color: AppColors.blue,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    TextBold(
                      'Projects',
                      fontWeight: FontWeight.w500,
                      color: AppColors.black1,
                    ),
                    const Gap(16),
                    ListView.builder(
                      itemCount: 7,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ProjectsContainer(
                          taskName: 'Liberty Pay ',
                          startDate: '27-3-2022',
                          endDate: '27-3-2022',
                          percentage: '40%',
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.addTask);
                          },
                          dContainerColor: AppColors.green2,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

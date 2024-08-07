import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/core/constants/constants.dart';
import 'package:danapp_doit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TextBold(
                        'Hi Dexter',
                        fontWeight: FontWeight.w500,
                      ),
                      const Gap(1),
                      TextRegular(
                        'Welcome onboard',
                        fontSize: 12,
                        color: AppColors.blue,
                      ),
                    ],
                  ),
                  SvgPicture.asset(AppAssets.notifications),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: HomeStatistics(
                                icon: AppAssets.homeProjectsIcon,
                                title: 'Projects',
                                number: '14',
                                backgroundColor: AppColors.lightYellow,
                                iconBackgroundColor: AppColors.orange,
                              ),
                            ),
                            Gap(20),
                            Expanded(
                              child: HomeStatistics(
                                icon: AppAssets.homeTaskIcon,
                                title: 'Tasks',
                                number: '24',
                                backgroundColor: AppColors.lightBlue,
                                iconBackgroundColor: AppColors.blue,
                              ),
                            ),
                          ],
                        ),
                        Gap(20),
                        Row(
                          children: [
                            Expanded(
                              child: HomeStatistics(
                                icon: AppAssets.homeCompletedTaskIcon,
                                title: 'Completed Task',
                                number: '12',
                                backgroundColor: AppColors.green,
                                iconBackgroundColor: AppColors.green1,
                              ),
                            ),
                            Gap(20),
                            Expanded(
                              child: HomeStatistics(
                                icon: AppAssets.homeOverdueTaskIcon,
                                title: 'Overdue Task',
                                number: '2',
                                backgroundColor: AppColors.grey3,
                                iconBackgroundColor: AppColors.darkGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: AppColors.grey4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 25,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBold(
                                'Task in Progress',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black1,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  RouteName.allTasks,
                                ),
                                child: TextBold(
                                  'See all',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blue,
                                ),
                              ),
                            ],
                          ),
                          const Gap(12),
                          ListView.builder(
                            itemCount: 3,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return const TaskContainer(
                                taskName: 'Liberty Pay Loan App',
                                startDate: '27-3-2022',
                                endDate: '27-3-2022',
                                percentage: '40%',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
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

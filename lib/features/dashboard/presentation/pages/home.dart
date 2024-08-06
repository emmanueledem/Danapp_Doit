import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/core/constants/constants.dart';
import 'package:danapp_doit/features/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
                              TextBold(
                                'See all',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue,
                              ),
                            ],
                          ),
                          const Gap(12),
                          ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10.06),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextRegular(
                                            'Liberty Pay Loan App',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 2,
                                              ),
                                              child: TextRegular(
                                                '4d',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(6),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextRegular(
                                                'Team members',
                                                fontSize: 10,
                                                color: AppColors.grey5,
                                              ),
                                              const Gap(6),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    AppAssets.userImage1,
                                                  ),
                                                  const Gap(6),
                                                  Image.asset(
                                                    AppAssets.userImage2,
                                                  ),
                                                  const Gap(6),
                                                  Image.asset(
                                                    AppAssets.userImage3,
                                                  ),
                                                ],
                                              ),
                                              const Gap(9),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SvgPicture.asset(
                                                    AppAssets.orangeDate,
                                                  ),
                                                  const Gap(8),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      TextRegular(
                                                        'Start',
                                                        fontSize: 10,
                                                        color: AppColors.red1,
                                                      ),
                                                      const Gap(1),
                                                      TextRegular(
                                                        '27-3-2022',
                                                        fontSize: 10,
                                                        color: AppColors.grey5,
                                                      ),
                                                    ],
                                                  ),
                                                  const Gap(14),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      TextRegular(
                                                        'End',
                                                        fontSize: 10,
                                                        color: AppColors.green2,
                                                      ),
                                                      const Gap(1),
                                                      TextRegular(
                                                        '27-3-2022',
                                                        fontSize: 10,
                                                        color: AppColors.grey5,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          CircularPercentIndicator(
                                            radius: 25,
                                            lineWidth: 2,
                                            percent: 0.50,
                                            center: TextRegular(
                                              '40%',
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.green3,
                                            ),
                                            progressColor: AppColors.green3,
                                            backgroundColor: AppColors.green4,
                                          ),
                                        ],
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

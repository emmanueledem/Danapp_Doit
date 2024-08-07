import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({
    required this.taskName,
    required this.startDate,
    required this.endDate,
    required this.percentage,
    required this.onTap,
    this.dContainerColor = AppColors.primaryColor,
    super.key,
  });
  final String taskName;
  final String startDate;
  final String endDate;
  final Color dContainerColor;
  final String percentage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.06),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextRegular(
                    taskName,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: dContainerColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            AppAssets.orangeDate,
                          ),
                          const Gap(8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextRegular(
                                'Start',
                                fontSize: 10,
                                color: AppColors.red1,
                              ),
                              const Gap(1),
                              TextRegular(
                                startDate,
                                fontSize: 10,
                                color: AppColors.grey5,
                              ),
                            ],
                          ),
                          const Gap(14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextRegular(
                                'End',
                                fontSize: 10,
                                color: AppColors.green2,
                              ),
                              const Gap(1),
                              TextRegular(
                                endDate,
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
                      percentage,
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
    );
  }
}

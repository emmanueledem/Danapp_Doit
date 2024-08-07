import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProjectsContainer extends StatelessWidget {
  const ProjectsContainer({
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
    return Container(
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
                Row(
                  children: [
                    Image.asset(AppAssets.projectLogo),
                    const Gap(10),
                    TextRegular(
                      taskName,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
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
            const Gap(17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                GestureDetector(
                  onTap: onTap,
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
                        horizontal: 12,
                      ),
                      child: TextRegular(
                        'Add Task',
                        color: AppColors.blue,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

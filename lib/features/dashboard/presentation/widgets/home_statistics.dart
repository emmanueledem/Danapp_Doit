import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeStatistics extends StatelessWidget {
  const HomeStatistics({
    required this.iconBackgroundColor,
    required this.backgroundColor,
    required this.icon,
    required this.title,
    required this.number,
    super.key,
  });

  final Color iconBackgroundColor;
  final Color backgroundColor;
  final String icon;
  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconBackgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      icon,
                    ),
                  ),
                ),
                TextBold(
                  number,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  style: const TextStyle(color: AppColors.black),
                ),
              ],
            ),
            const Gap(39),
            TextRegular(title, color: AppColors.black),
          ],
        ),
      ),
    );
  }
}

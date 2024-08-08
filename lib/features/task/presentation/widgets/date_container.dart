import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

Widget dateContainer({
  required VoidCallback onTap,
  required String purpose,
  required String dateText,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextRegular(
            purpose,
            fontSize: 12,
            color: AppColors.grey1,
          ),
          const Gap(14),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.grey1,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    AppAssets.formCalendar,
                    // ignore: deprecated_member_use
                    color: AppColors.textColor,
                  ),
                  const Gap(8.07),
                  TextRegular(
                    dateText,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey5,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

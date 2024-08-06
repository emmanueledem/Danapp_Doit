import 'package:danapp_doit/app/styles/styles.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(AppAssets.backIcon),
                  ),
                ),
              ),
              const Gap(16),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    TextBold(
                      'Create\nAccount',
                      color: AppColors.textColor,
                    ),
                    const Gap(16),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Please fill the details below to\n',
                            style: TextStyle(
                              fontFamily: AppFonts.roboto,
                              fontSize: 14,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'create a',
                            style: TextStyle(
                              fontFamily: AppFonts.roboto,
                              fontSize: 14,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' DO-IT ',
                            style: TextStyle(
                              fontFamily: AppFonts.roboto,
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'account',
                            style: TextStyle(
                              fontFamily: AppFonts.roboto,
                              fontSize: 14,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(24),
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

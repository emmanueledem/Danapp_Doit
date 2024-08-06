import 'package:danapp_doit/app/styles/styles.dart';
import 'package:danapp_doit/app/view/view.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreenView extends StatefulWidget {
  const WelcomeScreenView({super.key});

  @override
  State<WelcomeScreenView> createState() => _WelcomeScreenViewState();
}

class _WelcomeScreenViewState extends State<WelcomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SvgPicture.asset(AppAssets.multiColorDots),
                    ),
                    const Gap(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(AppAssets.doIt),
                        const SizedBox(
                          height: 10,
                        ),
                        SvgPicture.asset(AppAssets.belowIconLine),
                      ],
                    ),
                  ],
                ),
                const Gap(89),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.light2,

                            offset: Offset(
                              5,
                              5,
                            ), // changes position of shadow
                          ),
                          BoxShadow(
                            color: AppColors.light,

                            offset: Offset(
                              -5,
                              -5,
                            ), // changes position of shadow
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        AppAssets.check,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.light2,

                                  offset: Offset(
                                    5,
                                    5,
                                  ), // changes position of shadow
                                ),
                                BoxShadow(
                                  color: AppColors.light,

                                  offset: Offset(
                                    -5,
                                    -5,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(AppAssets.checkList),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.light2,

                                  offset: Offset(
                                    5,
                                    5,
                                  ), // changes position of shadow
                                ),
                                BoxShadow(
                                  color: AppColors.light,

                                  offset: Offset(
                                    -5,
                                    -5,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                              AppAssets.calender,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Image.asset(
                    AppAssets.largeCalender,
                  ),
                ),
                const Gap(61),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Just ',
                        style: TextStyle(
                          fontFamily: AppFonts.roboto,
                          fontSize: 24,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'DO-IT',
                        style: TextStyle(
                          fontFamily: AppFonts.roboto,
                          fontSize: 24,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(17),
                BusyButton(
                  title: 'Create account',
                  onpress: () {
                    Navigator.pushNamed(context, RouteName.createAccount);
                  },
                ),
                const Gap(7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextRegular(
                      'Already have an account?',
                      color: AppColors.deactivatedColor,
                    ),
                    const Gap(11),
                    TextRegular(
                      'Sign in',
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
